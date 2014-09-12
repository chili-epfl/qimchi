#ifndef CHILITAGS_PLUGIN_H
#define CHILITAGS_PLUGIN_H

#include <QQmlExtensionPlugin>

class ChilitagsPlugin : public QQmlExtensionPlugin
{
    Q_OBJECT
    Q_PLUGIN_METADATA(IID "org.qt-project.Qt.QQmlExtensionInterface")

public:
    void registerTypes(const char *uri);
};

#endif // CHILITAGS_PLUGIN_H

