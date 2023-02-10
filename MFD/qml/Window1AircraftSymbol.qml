import QtQuick.Shapes 1.12
import QtQuick 2.0

Rectangle{

    property double centerOuterWidth: 120
    property double centerInnerWidth: 60
    property double centerHeight: 30
    property double sideHeight: 5
    property double sideWidth: 50
    property double sideOffset: 8
    width: constAttiW + 2 * horizontalOffset
    height: constAttiW
    color: constColors[7]

    layer.enabled: true
    layer.smooth: true
    layer.samples: 4

    Shape {
        id: commandBars

        ShapePath{
            strokeWidth: 2
            strokeColor: constColors[4]
            fillColor: constColors[6]
                      startX: centerElement.width / 2 - centerOuterWidth;      startY: centerElement.height / 2 + centerHeight
            PathLine {     x: centerElement.width / 2 - centerOuterWidth - 20;      y: centerElement.height / 2 + centerHeight}
            PathLine {     x: centerElement.width / 2 - centerOuterWidth - 20;      y: centerElement.height / 2 + centerHeight/2}
            PathLine {     x: centerElement.width / 2;                              y: centerElement.height / 2 }
            PathLine {     x: centerElement.width / 2 - centerOuterWidth;           y: centerElement.height / 2 + centerHeight}
            PathLine {     x: centerElement.width / 2 - centerOuterWidth - 20;      y: centerElement.height / 2 + centerHeight/2}

        }
        ShapePath {
            strokeWidth: 2
            strokeColor: constColors[4]//4
            fillColor: constColors[6]//6
                      startX: centerElement.width / 2 + centerOuterWidth;      startY: centerElement.height / 2 + centerHeight
            PathLine {     x: centerElement.width / 2 + centerOuterWidth + 20;      y: centerElement.height / 2 + centerHeight}
            PathLine {     x: centerElement.width / 2 + centerOuterWidth + 20;      y: centerElement.height / 2 + centerHeight/2}
            PathLine {     x: centerElement.width / 2;                              y: centerElement.height / 2 }
            PathLine {     x: centerElement.width / 2 + centerOuterWidth;           y: centerElement.height / 2 + centerHeight}
            PathLine {     x: centerElement.width / 2 + centerOuterWidth + 20;      y: centerElement.height / 2 + centerHeight/2}
        }
    }
    Shape {
        layer.enabled: true
        layer.smooth: true
        layer.samples: 4

        id: centerElement
        anchors.fill: parent
        ShapePath{
            strokeWidth: 2
            strokeColor: constColors[4]//4
            fillColor: constColors[5]//5

                      startX: centerElement.width / 2;                   startY: centerElement.height / 2
            PathLine {     x: centerElement.width / 2 + centerOuterWidth;     y: centerElement.height / 2 + centerHeight }
            PathLine {     x: centerElement.width / 2 + centerInnerWidth;     y: centerElement.height / 2 + centerHeight }
            PathLine {     x: centerElement.width / 2;                        y: centerElement.height / 2 }
            PathLine {     x: centerElement.width / 2 - centerInnerWidth;     y: centerElement.height / 2 + centerHeight }
            PathLine {     x: centerElement.width / 2 - centerOuterWidth;     y: centerElement.height / 2 + centerHeight }
            PathLine {     x: centerElement.width / 2;                        y: centerElement.height / 2 }
        }
    }
    Shape {
        layer.enabled: true
        layer.smooth: true
        layer.samples: 4
        id: leftElement
        anchors.fill: parent
        ShapePath{
            strokeWidth: 2
            strokeColor: constColors[4]
            fillColor: constColors[5]//5

                      startX: 0;                      startY: leftElement.height/2 - sideHeight
            PathLine {     x: sideWidth;                   y: leftElement.height/2 - sideHeight }
            PathLine {     x: sideWidth + sideOffset;      y: leftElement.height/2 }
            PathLine {     x: sideWidth;                   y: leftElement.height/2 + sideHeight }
            PathLine {     x: 0;                           y: leftElement.height/2 + sideHeight }
            PathLine {     x: 0;                           y: leftElement.height/2 - sideHeight }
        }
    }
    Shape {
        layer.enabled: true
        layer.smooth: true
        layer.samples: 4
        id: rightElement
        anchors.fill: parent
        ShapePath{
            strokeWidth: 2
            strokeColor: constColors[4]
            fillColor: constColors[5]//5

                      startX: rightElement.width;                          startY: rightElement.height/2 - sideHeight
            PathLine {     x: rightElement.width - sideWidth;                   y: rightElement.height/2 - sideHeight }
            PathLine {     x: rightElement.width - sideWidth - sideOffset;      y: rightElement.height/2 }
            PathLine {     x: rightElement.width - sideWidth;                   y: rightElement.height/2 + sideHeight }
            PathLine {     x: rightElement.width;                               y: rightElement.height/2 + sideHeight }
            PathLine {     x: rightElement.width;                               y: rightElement.height/2 - sideHeight }
        }
    }
}


