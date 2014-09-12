#include "cameraloop.h"

CameraLoop::CameraLoop(FlyCapture2::Camera* camera)
{
    cam=camera;
}
void CameraLoop::start(){

    FlyCapture2::Image rawImage;
    FlyCapture2::Image rgbImage;
    cv::Mat outputImage;
    while(1){
        FlyCapture2::Error error = cam->RetrieveBuffer( &rawImage );
        if (error != FlyCapture2::PGRERROR_OK)
        {
            qDebug()<<"Error in camera loop";
        }

        rawImage.Convert(FlyCapture2::PIXEL_FORMAT_BGR, &rgbImage);

        // convert to OpenCV Mat
        unsigned int rowBytes =(double)rgbImage.GetReceivedDataSize()/(double)rgbImage.GetRows();
        outputImage = cv::Mat(rgbImage.GetRows(), rgbImage.GetCols(), CV_8UC1, rgbImage.GetData(),rowBytes);
        emit frameCaptured(outputImage);
    }
}
