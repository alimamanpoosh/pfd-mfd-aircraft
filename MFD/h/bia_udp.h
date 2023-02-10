#ifndef BIA_UDP_H
#define BIA_UDP_H

#include <QObject>
#include <QUdpSocket>

class Bia_Udp : public QObject
{
    Q_OBJECT
public:
    explicit Bia_Udp(QObject *parent = nullptr);

signals:
    void setData(double roll, double pitch, double yaw);

public slots:
    void readyRead();

private:
    QUdpSocket *socket;
    quint32 i = 0;
    int primaryData [21];
    int size = 21;
    QByteArray data;

    QHostAddress sender;
    quint16 senderPort;
    bool ok;

    double roll;
    double pitch;
    double yaw;
    int val;

    void Calculate();
};

#endif // BIA_UDP_H
