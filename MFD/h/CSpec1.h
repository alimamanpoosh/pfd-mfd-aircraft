#ifndef CSPEC_H
#define CSPEC_H
#include <QNetworkInterface>
class CSpec2 : public QObject
{
    Q_OBJECT
  private:
      QString m_specs="";
  public:
      explicit CSpec2(QObject *parent = 0);
      Q_INVOKABLE QString getSpecs();
};

#endif // CSPEC_H
