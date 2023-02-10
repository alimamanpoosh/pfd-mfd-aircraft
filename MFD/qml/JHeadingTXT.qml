import QtQuick.Shapes 1.12
import QtQuick 2.9
import "qrc:/js/main.js" as Jmain

Rectangle {
    id: headingRect
    width: 72
    height: 52
    color: constColors[7]
    Rectangle {
        id: valueBox
        width: 72
        height: 32
        anchors.top: headingRect.top
        color: constColors[4]
        border.color: constColors[3]
        border.width: 0.5
        Text {
            text: qsTr(Jmain.paddingSting(varYawValue))  //Esmaeili
            color: constColors[3]
            anchors.horizontalCenter: valueBox.horizontalCenter
            anchors.verticalCenter: valueBox.verticalCenter
            font.pointSize: 21
        }
    }
    Shape {
        antialiasing: true
        id: needle
        width: 16
        height: 20
        anchors.top: valueBox.bottom
        anchors.horizontalCenter: headingRect.horizontalCenter
        ShapePath{
            strokeWidth: 0
            strokeColor: constColors[3]
            startX: 0
            startY: 0
            fillColor: constColors[3]
            PathLine { x: needle.width/2; y: needle.height }
            PathLine { x: needle.width; y: 0 }
            PathLine { x: 0; y: 0 }
        }
    }
}


