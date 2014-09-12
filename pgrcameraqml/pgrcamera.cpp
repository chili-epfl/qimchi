#include "pgrcamera.h"

PGRCamera::PGRCamera(QQuickItem *parent):
    QQuickItem(parent)
{
    // By default, QQuickItem does not draw anything. If you subclass
    // QQuickItem to create a visual item, you will need to uncomment the
    // following line and re-implement updatePaintNode()

    // setFlag(ItemHasContents, true);

}

PGRCamera::~PGRCamera()
{

}
QAbstractVideoSurface *PGRCamera::getVideoSurface() const
{
    return videoSurface;
}

void PGRCamera::setVideoSurface(QAbstractVideoSurface *value)
{
    videoSurface = value;
}
int PGRCamera::getDeviceID() const
{
    return deviceID;
}

void PGRCamera::setDeviceID(int value)
{
    deviceID = value;
}
cv::Mat PGRCamera::getFrame() const
{
    return frame;
}

void PGRCamera::start(){
    if(videoSurface){
        QVideoSurfaceFormat format(QSize(640,480),QVideoFrame::Format_RGB565);
        if(!videoSurface->start(format)){
            qDebug()<<"Error starting the video surface. Maybe the format is not compatible";
        }
    }
    Error error;
    BusManager busMgr;

    PGRGuid guid;
    error = busMgr.GetCameraFromIndex(deviceID, &guid);
    if (error != PGRERROR_OK)
    {
        qDebug()<<"Error";
    }

    error = camera.Connect(&guid);
    if (error != PGRERROR_OK)
    {
        qDebug()<<"Error";
    }
    error = camera.StartCapture();
    if (error != PGRERROR_OK)
    {
        qDebug()<<"Error";
    }
    //Start the thread
    cameraWorker=new CameraLoop(&camera);
    cameraWorker->moveToThread(&loopThread);
    connect(cameraWorker,SIGNAL(frameCaptured(cv::Mat)),this,SLOT(capture(cv::Mat)));
    connect(&loopThread, SIGNAL(started()), cameraWorker, SLOT(start()));
    loopThread.start();
    //cameraWorker->start();
}
void PGRCamera::stop(){
    // Stop capturing images
    Error error = camera.StopCapture();
    if (error != PGRERROR_OK)
    {
        qDebug()<<"Error";
    }

    // Disconnect the camera
    error = camera.Disconnect();
    if (error != PGRERROR_OK)
    {
        qDebug()<<"Error";
    }
}
void PGRCamera::capture(cv::Mat frame){
    qDebug()<<"Capture";
    cv::Mat _cvtFrame;
    if(videoSurface){
        cv::cvtColor(frame, _cvtFrame, CV_GRAY2BGR565);
        QImage qt_frame(_cvtFrame.data,_cvtFrame.cols,_cvtFrame.rows,_cvtFrame.step,QImage::Format_RGB16);
        //qDebug()<<qt_frame.save("/storage/sdcard0/test.png","PNG");
        QVideoFrame video_frame(qt_frame);
        if(video_frame.map(QAbstractVideoBuffer::ReadOnly)){
            videoSurface->present(video_frame);
            video_frame.unmap();
        }
    }
    emit(frameCaptured(frame));
}

