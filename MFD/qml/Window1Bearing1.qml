import QtQuick.Shapes 1.12
import QtQuick 2.9

Rectangle {
    property double _width: 225
    property double _height: 60
    property int status: 0
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
            startX: _width - 72
            startY: _height
            PathArc {
                x: _width - 139
                y: 0
                radiusX: 160; radiusY: 160
                useLargeArc: false
            }
            PathLine { x: 0; y: 0 }
            PathLine { x: 0; y: _height}
            PathLine { x: _width - 72; y: _height}
        }
        Column{
            anchors{
                bottom: parent.bottom
                left: parent.left
                leftMargin: 5
                bottomMargin: 5
            }
            Text {
                text: qsTr(status != 3 ? "NO DATA" : "")
                font.pixelSize: 17
                horizontalAlignment: Text.AlignLeft
                verticalAlignment: Text.AlignVCenter
                color: constColors[2]//"#00ffff"
                height: _height/3
            }
            Row{
                Text {
                    text: qsTr(textContent())
                    font.pixelSize: 17
                    horizontalAlignment: Text.AlignLeft
                    verticalAlignment: Text.AlignVCenter
                    color: constColors[3]
                    width: 50
                    height: _height/3
                }
                Shape {
                    id: arrow
                    antialiasing: true
                    width: 60
                    height: _height/3
                    ShapePath{
                        strokeWidth: 1
                        strokeColor: constColors[7]
                        fillColor: constColors[2]//"#00ffff"
                        startX: 10
                        startY: _height/6 - 1
                        PathLine { x: 16; y: _height/6 - 1}
                        PathLine { x: 27; y: 1}
                        PathLine { x: 27; y: 3}
                        PathLine { x: 18; y: _height/6 - 1}
                        PathLine { x: 60; y: _height/6 - 1}
                        PathLine { x: 60; y: _height/6 + 1}
                        PathLine { x: 18; y: _height/6 + 1}
                        PathLine { x: 27; y: _height/3 - 3}
                        PathLine { x: 27; y: _height/3 - 1}
                        PathLine { x: 16; y: _height/6 + 1}
                        PathLine { x: 10; y: _height/6 + 1}
                        PathLine { x: 10; y: _height/6 - 1}
                    }
                }
            }
        }
    }

    function textContent()
    {

        switch(status)
        {
        case 1:
            return "NAV1";
        case 2:
            return "GPS";
        case 3:
            return "ADF";
        default:
            return "Ehsan BRG1";  //Esmaeili
        }
    }
}
