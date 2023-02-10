import QtQuick 2.0
//import QtQuick.Window 2.12
//import QtQuick.Dialogs 1.2
import QtQuick.Controls 2.12

Popup
{
    id:attit3

    x:constFormW-constLCDH-varScaleAspectX*constDotNeighbour
    y:constLCDW+2*varScaleAspectY*constDotNeighbour
    width:constLCDH
    height:constLCDW
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
