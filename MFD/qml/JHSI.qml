import QtQuick.Shapes 1.12
import QtQuick 2.9
import QtQuick.Controls 2.5
import QtQuick.Controls.Material 2.3
import QtQuick.Extras 1.4
import QtQuick.Controls.Styles 1.4
import QtGraphicalEffects 1.0
import "qrc:/js/main.js" as Jmain

CircularGauge {
    property double margin: 26
    property var cardinalPoints: ["N","3","6","E","12","15","S","21","24","W","30","33","N"]    //Esmaeili
    property double foregroundCircleDiameter: 168
    property string navName: ""
    property color navTxtColor: constColors[7]

    id: hsi
    implicitWidth: hsiDiameter
    implicitHeight: hsiDiameter
    x: 0
    y: hsiDiameter/2
    minimumValue: 0
    maximumValue: 360
    value: 0
    style: CircularGaugeStyle {
        minorTickmarkCount: 1
        minorTickmarkInset: 0
        tickmarkInset: 0
        tickmarkStepSize: 10
        labelStepSize: 30
        minimumValueAngle: 0
        maximumValueAngle: 360
        tickmarkLabel: Text {
            id: angle
            visible: styleData.value !== 0
            font.pixelSize: 24
            text:cardinalPoints[(styleData.value % 360)/30]         //Esmaeili
            color: constColors[3]
            antialiasing: true
            transform: Rotation {
                origin.x: angle.width/2
                origin.y: angle.height/2
                axis { x: 0; y: 0; z: 1 }
                angle: styleData.value%360
            }
        }
        foreground: JVOR_BRG{}
        tickmark: Rectangle {
            width: 2
            antialiasing: true
            height: 15
            color: constColors[3]
        }
        minorTickmark: Rectangle {
            width: 2
            antialiasing: true
            height: 9
            color: constColors[3]
        }
        background: Canvas {
            onPaint: {
                var ctx = getContext("2d");
                ctx.reset();
                ctx.beginPath();
                ctx.strokeStyle = constColors[9];
                ctx.globalAlpha = 0.6;
                ctx.lineWidth = constCompassW /2 - margin;
                ctx.arc(outerRadius, outerRadius, outerRadius - ctx.lineWidth / 2,
                        Jmain.degreesToRadians(valueToAngle(hsi.minimumValue) - 90), Jmain.degreesToRadians(valueToAngle(hsi.maximumValue) - 90));
                ctx.stroke();
            }
        }
        needle: Rectangle{
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            anchors.left: parent.left
            anchors.right: parent.right
            color: constColors[7]
            Rectangle {
                visible: true
                width: foregroundCircleDiameter
                height: foregroundCircleDiameter
                anchors.centerIn: parent
                color: constColors[7]
                border.color: constColors[3]//_brgCircleVisiblity == 0 ? constColors[7] : constColors[3]
                border.width: 2
                radius: width*0.5
                Rectangle{
                    id: hsiText
                    width: 110
                    height: 100
                    color: constColors[7]
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.verticalCenter: parent.verticalCenter
                    Text {
                        text: qsTr(navName)
                        color: navTxtColor
                        font.pointSize: 12
                    }
                    Text {
                        text: qsTr("")
                        color: navTxtColor
                        font.pointSize: 12
                        anchors.top: parent.top
                        anchors.right: parent.right
                    }
                    transform: Rotation {
                        origin.x: hsiText.width/2
                        origin.y: hsiText.height/2
                        axis { x: 0; y: 0; z: 1 }
                        angle: varYawValue
                    }
                }
                Rectangle {
                    width: 10
                    height: 10
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.horizontalCenterOffset: 32.5
                    anchors.verticalCenter: parent.verticalCenter
                    color: constColors[7]
                    border.color: constColors[3]
                    border.width: 1
                    radius: width*0.5
                }
                Rectangle {
                    width: 10
                    height: 10
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.horizontalCenterOffset: -32.5
                    anchors.verticalCenter: parent.verticalCenter
                    color: constColors[7]
                    border.color: constColors[3]
                    border.width: 1
                    radius: width*0.5
                }
                Rectangle {
                    width: 10
                    height: 10
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.horizontalCenterOffset: 65
                    anchors.verticalCenter: parent.verticalCenter
                    color: constColors[7]
                    border.color: constColors[3]
                    border.width: 1
                    radius: width*0.5
                }
                Rectangle {
                    width: 10
                    height: 10
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.horizontalCenterOffset: -65
                    anchors.verticalCenter: parent.verticalCenter
                    color: constColors[7]
                    border.color: constColors[3]
                    border.width: 1
                    radius: width*0.5
                }
            }
        }
    }

}
