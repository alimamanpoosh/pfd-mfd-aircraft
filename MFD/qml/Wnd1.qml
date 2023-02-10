import QtQuick 2.0
//import QtQuick.Window 2.12
//import QtQuick.Dialogs 2.12
import QtQuick.Controls 2.12

Dialog
{
    id:attit1

    x:constLCDW+2*varScaleAspectX*constDotNeighbour
    y:varScaleAspectY*constDotNeighbour
    width:constLCDW
    height:constLCDH
    modal: false
    focus: true
    closePolicy: Popup.CloseOnEscape | Popup.CloseOnPressOutsideParent

    background:
    Rectangle
    {
        color: constColors[4]
        border.color: constColors[4]
        border.width: constDotBorder;
    }

    Window1Altitude
    {
        id: altitude
        anchors.leftMargin: 0
        anchors.topMargin: 0
    }
}
