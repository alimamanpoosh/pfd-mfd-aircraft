#ifndef CFILE_H
#define CFILE_H

#include <QFile>
#include <QDataStream>
#include <QHostAddress>

enum class ENPath
{
    //0       1         2
    enPathINI,enPathLOG,enPathTHR2
};

// Windows             "D:/esmaeili/behyaar/Codes/txt/"
// Ubuntu              "/home/ubu/ehsan/mfd/txt/"
// IMX                 "/home/root/"
#define defPath        "/home/ubu/ehsan/mfd/txt/"
#define defPathINI     "MFD.ini"
#define defPathLOG     "LOG.txt"
#define defPathTHR2    "THR2.txt"

#define iniModeBIAStr           "iniModeBIA"

#define iniNetIpFPGAStr         "iniNetIpFPGA"
#define iniNetPortFPGAStr       "iniNetPortFPGA"
#define iniNetIpBIAStr          "iniNetIpBIA"
#define iniNetPortBIAStr        "iniNetPortBIA"
#define iniNetIpMFDStr          "iniNetIpMFD"
#define iniNetPortMFDStr        "iniNetPortMFD"
#define iniNetIpADSBStr         "iniNetIpADSB"
#define iniNetPortADSBStr       "iniNetPortADSB"
#define iniDelayFakeValuesStr   "iniDelayFakeValues"

class CFile2 : public QObject
{
      Q_OBJECT
      Q_PROPERTY(QString varPath READ varPath WRITE setvarPath NOTIFY sigPathChanged)

  public:
      explicit CFile2(QObject *parent = 0);
      Q_INVOKABLE QString        funcReadStringINI(QString);
      Q_INVOKABLE int            funcReadIntINI(QString);
      Q_INVOKABLE double         funcReadDoubleINI(QString);
      Q_INVOKABLE QString        funcReadAllToStr();
      Q_INVOKABLE QList<QString> funcReadAllToList();
      Q_INVOKABLE bool           funcWrite(const QString&,bool);
      Q_INVOKABLE void           funcPath(int);

      QString varPath() const;
      void setvarPath(QString);

  private:
      QString m_varPath=QString(defPath)+defPathINI;

  signals:
      void sigPathChanged();
      void sigError(const QString&);

  public slots:

  private slots:

};

#endif  //CFILE_H
