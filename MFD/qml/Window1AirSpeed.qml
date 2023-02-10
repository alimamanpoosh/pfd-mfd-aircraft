import QtQuick.Shapes 1.12
import QtQuick 2.9
import QtQuick.Controls 2.5
import QtQuick.Controls.Material 2.3
import QtQuick.Extras 1.4
import QtQuick.Controls.Styles 1.4
import QtGraphicalEffects 1.12
import "qrc:/js/public.js" as Jpublic

Rectangle {

    width: boxWidth + vspeedWidth
    height: boxHeight
    /*anchors.left: parent.left
    anchors.top: parent.top
    anchors.leftMargin: 154
    anchors.topMargin: 58*/
    clip: true
    color: constColors[7]

    Rectangle{
        color: constColors[7]
        border.color: constColors[3]
        border.width: 2
        anchors.fill: parent
        anchors.rightMargin: vspeedWidth
    }
    Rectangle{
        anchors.fill: parent
        anchors.rightMargin: vspeedWidth
        anchors.margins: 2
        color: constColors[4]
        opacity: 0.3
    }
    Rectangle {
        width: 10
        height: (varAirspeedMax-varAirspeedMin)*hCoeficient
        x: boxWidth - width - 2
        y: (shownSpeed-varAirspeedMax+numOfDisplay/2)*hCoeficient
        gradient: Gradient {
            GradientStop { position: 1-(175-varAirspeedMin)/(varAirspeedMax-varAirspeedMin) - 0.000000000001; color: constColors[0] }

            GradientStop { position: 1-(175-varAirspeedMin)/(varAirspeedMax-varAirspeedMin); color: constColors[5] }
            GradientStop { position: 1-(138-varAirspeedMin)/(varAirspeedMax-varAirspeedMin) - 0.000000000001; color: constColors[5] }

            GradientStop { position: 1-(138-varAirspeedMin)/(varAirspeedMax-varAirspeedMin); color: constColors[1] }
            GradientStop { position: 1-(46-varAirspeedMin)/(varAirspeedMax-varAirspeedMin) - 0.000000000001; color: constColors[1] }

            GradientStop { position: 1-(46-varAirspeedMin)/(varAirspeedMax-varAirspeedMin); color: constColors[3]}
            GradientStop { position: 1-(42-varAirspeedMin)/(varAirspeedMax-varAirspeedMin) - 0.000000000001; color: constColors[3] }


            GradientStop { position: 1-(42-varAirspeedMin)/(varAirspeedMax-varAirspeedMin); color: constColors[0] }
            GradientStop { position: 1-(20-varAirspeedMin)/(varAirspeedMax-varAirspeedMin) - 0.000000000001; color: constColors[0] }
        }
    }
    Repeater {
        model: (varAirspeedMax-varAirspeedMin)/10 + 1
        Item {
            Rectangle {
                x: boxWidth - 20 - 2
                y: (shownSpeed - index*10 - varAirspeedMin + numOfDisplay/2)*hCoeficient
                width: 20
                height: 3
            }
            Rectangle {
                visible: (index != 0)
                x: boxWidth - 10 - 2
                y: (shownSpeed + 5 - index*10 - varAirspeedMin + numOfDisplay/2)*hCoeficient
                width: 10
                height: 3
            }
            Text {
                width: boxWidth - 20
                y: (shownSpeed - index*10 - varAirspeedMin + numOfDisplay/2)*hCoeficient - font.pixelSize/2
                horizontalAlignment: Text.AlignHCenter
                text: (varAirspeedMin + index*10)
                color: constColors[3]
                font.pixelSize: 28
            }
        }
    }
    Shape {             // reference bug
        x: boxWidth - 10
        y: (shownSpeed - referenceBugSpeed + numOfDisplay/2)*hCoeficient - 5
        ShapePath {
            fillColor: constColors[2]
            PathLine {x: 10; y:0}
            PathLine {x: 10; y:20}
            PathLine {x: 0; y:20}
            PathLine {x: 0; y:15}
            PathLine {x: 8; y:10}
            PathLine {x: 0; y:5}
            PathLine {x: 0; y:0}
        }
    }
    Shape {
        id: indicator
        height: 70
        anchors{
            left: parent.left
            leftMargin: 6
            right: parent.right
            rightMargin: 4 + vspeedWidth
            verticalCenter: parent.verticalCenter
        }
        Rectangle {
            x:43
            width: 23
            height: 70
            color: constColors[7]
            clip: true
            Text {
                color: constColors[3]
                y: (varAirspeedValue>varAirspeedMin)?((varAirspeedValue+0.5)%10)*height/10:15
                font.pixelSize: 30
                text: (varAirspeedValue>varAirspeedMin)?"0\n9\n8\n7\n6\n5\n4\n3\n2\n1":"-"
            }
            Text {
                color: constColors[3]
                y: (varAirspeedValue>varAirspeedMin)?((varAirspeedValue+0.5)%10-10)*height/10:15
                font.pixelSize: 30
                text: (varAirspeedValue>varAirspeedMin)?"0\n9\n8\n7\n6\n5\n4\n3\n2\n1":" -"
            }
        }
        Rectangle {
            x:22
            y:14
            width: 21
            height: 42
            color: constColors[7]
            clip: true
            Text {
                color: constColors[3]
                height: boxHeight
                y: (varAirspeedValue>varAirspeedMin)?(Math.floor(varAirspeedValue/10)%10+(varAirspeedValue%10>9)*(varAirspeedValue%10-9))*height/10:0
                font.pixelSize: 30
                text: (varAirspeedValue>varAirspeedMin)?"0\n9\n8\n7\n6\n5\n4\n3\n2\n1":"-"
            }
            Text {
                color: constColors[3]
                height: boxHeight
                y: (varAirspeedValue>varAirspeedMin)?(Math.floor(varAirspeedValue/10)%10+(varAirspeedValue%10>9)*(varAirspeedValue%10-9)-10)*height/10:0
                font.pixelSize: 30
                text: (varAirspeedValue>varAirspeedMin)?"0\n9\n8\n7\n6\n5\n4\n3\n2\n1":" -"
            }
        }
        Rectangle {
            x:1
            y:14
            width: 21
            height: 42
            color: constColors[7]
            clip: true
            Text {
                color: constColors[3]
                height: boxHeight
                y: (varAirspeedValue>varAirspeedMin)?(Math.floor(varAirspeedValue/100)%10+(varAirspeedValue/10%10>9 && varAirspeedValue%10>9)*(varAirspeedValue%10-9))*height/10:0
                font.pixelSize: 30
                text: (varAirspeedValue>varAirspeedMin)?"\n9\n8\n7\n6\n5\n4\n3\n2\n1":"-"
            }
            Text {
                color: constColors[3]
                height: boxHeight
                y: (varAirspeedValue>varAirspeedMin)?(Math.floor(varAirspeedValue/100)%10+(varAirspeedValue/10%10>9 && varAirspeedValue%10>9)*(varAirspeedValue%10-9)-10)*height/10:0
                font.pixelSize: 30
                text: (varAirspeedValue>varAirspeedMin)?"\n9\n8\n7\n6\n5\n4\n3\n2\n1":" -"
            }
        }
        ShapePath {
            strokeWidth: 1
            strokeColor: constColors[3]
            fillColor: (varAirspeedValue>175)? constColors[0]: constColors[4]
            startX: 0
            startY: 14
            PathLine { x: 43; y: 14 }
            PathLine { x: 43; y: 0}
            PathLine { x: 66; y: 0}
            PathLine { x: 66; y: 30 }
            PathLine { x: indicator.width; y: 35}
            PathLine { x: 66; y: 40}
            PathLine { x: 66; y: 70 }
            PathLine { x: 43; y: 70}
            PathLine { x: 43; y: 56}
            PathLine { x: 0; y: 56 }
            PathLine { x: 0; y: 14}
        }
    }
    Rectangle { // Trend Vector
        id:alii
        anchors.topMargin: (varAirspeedAccel > 0)? boxHeight/2 - varAirspeedAccel*6*hCoeficient : boxHeight/2
        anchors.bottomMargin: (varAirspeedAccel > 0)? boxHeight/2 : boxHeight/2 + varAirspeedAccel*6*hCoeficient
        anchors.fill: parent
        anchors.leftMargin: boxWidth
        anchors.rightMargin: vspeedWidth - 6
        color: constColors[6]
        border.width: 2
        border.color: constColors[3]
    }

    Rectangle { // V Speeds
        width: vspeedWidth
        height: boxHeight
        color: constColors[7]
        x: boxWidth
        Repeater {
            id: vspeedRepeater
            model:vspeedsList.length
            Shape {
                visible: vspeedsList[index]["visible"]
                y: (shownSpeed-vspeedsList[index]["speed"]+numOfDisplay/2)*hCoeficient - 9
                Text {
                    id:akbar
                    text: vspeedsList[index]["name"]
                    color: vspeedsList[index]["textColor"]
                    font.pixelSize: 14
                    font.bold: true
                    leftPadding: 7
                    width:26
                    horizontalAlignment: Text.AlignHCenter
                }
                ShapePath {
                    fillColor: constColors[4]
                    startX: 0
                    startY: 9
                    PathLine { x: 7; y: 0 }
                    PathLine { x: 28; y: 0 }
                    PathLine { x: 28; y: 18 }
                    PathLine { x: 7; y: 18 }
                    PathLine { x: 0; y: 9 }
                }
            }
        }
    }
    Rectangle {     // reference approach speed
        x: boxWidth - 7
        y: (shownSpeed - referenceApproachSpeed + numOfDisplay/2)*hCoeficient - 5
        width: 10
        height: 10
        radius: 10
        color: constColors[7]
        border.width: 3
        border.color: constColors[1]
    }
}

