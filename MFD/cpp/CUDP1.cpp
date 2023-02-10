#include "h/CFile1.h"
#include "h/CUDP1.h"

CUDP2::CUDP2(QObject *parent) : QObject(parent)
{
    CFile2 localFileObject;
    localFileObject.funcPath(0);
    int localTempInt;
    QString localTempStr;

    localTempInt=localFileObject.funcReadIntINI(iniModeBIAStr);
    if (localTempInt!=-1 && localTempInt!=-2) iniModeBIA=localTempInt;
    localTempStr=localFileObject.funcReadStringINI(iniNetIpBIAStr);
    if (localTempStr!="-1" && localTempStr!="-2") iniNetIpBIA=localTempStr;
    localTempInt=localFileObject.funcReadIntINI(iniNetPortBIAStr);
    if (localTempInt!=-1 && localTempInt!=-2) iniNetPortBIA=localTempInt;
    localTempStr=localFileObject.funcReadStringINI(iniNetIpMFDStr);
    if (localTempStr!="-1" && localTempStr!="-2") iniNetIpMFD=localTempStr;
    localTempInt=localFileObject.funcReadIntINI(iniNetPortMFDStr);
    if (localTempInt!=-1 && localTempInt!=-2) iniNetPortMFD=localTempInt;
    localTempStr=localFileObject.funcReadStringINI(iniNetIpFPGAStr);
    if (localTempStr!="-1" && localTempStr!="-2") iniNetIpFPGA=localTempStr;
    localTempInt=localFileObject.funcReadIntINI(iniNetPortFPGAStr);
    if (localTempInt!=-1 && localTempInt!=-2) iniNetPortFPGA=localTempInt;
    localTempInt=localFileObject.funcReadIntINI(iniDelayFakeValuesStr);
    if (localTempInt!=-1 && localTempInt!=-2) iniDelayFakeValues=localTempInt;

    m_varUDPSocket1 = new QUdpSocket(this);
    m_varUDPSocket2 = new QUdpSocket(this);

    //iniNetPortBIA,QUdpSocket::ShareAddress                           sender:imx     receiver:vmware
    //QHostAddress(iniNetIpBIA),iniNetPortBIA,QUdpSocket::ShareAddress sender:bia     receiver:imx
    //QHostAddress(iniNetIpBIA),iniNetPortBIA                          sender:vmware  receiver:vmware
    //QHostAddress::Any,iniNetPortBIA                                  sender:vmware  receiver:imx

    m_varUDPSocket1->bind(QHostAddress(iniNetIpBIA),iniNetPortBIA);
    connect(m_varUDPSocket1,SIGNAL(readyRead()),this,SLOT(slotUDPReceive1()));
    connect(m_varUDPSocket1, SIGNAL(error(QAbstractSocket::SocketError)),this, SLOT(slotSocketError(QAbstractSocket::SocketError)));

    m_varUDPSocket2->bind(QHostAddress::Any,iniNetPortFPGA);
    connect(m_varUDPSocket2,SIGNAL(readyRead()),this,SLOT(slotUDPReceive2()));
    connect(m_varUDPSocket2, SIGNAL(error(QAbstractSocket::SocketError)),this, SLOT(slotSocketError(QAbstractSocket::SocketError)));

    m_varAirspeedTime=QDateTime::currentDateTime();
    for (int i=0;i<m_varAirspeedCount;i++) m_varAirspeedAccels.append(0.0);
}

void CUDP2::slotSocketError(QAbstractSocket::SocketError socketError)
{
    QString s="";
    s+=socketError;
    setmess(s);
}

QString CUDP2::mess() const
{
    return m_mess;
}
void CUDP2::setmess(QString y)
{
    if (y == m_mess) return;
    m_mess = y;
    emit sigMessChanged();
}

void CUDP2::funcUDPSend1(QByteArray paramUDPBufferByte,QString paramNetIp,int paramNetPort)
{
    m_varUDPSocket1->writeDatagram(paramUDPBufferByte,QHostAddress(paramNetIp),paramNetPort);
}

void CUDP2::funcUDPSend2(QByteArray paramUDPBufferByte,QString paramNetIp,int paramNetPort)
{
    m_varUDPSocket2->writeDatagram(paramUDPBufferByte,QHostAddress(paramNetIp),paramNetPort);
}

//0=start=3a 1=address=1 2=id=0 3=cmd 4=len 5,6=n1 7,8=itt 9,10=fuel 11,12=roll 13,14=pich 15,16=yaw 17,18=check 19=stop1=0d 20=stop2=0a
void CUDP2::slotUDPReceive1()
{
    QByteArray   localBufferByte;
    QHostAddress localNetIp;
    quint16      localNetPort;
    int          localBiaPacketSize;
    int8_t       localByteStart;        //0
    int8_t       localByteAddress;      //1
    int8_t       localByteID;           //2
    int8_t       localByteCmd;          //3
    int8_t       localByteLen;          //4
    int8_t       localByteStop1;        //size()-2
    int8_t       localByteStop2;        //size()-1
    int32_t      localWordSum;
    int16_t      localBufferWord[defBiaPacketSize2];
    int          localMassProgress;

    int          localMSecs;

    if (iniModeBIA==1 || iniModeBIA==2)
    {
      while (m_varUDPSocket1->hasPendingDatagrams())
      {
          localBufferByte.resize(m_varUDPSocket1->pendingDatagramSize());

          m_varUDPSocket1->readDatagram(localBufferByte.data(),localBufferByte.size(),&localNetIp,&localNetPort);

          if ((iniModeBIA==1 && localBufferByte.size()%defBiaPacketSize1==0) || (iniModeBIA==2 && localBufferByte.size()%defBiaPacketSize2==0))
          {
              localBiaPacketSize=(iniModeBIA==1)?defBiaPacketSize1:defBiaPacketSize2;

              for (localMassProgress=0;localMassProgress<localBufferByte.size()/localBiaPacketSize;localMassProgress++)
              {
                  localByteStart=*(reinterpret_cast<const int8_t*>(localBufferByte.data()+localMassProgress*localBiaPacketSize+0));
                  localByteStop1=*(reinterpret_cast<const int8_t*>(localBufferByte.data()+(localMassProgress+1)*localBiaPacketSize-2));
                  localByteStop2=*(reinterpret_cast<const int8_t*>(localBufferByte.data()+(localMassProgress+1)*localBiaPacketSize-1));

                  if (localByteStart==defBiaPacketStart && localByteStop1==defBiaPacketStop1 && localByteStop2==defBiaPacketStop2)
                  {
                      localByteAddress=(int8_t)localBufferByte[localMassProgress*localBiaPacketSize+1];
                      localByteID=(int8_t)localBufferByte[localMassProgress*localBiaPacketSize+2];
                      localByteCmd=(int8_t)localBufferByte[localMassProgress*localBiaPacketSize+3];
                      localByteLen=(int8_t)localBufferByte[localMassProgress*localBiaPacketSize+4];

                      for(int i=5,j=0;i<=localBiaPacketSize-4;i+=2,j++)
                          localBufferWord[j]=*(reinterpret_cast<const int16_t*>(localBufferByte.data()+localMassProgress*localBiaPacketSize+i));

                      localWordSum=0;
                      for(int i=1;i<localBiaPacketSize-4;i++)
                          localWordSum+=(uint8_t)localBufferByte[localMassProgress*localBiaPacketSize+i];

                      if (-localWordSum==*(reinterpret_cast<const int16_t*>(localBufferByte.data()+(localMassProgress+1)*localBiaPacketSize-4)))
                      {
                          m_varN1Value1=localBufferWord[0];
                          m_varITTValue1=localBufferWord[1];
                          m_varFUELValue1=localBufferWord[2];
                          m_varRollValue=localBufferWord[3];
                          m_varPitchValue=localBufferWord[4];
                          m_varYawValue=localBufferWord[5];
                          m_varAltitudeValue=localBufferWord[6];
                          m_varAirspeedValue0=m_varAirspeedValue;
                          m_varAirspeedValue=localBufferWord[7];

                          if (iniModeBIA==2)
                          {
                              m_varAltitudeValue+=22233;
                              m_varN1BugValue1=localBufferWord[8];
                              m_varN1BugValue2=localBufferWord[9];
                              m_varN1Value2=localBufferWord[10];
                              m_varN2Value1=localBufferWord[11];
                              m_varN2Value2=localBufferWord[12];

                              m_varITTValue2=localBufferWord[13];

                              m_varOILValue1=localBufferWord[14];
                              m_varOILValue2=localBufferWord[15];
                              m_varOILValue3=localBufferWord[16];
                              m_varOILValue4=localBufferWord[17];

                              m_varFUELValue2=localBufferWord[18];
                              m_varFUELCValue=localBufferWord[19];
                              m_varFUELPPHValue1=localBufferWord[20];
                              m_varFUELPPHValue2=localBufferWord[21];

                              m_varDCValue1=localBufferWord[22];
                              m_varDCValue2=localBufferWord[23];
                              m_varDCValue3=localBufferWord[24];
                              m_varDCValue4=localBufferWord[25];
                              m_varDCBATTV=localBufferWord[26];
                              m_varDCBATTA=localBufferWord[27];

                              m_varCABINValue1=localBufferWord[28];
                              m_varCABINValue2=localBufferWord[29];
                              m_varCABINValue3=localBufferWord[30];
                              m_varCABINValue4=localBufferWord[31];

                              m_varTRIMValue1=localBufferWord[32];
                              m_varTRIMValue2=localBufferWord[33];

                              m_varFLAPSValue=localBufferWord[34];

                              m_varAirspeedTime0=m_varAirspeedTime;
                              m_varAirspeedTime=QDateTime::currentDateTime();
                              localMSecs=m_varAirspeedTime0.msecsTo(m_varAirspeedTime);
                              if (m_varAirspeedSign==true)
                              {
                                  m_varAirspeedAccel0=m_varAirspeedAccel;
                                  if (localMSecs!=0.0) {m_varAirspeedAccel=m_varAirspeedAccels[m_varAirspeedIndex%m_varAirspeedCount]=(m_varAirspeedValue-m_varAirspeedValue0)*1000.0/localMSecs;m_varAirspeedIndex++;}
                                  double s=0;
                                  for (int i=0;i<m_varAirspeedCount;i++) s+=m_varAirspeedAccels[i];
                                  m_varAirspeedAccel=s/m_varAirspeedCount;
                              }
                              else m_varAirspeedSign=true;

                              m_varVSIValue=localBufferWord[35];
                          }//if (iniModeBIA==2)
                          emit sigVarsChanged();
                          funcUDPSend1(localBufferByte,iniNetIpMFD,iniNetPortMFD);  //Left Display Only
                      }//if checksum
                  }//if start stop
              }//for mass packet
          }//if packet size
      }//while pendingDatagrams
    }//if modes
}

void CUDP2::slotUDPReceive2()
{
    QByteArray localBufferByte;
    QHostAddress localNetIp;
    quint16 localNetPort;
    int localCount=0;

    if (m_varUDPSocket2->pendingDatagramSize()==18)
    {
        localBufferByte.resize(m_varUDPSocket2->pendingDatagramSize());
        m_varUDPSocket2->readDatagram(localBufferByte.data(),localBufferByte.size(),&localNetIp,&localNetPort);
        localBufferByte=localBufferByte.toHex();
        localCount++;
        setmess(QString(localBufferByte.mid(0,20)).append("\r\n").append(QString(localBufferByte.mid(20,16))).append("\r\n").append(QString::number(localCount)));
    }
}
