import QtQuick 2.9
import QtQuick.Controls 2.5

Rectangle
{
    property double galRemValue: 10

    width: varScaleAspectX*constWidth1

    WindowN1
    {
        id: windowN1ID1
        x:0
        y:0//varScaleAspectY*(2*constDotFont0+2*constDotNeighbour)
    }
    WindowITT
    {
        id: windowITTID1
        x:0
        y:varScaleAspectY*(constN1H+1*constDotNeighbour);
    }
    WindowN2
    {
        id: windowN2ID1
        x:0
        y:varScaleAspectY*(constN1H+constITTH+2*constDotNeighbour);
    }

    WindowOIL
    {
        id: windowOILID1
        x:0
        y:varScaleAspectY*(constN1H+constITTH+constN2H+3*constDotNeighbour);
    }

    WindowFUEL
    {
        id: windowFUELID1
        x:0
        y:varScaleAspectY*(constN1H+constITTH+constN2H+constOILH+4*constDotNeighbour);
    }

    WindowDC
    {
        id: windowDCID1
        x:0
        y:varScaleAspectY*(constN1H+constITTH+constN2H+constOILH+constFUELH+5*constDotNeighbour);
    }

    WindowCABIN
    {
        id: windowCABINID1
        x:0
        y:varScaleAspectY*(constN1H+constITTH+constN2H+constOILH+constFUELH+constDCH+6*constDotNeighbour);
    }

    WindowFLAPS
    {
        id: windowFLAPSID1
        x:0
        y:varScaleAspectY*(constN1H+constITTH+constN2H+constOILH+constFUELH+constDCH+constCABINH+7*constDotNeighbour);
        height:wnd.height-varScaleAspectY*(constN1H+constITTH+constN2H+constOILH+constFUELH+constDCH+constCABINH+constDotFont0+8*constDotNeighbour);
    }
}
