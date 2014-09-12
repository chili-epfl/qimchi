#include "chilitags_plugin.h"
#include "chilitagsdetection.h"
#include "chilitagsobject.h"
#include "transform.h"

#include <qqml.h>

void ChilitagsPlugin::registerTypes(const char *uri)
{
    // @uri com.chili.chilitags
    qmlRegisterType<ChilitagsDetection>(uri, 1, 0, "ChilitagsDetection");
    qmlRegisterType<ChilitagsObject>(uri, 1, 0, "ChilitagsObject");
    qmlRegisterType<Transform>(uri, 1, 0, "Transform");
}


