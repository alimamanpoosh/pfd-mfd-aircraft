#ifndef CUDP_H
#define CUDP_H

#include <QUdpSocket>    //UDP
#include <QDateTime>

#define defBiaPacketStart   0x3A       //:
#define defBiaPacketStop1   0x0D       //\r
#define defBiaPacketStop2   0x0A       //\n
#define defBiaPacketSize1   25
#define defBiaPacketSize2   81

class CUDP2 : public QObject
{
    Q_OBJECT

    Q_PROPERTY(int varN1BugValue1 MEMBER m_varN1BugValue1)
    Q_PROPERTY(int varN1BugValue2 MEMBER m_varN1BugValue2)

    Q_PROPERTY(int varN1Value1 MEMBER m_varN1Value1)
    Q_PROPERTY(int varN1Value2 MEMBER m_varN1Value2)
    Q_PROPERTY(int varN2Value1 MEMBER m_varN2Value1)
    Q_PROPERTY(int varN2Value2 MEMBER m_varN2Value2)

    Q_PROPERTY(int varITTValue1 MEMBER m_varITTValue1)
    Q_PROPERTY(int varITTValue2 MEMBER m_varITTValue2)

    Q_PROPERTY(int varOILValue1 MEMBER m_varOILValue1)
    Q_PROPERTY(int varOILValue2 MEMBER m_varOILValue2)
    Q_PROPERTY(int varOILValue3 MEMBER m_varOILValue3)
    Q_PROPERTY(int varOILValue4 MEMBER m_varOILValue4)

    Q_PROPERTY(int varFUELValue1 MEMBER m_varFUELValue1)
    Q_PROPERTY(int varFUELValue2 MEMBER m_varFUELValue2)
    Q_PROPERTY(int varFUELCValue MEMBER m_varFUELCValue)
    Q_PROPERTY(int varFUELPPHValue1 MEMBER m_varFUELPPHValue1)
    Q_PROPERTY(int varFUELPPHValue2 MEMBER m_varFUELPPHValue2)

    Q_PROPERTY(int varDCValue1 MEMBER m_varDCValue1)
    Q_PROPERTY(int varDCValue2 MEMBER m_varDCValue2)
    Q_PROPERTY(int varDCValue3 MEMBER m_varDCValue3)
    Q_PROPERTY(int varDCValue4 MEMBER m_varDCValue4)
    Q_PROPERTY(int varDCBATTV MEMBER m_varDCBATTV)
    Q_PROPERTY(int varDCBATTA MEMBER m_varDCBATTA)

    Q_PROPERTY(int varCABINValue1 MEMBER m_varCABINValue1)
    Q_PROPERTY(int varCABINValue2 MEMBER m_varCABINValue2)
    Q_PROPERTY(int varCABINValue3 MEMBER m_varCABINValue3)
    Q_PROPERTY(int varCABINValue4 MEMBER m_varCABINValue4)

    Q_PROPERTY(int varTRIMValue1 MEMBER m_varTRIMValue1)
    Q_PROPERTY(int varTRIMValue2 MEMBER m_varTRIMValue2)

    Q_PROPERTY(int varFLAPSValue MEMBER m_varFLAPSValue)

    Q_PROPERTY(int varRollValue MEMBER m_varRollValue)
    Q_PROPERTY(int varPitchValue MEMBER m_varPitchValue)
    Q_PROPERTY(int varYawValue MEMBER m_varYawValue)

    Q_PROPERTY(int varAltitudeValue MEMBER m_varAltitudeValue)
    Q_PROPERTY(int varAirspeedValue MEMBER m_varAirspeedValue)
    Q_PROPERTY(double varAirspeedAccel MEMBER m_varAirspeedAccel)
    Q_PROPERTY(int varVSIValue MEMBER m_varVSIValue)
    Q_PROPERTY(int varTemper MEMBER m_varTemper)
    Q_PROPERTY(int varCoord MEMBER m_varCoord)

    Q_PROPERTY(QString mess READ mess WRITE setmess NOTIFY sigMessChanged)

  public:
    explicit CUDP2(QObject *parent = 0);

    QString mess() const;
    void setmess(QString);

    int m_varN1BugValue1;
    int m_varN1BugValue2;
    int m_varN1Value1;
    int m_varN1Value2;

    int m_varN2Value1;
    int m_varN2Value2;

    int m_varITTValue1;
    int m_varITTValue2;

    int m_varOILValue1;
    int m_varOILValue2;
    int m_varOILValue3;
    int m_varOILValue4;

    int m_varFUELValue1;
    int m_varFUELValue2;
    int m_varFUELCValue=0;
    int m_varFUELPPHValue1;
    int m_varFUELPPHValue2;

    int m_varDCValue1;
    int m_varDCValue2;
    int m_varDCValue3;
    int m_varDCValue4;
    int m_varDCBATTV;
    int m_varDCBATTA;

    int m_varCABINValue1;
    int m_varCABINValue2;
    int m_varCABINValue3;
    int m_varCABINValue4;

    int m_varTRIMValue1;
    int m_varTRIMValue2;

    int m_varFLAPSValue;

    int m_varRollValue;
    int m_varPitchValue;
    int m_varYawValue;

    int m_varAltitudeValue;

    int m_varAirspeedValue=0,m_varAirspeedValue0=0;

    //Test
    QDateTime m_varAirspeedTime,m_varAirspeedTime0;
    double m_varAirspeedAccel=0,m_varAirspeedAccel0=0;
    QVector<double> m_varAirspeedAccels;
    int m_varAirspeedCount=1;//100
    unsigned int m_varAirspeedIndex=0;
    bool m_varAirspeedSign=false;
    //Test

    int m_varVSIValue;
    int m_varTemper = 0;
    int m_varCoord = 0;

  private:
      int m_varAirspeedPrev=0;

      QString m_mess="myerr";

      QString iniNetIpFPGA="192.168.4.1";
      int iniNetPortFPGA=9810;
      QString iniNetIpBIA="172.30.202.183";
      int iniNetPortBIA=1234;
      QString iniNetIpMFD="172.30.202.57";
      int iniNetPortMFD=1235;
      bool m_varUDPStatus=false;

      int iniModeBIA=1;    //0 No, 1 Hardware, 2 Software
      int iniDelayFakeValues=20;

      QUdpSocket *m_varUDPSocket1;
      QUdpSocket *m_varUDPSocket2;

  public:
      Q_INVOKABLE void funcUDPSend1(QByteArray,QString,int);
      Q_INVOKABLE void funcUDPSend2(QByteArray,QString,int);

  public slots:
      void slotSocketError(QAbstractSocket::SocketError socketError);
      void slotUDPReceive1();
      void slotUDPReceive2();

  private slots:

  signals:
      void sigVarsChanged(void);
      void sigMessChanged();
};

#endif  //CUDP_H

