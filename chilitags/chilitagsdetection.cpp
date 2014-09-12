#include "chilitagsdetection.h"

#include <QMediaObject>
#include <QMediaService>
#include <QVideoRendererControl>

ChilitagsDetection::ChilitagsDetection(QQuickItem *parent)
      :  QQuickItem(parent)
      , m_surface(this)
    {
    }

ChilitagsDetection::~ChilitagsDetection(){}


void ChilitagsDetection::setSource(QObject *source) {
    QVariant mediaObjectProperty = source->property("mediaObject");
    QMediaObject *mediaObject =
            qvariant_cast<QMediaObject *>(mediaObjectProperty);
    QMediaService *mediaService = mediaObject->service();
    QVideoRendererControl *rendererControl =
            mediaService->requestControl<QVideoRendererControl *>();
    rendererControl->setSurface(&m_surface);
    m_source = source;
}

void ChilitagsDetection::setTags(const std::map<std::string, cv::Matx44d> &tags) {
    m_tags.clear();
    //qDebug()<<tags.size()<<"\n";
    for (auto tag : tags) {
        // manual conversion from float[16] to double[16]
        float values[16];
        for (int i = 0; i<16; ++i) values[i] = tag.second.val[i];
        m_tags.insert(QString::fromStdString(tag.first), QMatrix4x4(values));
    }
    emit tagsChanged(m_tags);
}

QMatrix4x4 ChilitagsDetection::projectionMatrix() const {
    cv::Mat mat = m_surface.getChilitags().getCameraMatrix();
    QMatrix4x4 projectionMatrix;

    projectionMatrix.fill(0);
    for (int i = 0; i<3; ++i)
        for (int j = 0; j<3; ++j)
            projectionMatrix(i,j) = mat.at<double>(i,j);
    projectionMatrix(3,2) = 1;

    return projectionMatrix;
 }

void ChilitagsDetection::detect(cv::Mat frame){
    setTags(m_surface.getChilitags().estimate(frame));
}


