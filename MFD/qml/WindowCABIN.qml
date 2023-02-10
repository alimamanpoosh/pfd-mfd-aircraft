import QtQuick 2.12

Item
{
    id: windowCabinID

    Image
    {
        id: myIDCABINBG;
        source: (0<iniModeMFD && iniModeMFD<constMFDModes-1)?"qrc:images/CABINBG.png":"qrc:images/BG.png"

        x:0;
        y:0;
        width: varScaleAspectX*constCABINW;
        height:varScaleAspectY*constCABINH;
    }

    CLabel
    {
        id: myIDCABIN
        paramWndType : 15
        paramIndex: 0
        x: varScaleAspectX*(constCABINW/2-constDotText0);
        y: 0;
        width: varScaleAspectX*2*constDotText0;
        height: varScaleAspectY*constDotFont1;
        text:"CABIN PRESS"
    }
    CLabel
    {
        id: myIDCABINALT
        paramWndType : 15
        paramIndex: 0
        x: varScaleAspectX*((0<iniModeMFD && iniModeMFD<constMFDModes-1)?constDotNeighbour:constDotFont1+2*constDotNeighbour);
        y: varScaleAspectY*constDotFont1;
        width: varScaleAspectX*constDotText1;
        height: varScaleAspectY*constDotFont1;
        text:(0<iniModeMFD && iniModeMFD<constMFDModes-1)?"ALT":"ALT FT";
    }

    CLabel
    {
        id: myIDCABINRATE
        paramWndType : 15
        paramIndex: 0
        x: varScaleAspectX*(constCABINW-constDotText1-constDotNeighbour);
        y: varScaleAspectY*constDotFont1;
        width: varScaleAspectX*constDotText1;
        height: varScaleAspectY*constDotFont1;
        text:"RATE";
        visible: (0<iniModeMFD && iniModeMFD<constMFDModes-1)?true:false;
    }
    CLabel
    {
        id: myIDCABINFT
        paramWndType : 15
        paramIndex: 0
        font.pixelSize: varScaleAspectMin*constDotFont2
        x: varScaleAspectX*(constCABINW/2-constDotText0);
        y: varScaleAspectY*2*constDotFont1;
        width: varScaleAspectX*2*constDotText0;
        height: varScaleAspectY*constDotFont2;
        text:"FT   X1000   FPM"
        visible: (0<iniModeMFD && iniModeMFD<constMFDModes-1)?true:false;
    }
    CLabel
    {
        id: myIDCABINValue1
        paramWndType : 17
        paramIndex: varCABINIndex1
        x: varScaleAspectX*((0<iniModeMFD && iniModeMFD<constMFDModes-1)?constCABINMargin1-constDotText2-2*constDotBorder:constCABINX1);
        y: varScaleAspectY*((0<iniModeMFD && iniModeMFD<constMFDModes-1)?constSliderPixel[17][0]+constIconTriH/2+constDotNeighbour:constDotFont1);
        width: varScaleAspectX*constDotText0;
        height: varScaleAspectY*constDotFont1;
        text:varCABINValue1
    }
    CLabel
    {
        id: myIDCABINValue2
        paramWndType : 18
        paramIndex: varCABINIndex2
        x: varScaleAspectX*(constCABINMargin2-constDotText2-2*constDotBorder);
        y: varScaleAspectY*(constSliderPixel[18][0]+constIconTriH/2+constDotNeighbour);
        width: varScaleAspectX*constDotText0;
        height: varScaleAspectY*constDotFont1;
        text:varCABINValue2
        visible: (0<iniModeMFD && iniModeMFD<constMFDModes-1)?true:false;
    }
    CLabel
    {
        id: myIDCABINDESTELV
        paramWndType : 15
        paramIndex: 0
        x: varScaleAspectX*constCABINX1;
        y: varScaleAspectY*constCABINY1;
        width: varScaleAspectX*(constDotText0+constDotText3);
        height: varScaleAspectY*constDotFont1;
        text:"DEST ELV"
        visible: (0<iniModeMFD && iniModeMFD<constMFDModes-1)?true:false;
    }
    CLabel
    {
        id: myIDCABINDESTELV3
        paramWndType : 19
        paramIndex: varCABINIndex3
        x: varScaleAspectX*constDotNeighbour;
        y: varScaleAspectY*constCABINY1;
        width: varScaleAspectX*constDotText0;
        height: varScaleAspectY*constDotFont1;
        text: varCABINValue3
        visible: (0<iniModeMFD && iniModeMFD<constMFDModes-1)?true:false;
    }
    CLabel
    {
        id: myIDCABINDIFFPSI
        paramWndType : 15
        paramIndex: 0
        x: varScaleAspectX*((0<iniModeMFD && iniModeMFD<constMFDModes-1)?constCABINX1:3*constDotNeighbour);
        y: varScaleAspectY*((0<iniModeMFD && iniModeMFD<constMFDModes-1)?constCABINY2:constCABINY3);
        width: varScaleAspectX*(constDotText0+constDotText3);
        height: varScaleAspectY*constDotFont1;
        text:"DIFF PSI"
    }
    CLabel
    {
        id: myIDCABINDIFFPSI4
        paramWndType : 20
        paramIndex: varCABINIndex4
        x: varScaleAspectX*((0<iniModeMFD && iniModeMFD<constMFDModes-1)?constDotFont2:constCABINW-constDotText2-constDotText3);
        y: varScaleAspectY*((0<iniModeMFD && iniModeMFD<constMFDModes-1)?constCABINY2:constCABINY3);
        width: varScaleAspectX*constDotText2;
        height: varScaleAspectY*constDotFont1;
        text: varCABINValue4.toFixed(1)
    }

    Image
    {
        id: myIDCABINTri1;
        source: "qrc:images/Tri2"+constColorStrs[constColorName[17][varCABINIndex1]]+".png"
        x:varScaleAspectX*constCABINCol1;
        y:varScaleAspectY*constCABINSliderY1;
        width: varScaleAspectX*constIconTriW;
        height:varScaleAspectY*constIconTriH;
        visible: (0<iniModeMFD && iniModeMFD<constMFDModes-1)?true:false;
    }
    Image
    {
        id: myIDCABINTri2;
        source: "qrc:images/Tri2"+constColorStrs[constColorName[18][varCABINIndex2]]+".png"
        x:varScaleAspectX*constCABINCol2;
        y:varScaleAspectY*constCABINSliderY2;
        width: varScaleAspectX*constIconTriW;
        height:varScaleAspectY*constIconTriH;
        visible: (0<iniModeMFD && iniModeMFD<constMFDModes-1)?true:false;
    }
    Image
    {
        id: myIDCABINTri4;
        source: "qrc:images/Tri4"+constColorStrs[constColorName[20][varCABINIndex4]]+".png"
        x:varScaleAspectX*constCABINSliderX4;
        y:varScaleAspectY*constCABINSliderY4;
        width: varScaleAspectX*constIconTriH;
        height:varScaleAspectY*constIconTriW;
        visible: (0<iniModeMFD && iniModeMFD<constMFDModes-1)?true:false;
    }
}


