#ifndef PRINTPLUGIN_H
#define PRINTPLUGIN_H

#include <QQmlExtensionPlugin>

class PrintPlugin : public QQmlExtensionPlugin
{
    Q_OBJECT
    Q_PLUGIN_METADATA(IID "org.qt-project.Qt.QQmlExtensionInterface")

public:
    void registerTypes(const char *uri);
};

#endif // PRINTPLUGIN_H
