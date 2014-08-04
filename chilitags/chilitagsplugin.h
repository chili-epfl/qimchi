#ifndef CHILITAGSPLUGIN_H
#define CHILITAGSPLUGIN_H

#include <QQmlExtensionPlugin>

class ChilitagsPlugin : public QQmlExtensionPlugin
{
    Q_OBJECT
    Q_PLUGIN_METADATA(IID "org.qt-project.Qt.QQmlExtensionInterface")

public:
    void registerTypes(const char *uri);
};

#endif // CHILITAGSPLUGIN_H
