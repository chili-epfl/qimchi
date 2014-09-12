#ifndef OCVCAMERA_H
#define OCVCAMERA_H

#include <QQuickItem>
#include <QAbstractVideoSurface>
#include <QVideoSurfaceFormat>
#include <QTimer>
#include <opencv2/highgui/highgui.hpp>
#include <opencv2/imgproc/imgproc.hpp>



class OCVCamera : public QQuickItem
{
    Q_OBJECT
    Q_DISABLE_COPY(OCVCamera)
    Q_PROPERTY(QAbstractVideoSurface* videoSurface
               READ getVideoSurface WRITE setVideoSurface)
    Q_PROPERTY(int deviceID
               READ getDeviceID WRITE setDeviceID)
    Q_PROPERTY(cv::Mat frame
               READ getFrame NOTIFY frameCaptured)
public:
    OCVCamera(QQuickItem *parent = 0);
    ~OCVCamera();
    QAbstractVideoSurface *getVideoSurface() const;
    void setVideoSurface(QAbstractVideoSurface *value);
    int getDeviceID() const;
    void setDeviceID(int value);
    cv::Mat getFrame() const;

public slots:
    void start(int timerInterval=25);
signals:
    void frameCaptured(cv::Mat frame);
private slots:
    virtual void capture();

private:
    QAbstractVideoSurface* videoSurface;
    cv::VideoCapture camera;
    QTimer timer;
    int deviceID;
    cv::Mat frame;
};

#endif // OCVCAMERA_H

