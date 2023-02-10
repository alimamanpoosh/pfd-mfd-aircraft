#include "h/CTCP1.h"
#include "QDateTime"

CTCP2::CTCP2(QObject *parent) : QObject(parent)
{
    CFile2 localFileObject;
    localFileObject.funcPath(0);
    int localTempInt;
    QString localTempStr;

    localTempStr=localFileObject.funcReadStringINI(iniNetIpADSBStr);
    if (localTempStr!="-1" && localTempStr!="-2") iniNetIpADSB=localTempStr;
    localTempInt=localFileObject.funcReadIntINI(iniNetPortADSBStr);
    if (localTempInt!=-1 && localTempInt!=-2) iniNetPortADSB=localTempInt;

    m_varTCPStatus = false;
    m_varTCPSocket = new QTcpSocket();
    m_varINDataStream.setDevice(m_varTCPSocket);
    //localFileObject.funcWrite(QDateTime::currentDateTime().toString()+"\r\n",true);
    m_varADSBHexIdents.append(m_varADSBHexIdent);
}

/*void CTCP2::slotTCPError(QAbstractSocket::SocketError paramStrError)
{
    QString localStrError = "unknown";
    switch (paramStrError)
    {
        case 0:
            localStrError = "Connection was refused";
            break;
        case 1:
            localStrError = "Remote host closed the connection";
            break;
        case 2:
            localStrError = "Host address was not found";
            break;
        case 5:
            localStrError = "Connection timed out";
            break;
        default:
            localStrError = "Unknown error";
    }
    qDebug()<<localStrError;
}*/

void CTCP2::funcTCPStart()
{
    m_varTCPSocket->connectToHost(QHostAddress(iniNetIpADSB),iniNetPortADSB);
    connect(m_varTCPSocket, SIGNAL(connected()), this, SLOT(slotTCPConnected()));             //&QTcpSocket::connected
    connect(m_varTCPSocket, SIGNAL(readyRead()), this, SLOT(slotTCPReceive()));            //&QTcpSocket::readyRead
    connect(m_varTCPSocket, SIGNAL(disconnected()), this, SLOT(slotTCPStop()));            //&QTcpSocket::disconnected
    //connect(m_varTCPSocket, SIGNAL(error(QAbstractSocket::SocketError)),this, SLOT(slotTCPError(QAbstractSocket::SocketError)));
}

void CTCP2::slotTCPStop()
{
    //UnconnectedState	    0	The socket is not connected.
    //HostLookupState	    1	The socket is performing a host name lookup.
    //ConnectingState	    2	The socket has started establishing a connection.
    //ConnectedState	    3	A connection is established.
    //BoundState	        4	The socket is bound to an address and port.
    //ClosingState	        6	The socket is about to close (data may still be waiting to be written).
    //ListeningState	    5	For internal use only.
    //QTcpSocket::

    disconnect(m_varTCPSocket, SIGNAL(connected()), this, SLOT(slotTCPConnected()));   //&QTcpSocket::connected
    disconnect(m_varTCPSocket, SIGNAL(readyRead()), this, SLOT(slotTCPReceive()));     //&QTcpSocket::readyRead
    disconnect(m_varTCPSocket, SIGNAL(disconnected()), this, SLOT(slotTCPStop()));

    switch (m_varTCPSocket->state())
    {
        case 0: m_varTCPSocket->disconnectFromHost();break;  //UnconnectedState
        default:m_varTCPSocket->abort();
    }
    setvarTCPStatus(false);
}

void CTCP2::funcADSBRemove(int i)
{
    if (0<i && i<m_varADSBHexIdents.size() )
    m_varADSBHexIdents.removeAt(i);
}

/*void CTCP2::funcConnectionTimeout()
{
    if(m_varTCPSocket->state() == QAbstractSocket::ConnectingState)
    {
        m_varTCPSocket->abort();
        emit m_varTCPSocket->error(QAbstractSocket::SocketTimeoutError);
    }
}*/
void CTCP2::slotTCPConnected()
{
    setvarTCPStatus(true);
}

void CTCP2::funcTCPSend()
{
}

//message_type, transmission_type, session_id, aircraft_id, hex_ident, flight_id, generated_date, generated_time, logged_date, logged_time, callsign, altitude, ground_speed, track, lat, lon, vertical_rate, squawk, alert, emergency, spi, is_on_ground
void CTCP2::slotTCPReceive()
{
    //message_type, transmission_type, session_id, aircraft_id, hex_ident, flight_id, generated_date, generated_time, logged_date, logged_time, callsign, altitude, ground_speed, track, lat, lon, vertical_rate, squawk, alert, emergency, spi, is_on_ground
    int         localLenAvailable;
    char        localBufferChar[20000];
    int         localLenReceived;
    QString     localLine;
    int         localCommaCount;
    QStringList localLineFields;
    int         localMassProgress;
    QString     localColorStr,localHexIdentStr,localAltitudeStr,localSpeedStr,localTrackStr,localLatStr,localLonStr,localRateStr;
    int         localTrack;
    CFile2      localFileObject;

    //int localFieldsIndex;
    localLenAvailable=m_varTCPSocket->bytesAvailable();
    localLenReceived=m_varINDataStream.readRawData(localBufferChar,localLenAvailable);

    if (localLenReceived>20)
    {
        localLine=QString::fromUtf8(localBufferChar,localLenReceived);
        localCommaCount=localLine.count(",");

        if (localCommaCount%(defADSBFieldsCount-1)==0)
        {
            if (localLine.size()<=(9+defADSBFieldsCount)*localCommaCount/(defADSBFieldsCount-1)) return;

            if (localCommaCount>(defADSBFieldsCount-1))
            {
                localLine.replace(defADSBSELCHANGE,defADSBSELCHANGE2);
                localLine.replace(defADSBNEWID,defADSBNEWID2);
                localLine.replace(defADSBNEWAIRCRAFT,defADSBNEWAIRCRAFT2);
                localLine.replace(defADSBSTATUSAIRCRAFT,defADSBSTATUSAIRCRAFT2);
                localLine.replace(defADSBCLICK,defADSBCLICK2);
                localLine.replace(defADSBTRANSMISSION,defADSBTRANSMISSION2);
                if (localLine[0]==",") localLine=localLine.remove(0,1);
            }

            localLineFields = localLine.split(",");

            for(localMassProgress=0;localMassProgress<localLineFields.size()/defADSBFieldsCount;localMassProgress++)
            {
                localColorStr   =localLineFields[localMassProgress*defADSBFieldsCount+2];
                localHexIdentStr=localLineFields[localMassProgress*defADSBFieldsCount+4];
                localAltitudeStr=localLineFields[localMassProgress*defADSBFieldsCount+11];
                localSpeedStr   =localLineFields[localMassProgress*defADSBFieldsCount+12];
                localTrackStr   =localLineFields[localMassProgress*defADSBFieldsCount+13];
                localLatStr     =localLineFields[localMassProgress*defADSBFieldsCount+14];
                localLonStr     =localLineFields[localMassProgress*defADSBFieldsCount+15];
                localRateStr    =localLineFields[localMassProgress*defADSBFieldsCount+16];

                //if (localFieldsIndex==0) continue;

                /*for(localFieldsIndex=0;localFieldsIndex<defADSBFieldsCount-1;localFieldsIndex++)
                {
                    localFileObject.funcWrite(localLineFields[localMassProgress*defADSBFieldsCount+localFieldsIndex],false);
                    localFileObject.funcWrite(",",false);
                }
                localFileObject.funcWrite(localLineFields[localMassProgress*defADSBFieldsCount+localFieldsIndex],false);
                localFileObject.funcWrite("\r\n",false);*/

                if (QString::compare(localHexIdentStr,"",Qt::CaseInsensitive)!=0)
                {
                    if (QString::compare(localHexIdentStr,"025BB1",Qt::CaseInsensitive)==0)
                    {
                        m_behyaarTransmits=(m_behyaarTransmits+1)%10000;
                        if (m_behyaarTransmits!=1) continue;
                    }

                    m_varADSBHexIdent=localHexIdentStr;

                    if (localColorStr.length()!=0) m_varADSBColor=localColorStr;
                    else m_varADSBColor="-1";

                    if (localAltitudeStr.length()!=0) m_varADSBAltitude=localAltitudeStr.toLong();
                    else m_varADSBAltitude=-1;

                    if (localSpeedStr.length()!=0) m_varADSBSpeed=localSpeedStr.toLong();
                    else m_varADSBSpeed=-1;

                    if (localTrackStr.length()!=0)
                    {
                        localTrack=localTrackStr.toLong();
                        if (localTrack>=0 && localTrack<=360) m_varADSBTrack=localTrack;
                        else m_varADSBTrack=-1;
                    }
                    else m_varADSBTrack=-1;

                    if (localLatStr.length()!=0)  m_varADSBLat=localLatStr.toDouble();
                    else m_varADSBLat=-1;

                    if (localLonStr.length()!=0) m_varADSBLon=localLonStr.toDouble();
                    else m_varADSBLon=-1;

                    if (localRateStr.length()!=0) m_varADSBRate=localRateStr.toLong();
                    else m_varADSBRate=-1;

                    /*int i = m_varADSBHexIdents.indexOf(localHexIdentStr);
                    if (i == -1)
                    {
                        m_varADSBHexIdents.append(localHexIdentStr);
                        setvarADSBPlaneIndex(m_varADSBHexIdents.size());
                    }*/

                    int i;
                    for (i=0;i< m_varADSBHexIdents.size();i++)
                        if (localHexIdentStr==m_varADSBHexIdents[i]) break;
                    if (i==m_varADSBHexIdents.size())
                    {
                        m_varADSBHexIdents.append(localHexIdentStr);
                        setvarADSBPlaneIndex(i);
                    }
                    else if (m_varADSBPlaneIndex>0) setvarADSBPlaneIndex(-i);//negate only to call set
                    else if (m_varADSBPlaneIndex<0) setvarADSBPlaneIndex(i);//negate only to call set
                }
            }//for(localMassProgress=0;localMassProgress<localLineFields.size()/defADSBFieldsCount;localMassProgress++)
        }//if (localCommaCount%(defADSBFieldsCount-1)==0)
    }//if (localLenReceived>20)
    else if (localLenReceived!=0) slotTCPStop();
}//void CTCP2::slotTCPReceive()

bool CTCP2::varTCPStatus()
{
    return m_varTCPStatus;
}
void CTCP2::setvarTCPStatus(bool value)
{
    if (value != m_varTCPStatus)
    {
        m_varTCPStatus=value;
        sigVarTCPStatusChanged();
    }
}
int CTCP2::varADSBPlaneIndex()
{
    return m_varADSBPlaneIndex;
}
void CTCP2::setvarADSBPlaneIndex(int value)
{
    if (value != m_varADSBPlaneIndex)
    {
        m_varADSBPlaneIndex = value;
        sigVarsChanged();
    }
}
