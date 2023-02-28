#include <QtCore/QTextStream>
#include <QtGui/QGuiApplication>
#include <QtQml/QQmlApplicationEngine>
#include <QtQuick/QQuickItem>
#if QT_CONFIG(ssl)
#include <QSslSocket>
#endif
#include <QQmlContext>

static bool parseArgs(QStringList& args, QVariantMap& parameters)
{

    while (!args.isEmpty()) {

        QString param = args.takeFirst();

        if (param.startsWith("--help")) {
            QTextStream out(stdout);
            out << "Usage: " << Qt::endl;
            out << "--plugin.<parameter_name> <parameter_value>    -  Sets parameter = value for plugin" << Qt::endl;
            out.flush();
            return true;
        }

        if (param.startsWith("--plugin.")) {

            param.remove(0, 9);

            if (args.isEmpty() || args.first().startsWith("--")) {
                parameters[param] = true;
            } else {

                QString value = args.takeFirst();

                if (value == "true" || value == "on" || value == "enabled") {
                    parameters[param] = true;
                } else if (value == "false" || value == "off"
                           || value == "disable") {
                    parameters[param] = false;
                } else {
                    parameters[param] = value;
                }
            }
        }
    }
    return false;
}

int main(int argc, char *argv[])
{
#if QT_CONFIG(library)
    const QByteArray additionalLibraryPaths = qgetenv("QTLOCATION_EXTRA_LIBRARY_PATH");
    for (const QByteArray &p : additionalLibraryPaths.split(':'))
        QCoreApplication::addLibraryPath(QString(p));
#endif
    QGuiApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
    QGuiApplication application(argc, argv);

    QVariantMap parameters;
    QStringList args(QCoreApplication::arguments());

    // Fetch tokens from the environment, if present
    const QByteArray mapboxMapID = qgetenv("mapbox.streets");
    const QByteArray mapboxAccessToken = qgetenv("sk.eyJ1Ijoic2VtZW4wNDAxMDMiLCJhIjoiY2xlbjM5dTV0MTEwNDN2b2RqeDU0anF6YSJ9.TkokadV0bBysqrpz0ISILw");
    const QByteArray hereAppID = qgetenv("HERE_APP_ID");
    const QByteArray hereToken = qgetenv("HERE_TOKEN");
    const QByteArray esriToken = qgetenv("ESRI_TOKEN");

    if (!mapboxMapID.isEmpty())
        parameters["mapbox.streets"] = QString::fromLocal8Bit(mapboxMapID);
    if (!mapboxAccessToken.isEmpty()) {
        parameters["sk.eyJ1Ijoic2VtZW4wNDAxMDMiLCJhIjoiY2xlbjM5dTV0MTEwNDN2b2RqeDU0anF6YSJ9.TkokadV0bBysqrpz0ISILw"] = QString::fromLocal8Bit(mapboxAccessToken);
        parameters["sk.eyJ1Ijoic2VtZW4wNDAxMDMiLCJhIjoiY2xlbjM5dTV0MTEwNDN2b2RqeDU0anF6YSJ9.TkokadV0bBysqrpz0ISILw"] = QString::fromLocal8Bit(mapboxAccessToken);
    }
    if (!hereAppID.isEmpty())
        parameters["here.app_id"] = QString::fromLocal8Bit(hereAppID);
    if (!hereToken.isEmpty())
        parameters["here.token"] = QString::fromLocal8Bit(hereToken);
    if (!esriToken.isEmpty())
        parameters["esri.token"] = QString::fromLocal8Bit(esriToken);

    if (parseArgs(args, parameters))
        return 0;
    if (!args.contains(QStringLiteral("osm.useragent")))
        parameters[QStringLiteral("osm.useragent")] = QStringLiteral("QtLocation Mapviewer example");
  // UrlTemplate : "https://tile.thunderforest.com/cycle/{z}/{x}/{y}.png?apikey=e0bed14e1d444c53b7ce11e005f2e03a";

    QQmlApplicationEngine engine;
#if QT_CONFIG(ssl)
    engine.rootContext()->setContextProperty("supportsSsl", QSslSocket::supportsSsl());
#else
    engine.rootContext()->setContextProperty("supportsSsl", false);
#endif
    engine.addImportPath(QStringLiteral(":/imports"));
    engine.load(QUrl(QStringLiteral("qrc:///mapviewer.qml")));
    QObject::connect(&engine, SIGNAL(quit()), qApp, SLOT(quit()));

    QObject *item = engine.rootObjects().first();
    Q_ASSERT(item);

    QMetaObject::invokeMethod(item, "initializeProviders",
                              Q_ARG(QVariant, QVariant::fromValue(parameters)));

    return application.exec();
}
