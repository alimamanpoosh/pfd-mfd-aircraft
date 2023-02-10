#include "h/bia_udp.h"


Bia_Udp::Bia_Udp(QObject *parent) : QObject(parent)
{
    socket = new QUdpSocket(this);
    socket->bind(QHostAddress::LocalHost,1234);
    connect(socket,SIGNAL(readyRead()),this,SLOT(readyRead()));
}

void Bia_Udp::readyRead(){
    QByteArray Buffer;
    Buffer.resize(size);
    socket->readDatagram(Buffer.data(),size,&sender,&senderPort);
    data = Buffer.toHex();
Calculate();


//    Buffer.resize(4);
//    socket->readDatagram(Buffer.data(),4,&sender,&senderPort);
//    //if (Buffer == "3A010000") {
//        Buffer.resize(1);
//        socket->readDatagram(Buffer.data(),1,&sender,&senderPort);
//        int Length = Buffer.toInt(&ok,16);
//        Buffer.resize(Length);
//        socket->readDatagram(Buffer.data(),Length,&sender,&senderPort);
//        data = Buffer;
//        Calculate();
//        Buffer.resize(4);
//        socket->readDatagram(Buffer.data(),4,&sender,&senderPort);
//    //}














    //Buffer.resize(size);



    //output = Buffer.toHex();
    //    int l = 2 * size;
    //    for (int j = 0;j<l;j+=2) {
    //        QByteArray hex = output.mid(j,2);
    //        primaryData[j/2] = hex.toInt(&ok, 16);
    //    }
//    QString txt = "";
//    for (int k = 0;k<size;k++) {
//        txt = txt + " " + QString::number(primaryData[k]);
//    }
//    val = primaryData[0]*100 + primaryData[1];
//    roll = val / 100.0 - 50;
//    pitch = val / 62.5 - 80;
//    yaw = (val / 20) % 360;


//    setData(roll,pitch,yaw);

//    //qDebug() << "Message " << i << ": " << txt ;
//    qDebug() << "Message " << i << ": " << primaryData[0] << primaryData[1];

//    i++;

}


void Bia_Udp::Calculate(){
    roll = (data.mid(22,4).toInt(&ok,16))/100;
    //roll = roll > 128 ? roll - 256 : roll;
    pitch = (data.mid(26,4).toInt(&ok,16))/100;
    //pitch = pitch > 128 ? pitch - 256 : pitch;
    yaw = (data.mid(30,4).toInt(&ok,16))/100;
    setData(roll,pitch,yaw);
}
