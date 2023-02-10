import QtQuick 2.12

Item
{
    id: windowCASID

    Image
    {
        id: myIDCASBG
        source: "qrc:images/BG.png";

        x:0;
        y:0;
        width: varScaleAspectX*constCASW;
        height:parent.height
        fillMode: Image.Stretch
    }
    CLabel
    {
        id: casTextID1
        paramWndType : 13
        paramIndex: 3
        x: varScaleAspectX*constDotNeighbour
        y: varScaleAspectY*0*constDotFont1;
        width: varScaleAspectX*3*constDotText0;
        height: varScaleAspectY*constDotFont1;
        text:"OIL PRESS LO L"
        horizontalAlignment: Text.AlignLeft;
    }

    CLabel
    {
        id: casTextID2
        paramWndType : 13
        paramIndex: 3
        x: varScaleAspectX*constDotNeighbour
        y: varScaleAspectY*1*constDotFont1;
        width: varScaleAspectX*3*constDotText0;
        height: varScaleAspectY*constDotFont1;
        text:"CABINET ALT"
        horizontalAlignment: Text.AlignLeft;
    }
    CLabel
    {
        id: casTextID3
        paramWndType : 13
        paramIndex : 2
        x: varScaleAspectX*constDotNeighbour
        y: varScaleAspectY*2*constDotFont1;
        width: varScaleAspectX*3*constDotText0;
        height: varScaleAspectY*constDotFont1;
        text:"T2 HTR FAIL R"
        horizontalAlignment: Text.AlignLeft;
    }
    CLabel
    {
        id: casTextID4
        paramWndType : 13
        paramIndex : 2
        x: varScaleAspectX*constDotNeighbour
        y: varScaleAspectY*3*constDotFont1;
        width: varScaleAspectX*3*constDotText0;
        height: varScaleAspectY*constDotFont1;
        text:"W/S O'HEAT L"
        horizontalAlignment: Text.AlignLeft;
    }
    CLabel
    {
        id: casTextID5
        paramWndType : 13
        paramIndex : 2
        x: varScaleAspectX*constDotNeighbour
        y: varScaleAspectY*4*constDotFont1;
        width: varScaleAspectX*3*constDotText0;
        height: varScaleAspectY*constDotFont1;
        text:"W/S A/I FAIL L"
        horizontalAlignment: Text.AlignLeft;
    }
    /*CLabel
    {
        id: casTextID6
        paramWndType : 13
        paramIndex : 2
        x: varScaleAspectX*constDotNeighbour
        y: varScaleAspectY*5*constDotFont1;
        width: varScaleAspectX*3*constDotText0;
        height: varScaleAspectY*constDotFont1;
        text:"FUEL PRES LO R"
        horizontalAlignment: Text.AlignLeft;
    }
    CLabel
    {
        id: casTextID7
        paramWndType : 13
        paramIndex : 2
        x: varScaleAspectX*constDotNeighbour
        y: varScaleAspectY*6*constDotFont1;
        width: varScaleAspectX*3*constDotText0;
        height: varScaleAspectY*constDotFont1;
        text:"ENG A/I COLD L"
        horizontalAlignment: Text.AlignLeft;
    }
    CLabel
    {
        id: casTextID8
        paramWndType : 13
        paramIndex : 2
        x: varScaleAspectX*constDotNeighbour
        y: varScaleAspectY*7*constDotFont1;
        width: varScaleAspectX*3*constDotText0;
        height: varScaleAspectY*constDotFont1;
        text:"CABIN DOOR"
        horizontalAlignment: Text.AlignLeft;
    }
    CLabel
    {
        id: casTextID9
        paramWndType : 13
        paramIndex : 2
        x: varScaleAspectX*constDotNeighbour
        y: varScaleAspectY*8*constDotFont1;
        width: varScaleAspectX*3*constDotText0;
        height: varScaleAspectY*constDotFont1;
        text:"AFT DOOR"
        horizontalAlignment: Text.AlignLeft;
    }*/
    CLabel
    {
        id: casTextID10
        paramWndType : 13
        paramIndex : 2
        x: varScaleAspectX*constDotNeighbour
        y: varScaleAspectY*5*constDotFont1;
        width: varScaleAspectX*3*constDotText0;
        height: varScaleAspectY*constDotFont1;
        text:"P/S HTR L"
        horizontalAlignment: Text.AlignLeft;
    }
    CLabel
    {
        id: casTextID11
        paramWndType : 13
        paramIndex : 1
        x: varScaleAspectX*constDotNeighbour
        y: varScaleAspectY*6*constDotFont1;
        width: varScaleAspectX*3*constDotText0;
        height: varScaleAspectY*constDotFont1;
        text:"F/W SHUTOFF R"
        horizontalAlignment: Text.AlignLeft;
    }
    CLabel
    {
        id: casTextID12
        paramWndType : 13
        paramIndex : 1
        x: varScaleAspectX*constDotNeighbour
        y: varScaleAspectY*7*constDotFont1;
        width: varScaleAspectX*3*constDotText0;
        height: varScaleAspectY*constDotFont1;
        text:"SURFACE DE-ICE"
        horizontalAlignment: Text.AlignLeft;
    }
    /*CLabel
    {
        id: casTextID13
        paramWndType : 13
        paramIndex : 1
        x: varScaleAspectX*constDotNeighbour
        y: varScaleAspectY*12*constDotFont1;
        width: varScaleAspectX*1*constDotText0;
        height: varScaleAspectY*constDotFont1;
        text:"SPD BRK EXTEND"
        horizontalAlignment: Text.AlignLeft;
    }
    CLabel
    {
        id: casTextID14
        paramWndType : 13
        paramIndex : 1
        x: varScaleAspectX*constDotNeighbour
        y: varScaleAspectY*13*constDotFont1;
        width: varScaleAspectX*1*constDotText0;
        height: varScaleAspectY*constDotFont1;
        text:"FUEL TRANSFER"
        horizontalAlignment: Text.AlignLeft;
    }*/

    Text
    {
        id: casTextID15
        x: varScaleAspectX*constDotNeighbour
        y: varScaleAspectY*8*constDotFont1;
        color:constColors[3]
        width: varScaleAspectX*1*constDotText0;
        height: varScaleAspectY*constDotFont1;
        text:varTempMessage2
        font.pixelSize:8
        horizontalAlignment: Text.AlignLeft;
    }
    Text
    {
        id: casTextID16
        x: varScaleAspectX*constDotNeighbour
        y: varScaleAspectY*12*constDotFont1;
        color:constColors[3]
        width: varScaleAspectX*1*constDotText0;
        height: varScaleAspectY*constDotFont1;
        text:varTempMessage
        font.pixelSize:8
        horizontalAlignment: Text.AlignLeft;
    }

}


