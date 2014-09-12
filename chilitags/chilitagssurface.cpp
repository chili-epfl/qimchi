#include "chilitagssurface.h"

#include "chilitagsdetection.h"

#include <QVideoSurfaceFormat>

//TODO: move conversion to chilitags
#include <opencv2/imgproc/imgproc.hpp>
#include <opencv2/highgui/highgui.hpp>

ChilitagsSurface::ChilitagsSurface(QObject *parent)
    :  QAbstractVideoSurface(parent)
    , m_item(*(ChilitagsDetection *)parent)
    , m_chilitags()
    , m_tags()
    , m_converted()
    , m_videoSurface(0)
    //, m_timer()
{
    //m_chilitags.getChilitags().setMaxInputWidth(640);
    //m_chilitags.getChilitags().setMinInputWidth(100);
    //m_timer.start();
}

QList<QVideoFrame::PixelFormat> ChilitagsSurface::supportedPixelFormats(
            QAbstractVideoBuffer::HandleType handleType) const {
    if (handleType == QAbstractVideoBuffer::NoHandle) {
        return QList<QVideoFrame::PixelFormat>()
                //adding this makes the framerate slower for some reason
                << QVideoFrame::Format_UYVY
                //<< QVideoFrame::Format_Y8
            //FIXME: I thought we had BGR...
                << QVideoFrame::Format_RGB24;
    }
    return QList<QVideoFrame::PixelFormat>();
}

bool ChilitagsSurface::isFormatSupported(const QVideoSurfaceFormat &format) const {
    if (m_videoSurface) return m_videoSurface->isFormatSupported(format)
            && QAbstractVideoSurface::isFormatSupported(format);
    return QAbstractVideoSurface::isFormatSupported(format);
}

QVideoSurfaceFormat ChilitagsSurface::nearestFormat(const QVideoSurfaceFormat &) const
{
    qDebug() << "Not implemented: ChilitagsSurface::nearestFormat";
    return QVideoSurfaceFormat();
}


bool ChilitagsSurface::start(const QVideoSurfaceFormat &format) {
    QVideoSurfaceFormat outputFormat(format.frameSize(),
                                     QVideoFrame::Format_ARGB32);
    //if (m_videoSurface) {
    //    qDebug() << m_videoSurface->supportedPixelFormats();
    //    qDebug() << m_videoSurface->isFormatSupported(outputFormat);
    //    qDebug() << outputFormat;
    //}
    if (m_videoSurface) return m_videoSurface->start(outputFormat)
            && QAbstractVideoSurface::start(format);
    return QAbstractVideoSurface::start(format);
}

void ChilitagsSurface::stop() {
    if (m_videoSurface) m_videoSurface->stop();
    QAbstractVideoSurface::stop();
}


bool ChilitagsSurface::present(const QVideoFrame &frame) {

    //qDebug("time: %d", m_timer.elapsed());
    //qDebug("newFrame: %dx%d", frame.width(), frame.height());
    //m_timer.restart();

    QVideoFrame copy = frame;
    //if (m_frame.pixelFormat() == QVideoFrame::Format_UYVY) {
    if (copy.map(QAbstractVideoBuffer::ReadOnly)) {
        const cv::Mat mat(copy.height(), copy.width(), CV_8UC3,
                          copy.bits());
        if (m_videoSurface) {
            m_converted.create(copy.height(), copy.width(), CV_8UC4);
            cv::cvtColor(mat, m_converted, CV_BGR2RGBA);
        }

        m_item.setTags(m_chilitags.estimate(mat,chilitags::Chilitags::DETECT_ONLY));

        copy.unmap();
    }

    //qDebug("%lu tags", m_tags.size());

    if (m_videoSurface) {
        QImage image(m_converted.data,
                     m_converted.cols, m_converted.rows,
                     QImage::Format_ARGB32);
        return m_videoSurface->present(QVideoFrame(image));
    }

    return true;
}
