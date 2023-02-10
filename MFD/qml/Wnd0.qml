import QtQuick 2.0
//import QtQuick.Window 2.12
//import QtQuick.Dialogs 1.2
import QtQuick.Controls 2.12

Popup
{
    id:air_alt1

    x:varScaleAspectX*constDotNeighbour
    y:varScaleAspectY*constDotNeighbour
    width:constLCDW
    height:constLCDH
    modal: false
    focus: true
    closePolicy: Popup.CloseOnEscape | Popup.CloseOnPressOutsideParent

    background:
    Rectangle
    {
        color: constColors[2]
        border.color: constColors[2]
        border.width: constDotBorder;
    }

    Window1Altitude
    {
        id: altitude
        anchors.leftMargin: 0
        anchors.topMargin: 0
    }
}
