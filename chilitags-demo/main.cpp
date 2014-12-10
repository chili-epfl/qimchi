#include <QtQml>
#include <QGuiApplication>
#include <QQmlApplicationEngine>


// Some stuff used by the main(); function
#include <QLatin1String>
#include <QFile>
#include <QTextStream>
#include "fileio.h"

Q_DECL_EXPORT int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);


    // Declaring your C++ class to the QML system
    qmlRegisterType<FileIO>("MyCustomClasses", 1, 0, "FileIOQML");

    QQmlApplicationEngine engine;

    // Specify where to look for compiled Qimchi plugins
    engine.addImportPath("../imports");

    engine.load(QUrl(QStringLiteral("qrc:///main.qml")));


    return app.exec();
}
