#include <QGuiApplication>
#include <QQmlApplicationEngine>

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;

    // Specify where to look for compiled Qimchi plugins
    engine.addImportPath("../imports");

    engine.load(QUrl(QStringLiteral("qrc:///main.qml")));

    return app.exec();
}
