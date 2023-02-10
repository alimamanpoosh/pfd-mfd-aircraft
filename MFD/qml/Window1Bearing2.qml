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
            startX: 72
            startY: _height
            PathArc {
                x: 139
                y: 0
                radiusX: 160; radiusY: 160
                useLargeArc: false
                direction: PathArc.Counterclockwise
            }
            PathLine { x: _width; y: 0 }
            PathLine { x: _width; y: _height}
            PathLine { x: 72; y: _height}
        }
        Column{
            anchors{
                bottom: parent.bottom
                right: parent.right
                rightMargin: 5
                bottomMargin: 5
            }
            Text {
                text: qsTr(status != 3 ? "NO DATA" : "")
                font.pixelSize: 17
                anchors.right: parent.right
                verticalAlignment: Text.AlignVCenter
                color: constColors[2]//"#00ffff"
                height: _height/3
            }
            Row{
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
                Text {
                    text: qsTr(textContent())
                    font.pixelSize: 17
                    horizontalAlignment: Text.AlignRight
                    verticalAlignment: Text.AlignVCenter
                    color: constColors[3]
                    width: 50
                    height: _height/3
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
            return "Ehsan BRG2";  //Esmaeili
        }
    }
}
