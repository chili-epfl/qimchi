#include "ocvcameraqml_plugin.h"
#include "ocvcamera.h"
#include <qqml.h>

void OCVCameraQMLPlugin::registerTypes(const char *uri)
{
    // @uri com.mycompany.qmlcomponents
    qmlRegisterType<OCVCamera>(uri, 1, 0, "OCVCamera");

}


