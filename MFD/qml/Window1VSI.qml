/*
*/
import QtQuick.Shapes 1.12
import QtQuick 2.9
import QtQuick.Controls 2.5
import QtQuick.Extras 1.4
import QtQuick.Controls.Styles 1.4

Item
{
    Image
    {
        id: pRVSI;
        source: "qrc:images/RSVI.png";
        x:- widthRVSIstart
        y:- heightRVSI/2- varRVSIValue/ scaleVSIarow
        z:1
        width: widthRVSI
        height: heightRVSI//32:(->26
    }

    Image
    {
        id: pbugVSI;
        source: "qrc:images/N1Bug2.png";
        x:0
        y:- heightBugVSI/2- heightVSIp- varVSIBugValue/ scaleVSIarow
        width: widthBugVSI
        height: heightBugVSI
    }

    CLabel
    {
        text: varVSIBugValue
        y:- constVSIH/2- heightVNVVSI
        x:- constDotBorder
        paramWndType: 30
        paramIndex:0
        height:  heightVNVVSI
        width:  widthVNVVSI
    }

    CLabel
    {
        text: varVNVtargetAltitudeVSIvar
        y:- constVSIH/2- heightVNVVSI*2+ constDotBorder
        x:- constDotBorder
        paramWndType: 30
        paramIndex:1
        height:  heightVNVVSI
        width:  widthVNVVSI
    }

    Shape
    {
        opacity: 0.3
        ShapePath
        {
            id:trapzeius_down
            strokeWidth:  constDotBorder
            fillColor:    constColors[4]
            strokeColor:  constColors[3]
                     startX: 0;        startY:  constVSIH/2
            PathLine{     x: 0;             y: 0}
            PathLine{     x: widthVSIr;     y: heightVSIr}
            PathLine{     x: widthVSIr;     y:  constVSIH/2}
            PathLine{     x: 0;             y:  constVSIH/2}
        }
    }
    Shape
    {
        opacity: 0.3
        ShapePath
        {
            id:trapezius_up
            strokeWidth:  constDotBorder
            strokeColor:  constColors[3]
            fillColor:    constColors[4]
                     startX:0;        startY: 0
            PathLine{     x:0;             y: - constVSIH/2}
            PathLine{     x: widthVSIr;    y: - constVSIH/2}
            PathLine{     x: widthVSIr;    y: -heightVSIr}
            PathLine{     x:0;             y: 0}
        }
    }
    //Designing line ruler & numbers in front of it

    Repeater
    {
        model: 9
        Item {
            Rectangle {
                x:0
                y:(3* heightVSIa-  constVSIH)/2+index* heightVSId    //-141
                width:index%2==0?  widthVSIa:3* widthVSIa/5  //20 : 12
                height:  heightVSIp //2
                border.width:  constDotBorder*3/2 //3
                border.color:  constColors[3]
                color:  constColors[3]
            }
            Text {
                visible: (index%2==0 && index!=4)
                x: widthVSIt //23
                text:((index)<4)?qsTr(""+((index*-1)+4)):qsTr(""+(index-4))
                color:  constColors[3]
                font.family:  constFontFamily
                font.pixelSize:  varScaleAspectMin* constDotFont1
                font.bold:true
                y:-  heightVSIt+(index* heightVSId)
            }
        }
    }

    //Designing black_arrows & numbers inside

    Shape
    {
        id:arrows
        y:- varVSIValue/ scaleVSIarow  //Esmaeili

        ShapePath
        {
            strokeWidth:  constDotBorder/2
            strokeColor:  constColors[3]
            fillColor:    constColors[4]
                     startX: widthVSIa;  startY:  heightVSIa
            PathLine{     x:0;                y: 0}
            PathLine{     x: widthVSIa;       y: -heightVSIa}
            PathLine{     x:  constVSIW;        y: -heightVSIa}
            PathLine{     x:  constVSIW;        y:  heightVSIa}
            PathLine{     x: widthVSIa;       y:  heightVSIa}
        }
        Text
        {
            text: qsTr(""+ varVSIValue)
            // x:825
            // y:275
            x: widthVSIa- widthVSIa/20
            y:- heightVSIa+2* heightVSIa/10
            color:  constColors[3]
            font.family:  constFontFamily
            font.pixelSize:  varScaleAspectMin* constDotFont1
            font.bold:true
        }
    }
}

