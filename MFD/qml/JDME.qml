import QtQuick.Shapes 1.12
import QtQuick 2.9

Rectangle {
    property double _width: 225
    property double _height: 83
    property bool dmeVisibility: false

    width: _width
    height: _height
    color: constColors[7]
    Shape {
        id: shape
        anchors.fill: parent
        ShapePath {
            strokeWidth: 1
            strokeColor: constColors[3]
            fillColor: constColors[4]
            startX: 83
            startY: _height

            PathArc {
                x: 61
                y: 5
                radiusX: 160; radiusY: 160
                useLargeArc: false
            }
            PathLine { x: 0; y: 5 }
            PathLine { x: 0; y: _height}
            PathLine { x: 83; y: _height}
        }
    Column{
        anchors{
            top: parent.top
            left: parent.left
            leftMargin: 5
            topMargin: 5
            bottomMargin: 5
        }

        Text {
            text: qsTr("DME")
            font.pixelSize: 17
            horizontalAlignment: Text.AlignLeft
            verticalAlignment: Text.AlignVCenter
            color: constColors[3]
            height: (_height-5)/4
        }
        Text {
            text: qsTr("NAV1")
            font.pixelSize: 17
            horizontalAlignment: Text.AlignLeft
            verticalAlignment: Text.AlignVCenter
            color: constColors[2]//"#00ffff"
            height: (_height-5)/4
        }
        Text {
            text: qsTr("113.60")
            font.pixelSize: 17
            horizontalAlignment: Text.AlignLeft
            verticalAlignment: Text.AlignVCenter
            color: constColors[2]//"#00ffff"
            height: (_height-5)/4
        }
        Text {
            text: qsTr("-.--NM")
            font.pixelSize: 17
            horizontalAlignment: Text.AlignLeft
            verticalAlignment: Text.AlignVCenter
            color: constColors[3]
            height:(_height-5)/4
        }
    }
    }
}
