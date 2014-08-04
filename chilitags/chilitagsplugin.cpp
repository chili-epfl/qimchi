#include "chilitagsplugin.h"

#include "chilitagsdetection.h"
#include "chilitagsobject.h"
#include "transform.h"

#include <qqml.h>

void ChilitagsPlugin::registerTypes(const char *uri)
{
    qmlRegisterType<ChilitagsDetection>(uri, 1, 0, "ChilitagsDetection");
    qmlRegisterType<ChilitagsObject>(uri, 1, 0, "ChilitagsObject");
    qmlRegisterType<Transform>(uri, 1, 0, "Transform");
}
