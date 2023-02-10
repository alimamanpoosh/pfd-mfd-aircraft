#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include <QFontDatabase>
#include <QQuickStyle>
#include "h/CFile1.h"
#include "h/CTCP1.h"
#include "h/CUDP1.h"
#include "h/CSpec1.h"
#include <QQuickWindow>

int main(int argc, char *argv[])
{
    //////////////QT
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

    //////////Esmaeili
    qmlRegisterType<CFile2>("CFile3", 1, 0, "CFile4");
    qmlRegisterType<CTCP2>("CTCP3", 1, 0, "CTCP4");
    qmlRegisterType<CUDP2>("CUDP3", 1, 0, "CUDP4");
    qmlRegisterType<CSpec2>("CSpec3", 1, 0, "CSpec4");

    //////////////QT
    QGuiApplication app(argc, argv);

    ///////////////Jafari
    QQuickStyle::setStyle("Material");

    //////////////QT
    QQmlApplicationEngine engine;
    const QUrl url(QStringLiteral("qrc:/qml/Main.qml"));

    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated, &app, [url](QObject *obj, const QUrl &objUrl)
    {if (!obj && url == objUrl)  QCoreApplication::exit(-1);}, Qt::QueuedConnection);

    ///////////////Hamzeh
    QFontDatabase::addApplicationFont(":/font/framd.ttf");
    //QFont fon("LiberationMono-Regular", 11); //app.setFont(fon);
    //////////////QT
    engine.load(url);

    //qDebug()<<engine.rootObjects();
    QQuickWindow *wnd1 = engine.rootObjects()[0]->findChild<QQuickWindow *>("Wind1");/////
    if(wnd1) wnd1->setTitle("chichi");                                               /////

    return app.exec();

    //QQuickWindow *wnd2 = engine.rootObjects()[0]->findChild<QQuickWindow *>("wnd2");
    //if(wnd2) wnd2->setTitle("Client");
}

