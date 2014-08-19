#include "printplugin.h"

#include <qqml.h>

#include "imageprinter.h"

void PrintPlugin::registerTypes(const char *uri)
{
    qmlRegisterType<ImagePrinter>(uri, 1, 0, "ImagePrinter");
}
