import QtQuick.Shapes 1.12
import QtQuick 2.9

Rectangle{
    property double triangleHeight: 15
    property double margin: 40
    property double rodHeight: 50
    property double rodWidth: 6
    property color borderColor: constColors[4]
    property color needleColor: constColors[3]
    property double offsetValue: 0
    property double borderThickness: 1
    id: needle
    antialiasing: true
    y: constCompassW/2
    implicitWidth: 2 * triangleHeight
    implicitHeight: constCompassW
    color: constColors[7]
    Shape {
        id: triangle
        antialiasing: true
        width: 2 * triangleHeight
        height: triangleHeight + rodHeight - borderThickness
        anchors.top: needle.top
        anchors.topMargin: margin
        anchors.horizontalCenter: needle.horizontalCenter
        ShapePath{
            strokeWidth: borderThickness
            strokeColor: borderColor
            fillColor: needleColor
            startX: triangle.width /2
            startY: 0
            PathLine { x: triangle.width; y: triangleHeight }
            PathLine { x: (triangle.width + rodWidth) / 2; y: triangleHeight}
            PathLine { x: (triangle.width + rodWidth) / 2; y: triangle.height}
            PathLine { x: (triangle.width - rodWidth) / 2; y: triangle.height}
            PathLine { x: (triangle.width - rodWidth) / 2; y: triangleHeight}
            PathLine { x: 0; y: triangleHeight}
            PathLine { x: triangle.width /2; y: 0}
        }
    }
    Rectangle{
        width: rodWidth + borderThickness
        height: rodHeight + triangleHeight - borderThickness
        color: needleColor
        anchors.horizontalCenter: needle.horizontalCenter
        anchors.bottom: needle.bottom
        anchors.bottomMargin: margin
        border.color: borderColor
        border.width: borderThickness
    }
    Rectangle{
        width: rodWidth + borderThickness
        height: constCompassW - 2 * (margin + triangleHeight + rodHeight)
        color: needleColor
        border.color: borderColor
        border.width: borderThickness
        anchors.horizontalCenter: needle.horizontalCenter
        anchors.verticalCenter: needle.verticalCenter
        anchors.horizontalCenterOffset: offsetValue
    }
}
