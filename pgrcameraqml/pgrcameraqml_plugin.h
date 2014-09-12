#ifndef PGRCAMERAQML_PLUGIN_H
#define PGRCAMERAQML_PLUGIN_H

#include <QQmlExtensionPlugin>

class PgrcameraqmlPlugin : public QQmlExtensionPlugin
{
    Q_OBJECT
    Q_PLUGIN_METADATA(IID "org.qt-project.Qt.QQmlExtensionInterface")

public:
    void registerTypes(const char *uri);
};

#endif // PGRCAMERAQML_PLUGIN_H

