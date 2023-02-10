import QtQuick 2.9
import QtQuick.Shapes 1.12
import QtQuick.Controls 2.5

Rectangle {
    id:myAltitudeID1
    width:  varScaleAspectX*constALTW
    height: varScaleAspectY*constALTH
    clip: true
    color: constColors[7]
    border.color: constColors[3]
    border.width: constDotBorder

    Image
    {
        id: altBG;
        source: "qrc:images/ALTBG.png";

        width: varScaleAspectX*constALTW;
        height:varScaleAspectY*constALTH;
    }
    Shape
    {
        id: myIDShape
        height: 5*constAltitudeH
        x: constDotBorder
        y: varScaleAspectY*constALTH/2-height/2

        //like setw in c++ toString().padStart(2, " ");
        //like setfill in c++ ('0000'+93).slice(-4);
        ////////////////4
        Rectangle
        {
            id:myIDRectangle4
            x:6
            y:constAltitudeH
            width: varScaleAspectX*constDotText3
            height: 3*constAltitudeH
            color: constColors[4]
            clip: true
            CText
            {
                id:myIDCText4
                width: myIDRectangle4.width
                y: 3*constAltitudeH/2 - (varAltitudeValue<9900 ? myIDCText4.height/2 : ((varAltitude4+1.5+varAltitude3Hook)*myIDCText4.height/12))
                text:varAltitudeValue<0?"-":(varAltitudeValue<9900 ? " " : constDigitsHide )
                font.pixelSize: varScaleAspectMin*constDotFont7
            }
        }

        ////////////////3
        Rectangle
        {
            id:myIDRectangle3
            x:myIDRectangle4.x+myIDRectangle4.width
            y:constAltitudeH
            width: varScaleAspectX*constDotText3
            height: 3*constAltitudeH
            color: constColors[4]
            clip: true
            CText
            {
                id:myIDCText3
                width: myIDRectangle3.width
                y:3*constAltitudeH/2-(varAltitude3+1.5+varAltitude2Hook)*myIDCText3.height/12
                text:constDigitsOne
                font.pixelSize: varScaleAspectMin*constDotFont7
            }
        }

        ///////////////////2
        Rectangle
        {
            id:myIDRectangle2
            x:myIDRectangle3.x+myIDRectangle3.width
            y:constAltitudeH
            width: varScaleAspectX*constDotText3
            height: 3*constAltitudeH
            color: constColors[4]
            clip: true

            CText
            {
                id:myIDCText2
                width: myIDRectangle2.width
                y:3*constAltitudeH/2-(varAltitude2+1.5+varAltitude01Hook)*myIDCText2.height/12
                text:constDigitsOne
                font.pixelSize: varScaleAspectMin*constDotFont7
            }
        }

        ////////////01
        Rectangle
        {
            id:myIDRectangle01
            x:myIDRectangle2.x+myIDRectangle2.width
            width: varScaleAspectX*constDotText7
            height: 5*constAltitudeH
            color: constColors[4]
            clip: true

            CText
            {
                id:myIDCText01
                width: myIDRectangle01.width
                y:5*constAltitudeH/2-(varAltitude01/20+3.5)*myIDCText01.height/10
                text:constDigitsTwo
            }
        }

        ShapePath
        {
            strokeWidth: constDotBorder
            strokeColor: constColors[3]
            fillColor:   constColors[4]

                  startX: myIDRectangle01.x+myIDRectangle01.width; startY: 5*constAltitudeH/2;
            PathLine { x: myIDRectangle01.x+myIDRectangle01.width;      y: 0}
            PathLine { x: myIDRectangle2.x +myIDRectangle2.width;       y: 0}
            PathLine { x: myIDRectangle2.x +myIDRectangle2.width;       y: constAltitudeH}
            PathLine { x: myIDRectangle4.x;                             y: constAltitudeH}
            PathLine { x: myIDRectangle4.x;                             y: 5*constAltitudeH/2-3*constDotBorder}
            PathLine { x: 0;                                            y: 5*constAltitudeH/2}
            PathLine { x: myIDRectangle4.x;                             y: 5*constAltitudeH/2+3*constDotBorder}
            PathLine { x: myIDRectangle4.x;                             y: 4*constAltitudeH}
            PathLine { x: myIDRectangle2.x +myIDRectangle2.width;       y: 4*constAltitudeH}
            PathLine { x: myIDRectangle2.x +myIDRectangle2.width;       y: 5*constAltitudeH}
            PathLine { x: myIDRectangle01.x+myIDRectangle01.width;      y: 5*constAltitudeH}
            PathLine { x: myIDRectangle01.x+myIDRectangle01.width;      y: 5*constAltitudeH/2}
        }
    }

    /*Rectangle{
        anchors.fill: parent
        anchors.margins: 2
        color: constColors[4]
        opacity: 0.3
    }
    Repeater {
        model: (constAltitudeRange1-constAltitudeRange0)/100 + 1
        Item {
            Rectangle {
                x: 2
                y: (varAltitudeValue - index*100 - constAltitudeRange0 + altitudenumOfDisplay/2)*altitudehCoeficient
                width: 20
                height: 3
            }
            Rectangle {
                visible: (index != 0)
                x: 2
                y: (varAltitudeValue + 20 - index*100 - constAltitudeRange0 + altitudenumOfDisplay/2)*altitudehCoeficient
                width: 10
                height: 3
            }
            Rectangle {
                visible: (index != 0)
                x: 2
                y: (varAltitudeValue + 40 - index*100 - constAltitudeRange0 + altitudenumOfDisplay/2)*altitudehCoeficient
                width: 10
                height: 3
            }
            Rectangle {
                visible: (index != 0)
                x: 2
                y: (varAltitudeValue + 60 - index*100 - constAltitudeRange0 + altitudenumOfDisplay/2)*altitudehCoeficient
                width: 10
                height: 3
            }
            Rectangle {
                visible: (index != 0)
                x: 2
                y: (varAltitudeValue + 80 - index*100 - constAltitudeRange0 + altitudenumOfDisplay/2)*altitudehCoeficient
                width: 10
                height: 3
            }
            CText
            {
                width: constALTW
                x: 10
                y: (varAltitudeValue - index*100 - constAltitudeRange0 + altitudenumOfDisplay/2)*altitudehCoeficient - font.pixelSize/2
                text: (constAltitudeRange0 + index*100)
            }
        }
    }*/
}

