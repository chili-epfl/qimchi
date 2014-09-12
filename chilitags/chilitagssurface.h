#ifndef CHILITAGSSURFACE_H
#define CHILITAGSSURFACE_H

#include <QAbstractVideoSurface>

class ChilitagsDetection;
#include <chilitags/chilitags.hpp>

//TODO expose framerate as a property
//#include <QTime>

class ChilitagsSurface : public QAbstractVideoSurface
{
    Q_OBJECT
public:
    explicit ChilitagsSurface(QObject *parent = 0);

    virtual QList<QVideoFrame::PixelFormat> supportedPixelFormats(
                QAbstractVideoBuffer::HandleType handleType =
                    QAbstractVideoBuffer::NoHandle) const;

    virtual bool isFormatSupported(const QVideoSurfaceFormat &format) const;

    virtual QVideoSurfaceFormat nearestFormat(const QVideoSurfaceFormat &) const;


    virtual bool start(const QVideoSurfaceFormat &format);

    virtual void stop();

    virtual bool present(const QVideoFrame &frame);

    QAbstractVideoSurface *getVideoSurface() const {
        return m_videoSurface;
    }
    void setVideoSurface(QAbstractVideoSurface *videoSurface) {
        m_videoSurface = videoSurface;
    }

    chilitags::Chilitags3D &getChilitags() { return m_chilitags; }
    const chilitags::Chilitags3D &getChilitags() const { return m_chilitags; }

signals:

public slots:

private:
    ChilitagsDetection &m_item;

    chilitags::Chilitags3D m_chilitags;
    std::map<std::string, cv::Matx44d> m_tags;

    cv::Mat m_converted;
    QAbstractVideoSurface* m_videoSurface;

    //QTime m_timer;
};

#endif // CHILITAGSSURFACE_H
