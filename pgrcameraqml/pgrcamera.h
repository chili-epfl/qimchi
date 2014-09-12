#ifndef PGRCAMERA_H
#define PGRCAMERA_H

#include <QQuickItem>
#include <QThread>
#include "stdafx.h"
#include "flycapture/FlyCapture2.h"
using namespace FlyCapture2;

class PGRCamera : public QQuickItem,QThread
{
    Q_OBJECT
    Q_DISABLE_COPY(PGRCamera)

public:
    PGRCamera(QQuickItem *parent = 0);
    ~PGRCamera();
};

#endif // PGRCAMERA_H

