#include "pgrcameraqml_plugin.h"
#include "pgrcamera.h"

#include <qqml.h>

void PgrcameraqmlPlugin::registerTypes(const char *uri)
{
    // @uri com.chili.pgrcameraqml
    qmlRegisterType<PGRCamera>(uri, 1, 0, "PGRCamera");
}


