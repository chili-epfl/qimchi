#include "ocvcamera.h"

OCVCamera::OCVCamera(QQuickItem *parent):
    QQuickItem(parent)
{
    // By default, QQuickItem does not draw anything. If you subclass
    // QQuickItem to create a visual item, you will need to uncomment the
    // following line and re-implement updatePaintNode()

    // setFlag(ItemHasContents, true);
}

OCVCamera::~OCVCamera()
{
}

QAbstractVideoSurface *OCVCamera::getVideoSurface() const
{
    return videoSurface;
}

void OCVCamera::setVideoSurface(QAbstractVideoSurface *value)
{
    videoSurface = value;
}

void OCVCamera::capture()
{
    cv::Mat _cvtFrame;
    camera >> frame;
    if(videoSurface){
        /*TODO:Check different color convertions.
        It seems that opencv provides directly a rgb image...
        */
        cv::cvtColor(frame, _cvtFrame, CV_BGR2BGR565);
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
cv::Mat OCVCamera::getFrame() const
{
    return frame;
}

void OCVCamera::start(int timerInterval){
    /*Maybe it's a good idea to switch threads*/
    if(videoSurface){
        QVideoSurfaceFormat format(QSize(640,480),QVideoFrame::Format_RGB565);
        if(!videoSurface->start(format)){
            qDebug()<<"Error starting the video surface. Maybe the format is not compatible";
        }
    }
    connect(&timer, SIGNAL(timeout()),this, SLOT(capture()));
    timer.setInterval(timerInterval);
    timer.start();
}
int OCVCamera::getDeviceID() const
{
    return deviceID;
}

void OCVCamera::setDeviceID(int value)
{
    deviceID = value;
    if(camera.isOpened()){
        if(timer.isActive()) timer.stop();
        camera.release();
    }
    camera.open(deviceID);
}
