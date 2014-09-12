#include <QApplication>
#include <QQmlApplicationEngine>
#include <opencv2/core/core.hpp>
Q_DECLARE_METATYPE(cv::Mat)
int main(int argc, char *argv[])
{
    QApplication app(argc, argv);
    qRegisterMetaType< cv::Mat >("cv::Mat");
    QQmlApplicationEngine engine;
    engine.load(QUrl(QStringLiteral("qrc:///main.qml")));

    return app.exec();
}
