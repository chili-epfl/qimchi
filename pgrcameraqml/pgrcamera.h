#ifndef PGRCAMERA_H
#define PGRCAMERA_H

#include <QQuickItem>
#include <QThread>
#include <QtMultimedia/QAbstractVideoSurface>
#include <QtMultimedia/QVideoSurfaceFormat>
#include <QImage>
#include "stdafx.h"
#include "flycapture/FlyCapture2.h"
#include "cameraloop.h"
#include <opencv2/imgproc/imgproc.hpp>


using namespace FlyCapture2;

class PGRCamera : public QQuickItem
{
    Q_OBJECT
    Q_DISABLE_COPY(PGRCamera)
    Q_PROPERTY(QAbstractVideoSurface* videoSurface
               READ getVideoSurface WRITE setVideoSurface)
    Q_PROPERTY(int deviceID
               READ getDeviceID WRITE setDeviceID)
    Q_PROPERTY(cv::Mat frame
               READ getFrame NOTIFY frameCaptured)

public:
    PGRCamera(QQuickItem *parent = 0);
    ~PGRCamera();
    QAbstractVideoSurface *getVideoSurface() const;
    void setVideoSurface(QAbstractVideoSurface *value);

    int getDeviceID() const;
    void setDeviceID(int value);

    cv::Mat getFrame() const;

public slots:
    void start();
    void stop();
signals:
    void frameCaptured(cv::Mat frame);
private slots:
    virtual void capture(cv::Mat frame);

private:

    QAbstractVideoSurface* videoSurface;
    int deviceID;
    cv::Mat frame;
    Camera camera;

    CameraLoop* cameraWorker;
    QThread loopThread;

};

#endif // PGRCAMERA_H

