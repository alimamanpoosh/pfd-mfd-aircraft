import QtQuick.Shapes 1.12
import QtQuick 2.9

Column {
    property double triangleWidth: 20
    property double triangleHeight: 22
    property double space: 3.08
    property double trapeziusWidth: triangleWidth * (1 + space / triangleHeight)

    id: slipSkid
    width: constSlipSkidWidth
    height: constSlipSkidHeight

    Shape {
        id: triangle
        width: parent.width
        height: parent.height
        ShapePath{
            strokeWidth: 0
            strokeColor: constColors[3]
            fillColor: constColors[3]
                      startX: triangle.width/2;                   startY: 0
            PathLine {     x: (triangle.width + triangleWidth)/2;      y: triangleHeight }
            PathLine {     x: (triangle.width - triangleWidth)/2;      y: triangleHeight }
            PathLine {     x: triangle.width/2;                        y: 0 }
        }
    }
    Shape {
        id: trapezius
        width: parent.width
        ShapePath{
            strokeWidth: 0
            strokeColor: constColors[3]
            fillColor: constColors[3]
                      startX: (trapezius.width - trapeziusWidth)/2; startY: triangleHeight + space
            PathLine {     x: (trapezius.width + trapeziusWidth)/2;      y: triangleHeight + space }
            PathLine {     x: slipSkid.width;                            y: slipSkid.height}
            PathLine {     x: 0;                                         y: slipSkid.height }
            PathLine {     x: (trapezius.width - trapeziusWidth)/2;      y: triangleHeight + space }
        }
        transform: Translate
        {
            x: varCoord
        }
    }
}
