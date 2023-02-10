#ifndef CTCP_H
#define CTCP_H

#include <QTcpSocket>
#include <QDataStream>
#include "h/CFile1.h"

#define defADSBFieldsCount       22

#define defADSBSELCHANGE         "SEL"
#define defADSBNEWID             "ID"
#define defADSBNEWAIRCRAFT       "AIR"
#define defADSBSTATUSAIRCRAFT    "STA"
#define defADSBCLICK             "CLK"
#define defADSBTRANSMISSION      "MSG"

#define defADSBSELCHANGE2        ",SEL"
#define defADSBNEWID2            ",ID"
#define defADSBNEWAIRCRAFT2      ",AIR"
#define defADSBSTATUSAIRCRAFT2   ",STA"
#define defADSBCLICK2            ",CLK"
#define defADSBTRANSMISSION2     ",MSG"

class CTCP2 : public QObject
{
    Q_OBJECT

    Q_PROPERTY(bool varTCPStatus READ varTCPStatus WRITE setvarTCPStatus NOTIFY sigVarTCPStatusChanged)
    Q_PROPERTY(int varADSBPlaneIndex READ varADSBPlaneIndex WRITE setvarADSBPlaneIndex NOTIFY sigVarsChanged)

    Q_PROPERTY(QString varADSBColor MEMBER m_varADSBColor)
    Q_PROPERTY(QString varADSBHexIdent MEMBER m_varADSBHexIdent)
    Q_PROPERTY(int varADSBAltitude MEMBER m_varADSBAltitude)
    Q_PROPERTY(int varADSBSpeed MEMBER m_varADSBSpeed)
    Q_PROPERTY(int varADSBTrack MEMBER m_varADSBTrack)
    Q_PROPERTY(double varADSBLat MEMBER m_varADSBLat)
    Q_PROPERTY(double varADSBLon MEMBER m_varADSBLon)
    Q_PROPERTY(int varADSBRate MEMBER m_varADSBRate)

 public:
      explicit CTCP2(QObject *parent = 0);

      bool varTCPStatus();
      void setvarTCPStatus(bool);
      int varADSBPlaneIndex();
      void setvarADSBPlaneIndex(int);
      Q_INVOKABLE void funcADSBRemove(int);
      Q_INVOKABLE void funcTCPStart();
      Q_INVOKABLE void funcTCPSend();

      QString m_varADSBColor="-1";
      QString m_varADSBHexIdent="Behyaaar";
      int m_varADSBAltitude=-1;
      int m_varADSBSpeed=-1;
      int m_varADSBTrack=180;
      double m_varADSBLat=32.715066; //71506648031806;
      double m_varADSBLon=51.510386; //510385596042376;
      int m_varADSBRate=-1;

  private:
      QString iniNetIpADSB="172.30.202.10";
      int iniNetPortADSB=30003;

      QTcpSocket *m_varTCPSocket;
      bool m_varTCPStatus=false;
      QDataStream m_varINDataStream;

      QList<QString> m_varADSBHexIdents;
      int m_varADSBPlaneIndex=0;
      int m_behyaarTransmits=0;

  signals:
      void sigVarTCPStatusChanged();
      void sigVarsChanged();

  public slots:
      void slotTCPReceive();
      void slotTCPStop();
      //void slotTCPError(QAbstractSocket::SocketError);

  private slots:
      void slotTCPConnected();
};

#endif  //CTCP_H

