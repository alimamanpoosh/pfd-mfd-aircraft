import QtQuick.Shapes 1.12
import QtQuick 2.9

Rectangle{
    property double triangleHeight: 15
    property double margin: 40
    property double rodHeight: 50
    property double rodWidth: 6
    property color borderColor: constColors[4]
    property double offsetValue: 0
    property double angleValue: 0
    property double borderThickness: 1
    id: gpsNeedle
    visible: gpsCheck.checked
    anchors.top: parent.top
    anchors.bottom: parent.bottom
    anchors.left: parent.left
    anchors.right: parent.right
    color: constColors[7]
    Shape {
        id: triangle
        antialiasing: true
        width: 2 * triangleHeight
        height: triangleHeight + rodHeight - borderThickness
        anchors.top: gpsNeedle.top
        anchors.topMargin: margin
        anchors.horizontalCenter: gpsNeedle.horizontalCenter
        ShapePath{
            strokeWidth: borderThickness
            strokeColor: borderColor
            fillColor: constColors[6]//purpleColor
            startX: triangle.width /2
            startY: 0
            PathLine { x: triangle.width; y: triangleHeight }
            PathLine { x: (triangle.width + rodWidth) / 2; y: triangleHeight}
            PathLine { x: (triangle.width + rodWidth) / 2; y: triangle.height}
            PathLine { x: (triangle.width - rodWidth) / 2; y: triangle.height}
            PathLine { x: (triangle.width - rodWidth) / 2; y: triangleHeight}
            PathLine { x: 0; y: triangleHeight}
            PathLine { x: triangle.width / 2; y: 0}
        }
    }
    Rectangle{
        width: rodWidth + borderThickness
        height: rodHeight + triangleHeight - borderThickness
        color: constColors[6]//purpleColor
        anchors.horizontalCenter: gpsNeedle.horizontalCenter
        anchors.bottom: gpsNeedle.bottom
        anchors.bottomMargin: margin
        border.color: borderColor
        border.width: borderThickness
    }
    Rectangle{
        width: rodWidth + borderThickness
        height: constCompassW - 2 * (margin + triangleHeight + rodHeight)
        color: constColors[6]//purpleColor
        border.color: borderColor
        border.width: borderThickness
        anchors.horizontalCenter: gpsNeedle.horizontalCenter
        anchors.verticalCenter: gpsNeedle.verticalCenter
        anchors.horizontalCenterOffset: offsetValue
    }
    transform: Rotation {
        origin.x: gpsNeedle.width/2
        origin.y: gpsNeedle.height/2
        axis { x: 0; y: 0; z: 1 }
        angle: angleValue
    }
}
