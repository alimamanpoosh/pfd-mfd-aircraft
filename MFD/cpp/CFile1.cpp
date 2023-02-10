#include "h/CFile1.h"

CFile2::CFile2(QObject *parent) : QObject(parent)
{
    setvarPath(QString(defPath)+defPathINI);
}

void CFile2::funcPath(int paramPath)
{
    QString localpath=defPath;
    switch((ENPath)paramPath)
    {
        case ENPath::enPathINI :localpath+=defPathINI ;break;
        case ENPath::enPathLOG :localpath+=defPathLOG ;break;
        case ENPath::enPathTHR2:localpath+=defPathTHR2;break;
        default:break;
    }
    setvarPath(localpath);
}

QString CFile2::varPath() const
{
    return m_varPath;
}
void CFile2::setvarPath(QString y)
{
    if (y == m_varPath) return;
    m_varPath = y;
    //emit sigPathChanged();
}
QString CFile2::funcReadStringINI(QString str)
{
    if (varPath().isEmpty())
    {
        emit sigError("source is empty");
        return "-1";
    }

    QFile localFileObject(varPath());
    if ( localFileObject.open(QIODevice::ReadOnly) )
    {
        QString localLine;
        QTextStream localTextStream( &localFileObject );
        do
        {
            localLine = localTextStream.readLine();
            if (localLine.left(str.length())==str)
            {
                localLine = localTextStream.readLine();
                return localLine;
            }
        } while (!localLine.isNull());

        localFileObject.close();
    }
    else
    {
        emit sigError("Unable to open the file");
        return "-1";
    }
    return "-2";
}
int CFile2::funcReadIntINI(QString str)
{
    if (varPath().isEmpty())
    {
        emit sigError("source is empty");
        return -1;
    }

    QFile localFileObject(varPath());
    if ( localFileObject.open(QIODevice::ReadOnly) )
    {
        QString localLine;
        QTextStream localTextStream( &localFileObject );
        do
        {
            localLine = localTextStream.readLine();
            if (localLine.left(str.length())==str)
            {
                localLine = localTextStream.readLine();
                return localLine.toInt();
            }
        } while (!localLine.isNull());

        localFileObject.close();
    }
    else
    {
        emit sigError("Unable to open the file");
        return -1;
    }
    return -2;
}
double CFile2::funcReadDoubleINI(QString str)
{
    if (varPath().isEmpty())
    {
        emit sigError("source is empty");
        return -1;
    }

    QFile localFileObject(varPath());
    if ( localFileObject.open(QIODevice::ReadOnly) )
    {
        QString localLine;
        QTextStream localTextStream( &localFileObject );
        do
        {
            localLine = localTextStream.readLine();
            if (localLine.left(str.length())==str)
            {
                localLine = localTextStream.readLine();
                return localLine.toDouble();
            }
        } while (!localLine.isNull());

        localFileObject.close();
    }
    else
    {
        emit sigError("Unable to open the file");
        return -1;
    }
    return -2;
}
QString CFile2::funcReadAllToStr()
{
    if (varPath().isEmpty())
    {
        emit sigError("source is empty");
        return QString();
    }

    QFile localFileObject(varPath());
    QString localFileContent;
    if ( localFileObject.open(QIODevice::ReadOnly) )
    {
        QString localLine;
        QTextStream localTextStream( &localFileObject );
        do
        {
            localLine = localTextStream.readLine();
            if (!localLine.isNull()) {localFileContent +="\n";localFileContent +=localLine;}
        } while (!localLine.isNull());

        localFileObject.close();
    }
    else
    {
        emit sigError("Unable to open the file");
        return QString();
    }
    return localFileContent;
}

QList<QString> CFile2::funcReadAllToList()
{
    QList<QString> localFileContents;
    if (varPath().isEmpty())
    {
        emit sigError("source is empty");
        return localFileContents;
    }

    QFile file(varPath());
    if ( file.open(QIODevice::ReadOnly) )
    {
        QString localLine;
        QTextStream t( &file );
        do
        {
            localLine = t.readLine();
            localFileContents.append(localLine);
        } while (!localLine.isNull());

        file.close();
    }
    else
    {
        emit sigError("Unable to open the file");
        return localFileContents;
    }
    return localFileContents;
}

bool CFile2::funcWrite(const QString& paramData,bool paramTrun)
{
    QFile localFileObject(varPath());
    if ( paramTrun && !localFileObject.open(QFile::WriteOnly | QFile::Truncate)) return false;
    if (!paramTrun && !localFileObject.open(QFile::WriteOnly | QFile::Append)) return false;

    QTextStream localTextStream(&localFileObject);
    localTextStream << paramData;
    localFileObject.close();
    return true;
}
