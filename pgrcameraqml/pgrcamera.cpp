#include "pgrcamera.h"

PGRCamera::PGRCamera(QQuickItem *parent):
    QQuickItem(parent)
{
    // By default, QQuickItem does not draw anything. If you subclass
    // QQuickItem to create a visual item, you will need to uncomment the
    // following line and re-implement updatePaintNode()

    // setFlag(ItemHasContents, true);
    Error error;
    BusManager busMgr;
    unsigned int numCameras;
    error = busMgr.GetNumOfCameras(&numCameras);
    if (error != PGRERROR_OK)

    {
        qDebug()<<"Error";
    }
    PGRGuid guid;
    error = busMgr.GetCameraFromIndex(0, &guid);
    if (error != PGRERROR_OK)
    {
        qDebug()<<"Error";
    }

    Camera cam;
    error = cam.Connect(&guid);
    if (error != PGRERROR_OK)
    {
        qDebug()<<"Error";
    }
    error = cam.StartCapture();
    if (error != PGRERROR_OK)
    {
        qDebug()<<"Error";
    }
    Image rawImage;
    error = cam.RetrieveBuffer( &rawImage );
    rawImage.Save("dddd.pgm");
}

PGRCamera::~PGRCamera()
{

}

