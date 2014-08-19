#include "imageprinter.h"

#include <QImage>
#include <QtPrintSupport/QPrinter>
#include <QPainter>

namespace {
    static const qreal mm2in = 1./25.4;
}

ImagePrinter::ImagePrinter(QObject *parent) :
    QObject(parent)
{
}

void ImagePrinter::print() {
    QImage img(m_imagePath);

    QPrinter printer;
    printer.setColorMode(QPrinter::Color);

    // try to set the best resolution, but use printer.resolution() afterwards
    // instead of newResolution, in case the printer didn't want to change.
    int newResolution = std::max( img.width()  / (150. * mm2in),
                                  img.height() / (100. * mm2in));
    printer.setResolution(newResolution);

    qreal mm2px = mm2in*printer.resolution();

    QImage scaled = img.scaled(boundingRect().size()*mm2px,
        Qt::KeepAspectRatio,
        Qt::SmoothTransformation);

    // This activates the printer (so the resolution can't change anymore)
    QPainter painter(&printer);
    painter.drawImage(m_boundingRect.topLeft()*mm2px, scaled);
    painter.end();
}
