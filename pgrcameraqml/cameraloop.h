#ifndef CAMERALOOP_H
#define CAMERALOOP_H

#include "stdafx.h"
#include "flycapture/FlyCapture2.h"
#include <opencv2/core/core.hpp>
#include <QThread>
#include <QDebug>

class CameraLoop : public QObject
{
    Q_OBJECT

public:
    CameraLoop(FlyCapture2::Camera* camera);
public slots:
    void start();
signals:
    void frameCaptured(cv::Mat frame);
private:
    FlyCapture2::Camera* cam;

};

#endif // CAMERALOOP_H
