#include "h/CFile1.h"
#include "h/CSpec1.h"

CSpec2::CSpec2(QObject *parent) : QObject(parent)
{
}

QString CSpec2::getSpecs()
{
    m_specs="";
    QList<QHostAddress> list = QNetworkInterface::allAddresses();
    for (int i=0,j=0;i<list.count();i++)
        if(list[i].toString().contains('.'))
        {
            if (j%2==0)
                m_specs.append(list[i].toString()+"---");
            else m_specs.append(list[i].toString()+"\r\n");
            j++;
        }
    return m_specs;
}
