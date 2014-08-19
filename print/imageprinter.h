#ifndef IMAGE_PRINTER_H
#define IMAGE_PRINTER_H

#include <QObject>
#include <QRect>

// A very simple way to print images given their path and a position/size on
// the page (in millimeters).
// More properties could be added from the QPrinter API, especially a way to
// select the printer to use (instead the default printer of the system)
class ImagePrinter : public QObject
{
    Q_OBJECT

    Q_PROPERTY(QString  imagePath
               READ     imagePath
               WRITE setImagePath
               NOTIFY   imagePathChanged)

    // in millimeters
    Q_PROPERTY(QRect  boundingRect
               READ     boundingRect
               WRITE setBoundingRect
               NOTIFY   boundingRectChanged)

public:
    explicit ImagePrinter(QObject *parent = 0);

    Q_INVOKABLE void print();

    QString    imagePath() { return m_imagePath; }
    void  setImagePath(QString      imagePath) {
        if  (imagePath ==         m_imagePath) return;
           m_imagePath =            imagePath;
        emit imagePathChanged();
    }

    QRect    boundingRect() { return m_boundingRect; }
    void  setBoundingRect(QRect        boundingRect) {
        if  (boundingRect ==         m_boundingRect) return;
           m_boundingRect =            boundingRect;
        emit boundingRectChanged();
    }


signals:
    void    imagePathChanged();
    void boundingRectChanged();

public slots:

protected:
    QString m_imagePath;
    QRect   m_boundingRect;
};

#endif // IMAGE_PRINTER_H
