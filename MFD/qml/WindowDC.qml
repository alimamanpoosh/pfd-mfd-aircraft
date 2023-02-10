import QtQuick 2.12

Item
{
    id: windowDCID

    Image
    {
        id: myIDDCBG;
        source: (0<iniModeMFD && iniModeMFD<constMFDModes-1)?"qrc:images/DCBG.png":"qrc:images/BG.png"

        x:0;
        y:0;
        width: varScaleAspectX*constDCW;
        height:varScaleAspectY*constDCH;
    }

    CLabel
    {
        id: myIDDCDC
        paramWndType : 15
        paramIndex : 0
        x: varScaleAspectX*(constDCW-constDotText3)/2;
        y: 0;
        width: varScaleAspectX*constDotText3;
        height: varScaleAspectY*constDotFont1;
        text:"DC"
        visible:(0<iniModeMFD && iniModeMFD<constMFDModes-1)?true:false;
    }
    CLabel
    {
        id: myIDDCVOLTS
        paramWndType : 15
        paramIndex : 0
        x: varScaleAspectX*((0<iniModeMFD && iniModeMFD<constMFDModes-1)?constDotNeighbour:constDCX1);
        y: varScaleAspectY*constDotNeighbour;
        width: varScaleAspectX*constDotText0;
        height: varScaleAspectY*constDotFont1;
        text:(0<iniModeMFD && iniModeMFD<constMFDModes-1)?"VOLTS":"DC VOLTS"
    }
    CLabel
    {
        id: myIDDCValue1
        text : varDCValue1
        paramWndType : 8
        paramIndex : varDCIndex1
        x: varScaleAspectX*((0<iniModeMFD && iniModeMFD<constMFDModes-1)?(constDCCol1+constDCCol2)/2-constDotText3-2*constDotBorder:constDotNeighbour);
        y: varScaleAspectY*((0<iniModeMFD && iniModeMFD<constMFDModes-1)?constDCY1:constDotNeighbour);
        width: varScaleAspectX*constDotText3;
        height: varScaleAspectY*constDotFont1;
    }
    CLabel
    {
        id: myIDDCValue2
        text : varDCValue2
        paramWndType : 8
        paramIndex : varDCIndex2
        x: varScaleAspectX*((0<iniModeMFD && iniModeMFD<constMFDModes-1)?(constDCCol1+constDCCol2)/2+2*constDotBorder:constDCX2);
        y: varScaleAspectY*((0<iniModeMFD && iniModeMFD<constMFDModes-1)?constDCY1:constDotNeighbour);
        width: varScaleAspectX*constDotText3;
        height: varScaleAspectY*constDotFont1;
    }

    CLabel
    {
        id: myIDDCAMPS
        paramWndType : 15
        paramIndex : 0
        x: varScaleAspectX*((0<iniModeMFD && iniModeMFD<constMFDModes-1)?constDCW-constDotText0-constDotNeighbour:constDCX1);
        y: varScaleAspectY*((0<iniModeMFD && iniModeMFD<constMFDModes-1)?constDotNeighbour:constDCY3);
        width: varScaleAspectX*constDotText0;
        height: varScaleAspectY*constDotFont1;
        text:(0<iniModeMFD && iniModeMFD<constMFDModes-1)?"AMPS":"DC AMPS"
    }
    CLabel
    {
        id: myIDDCValue3
        text : varDCValue3
        paramWndType : 9
        paramIndex : varDCIndex3
        x: varScaleAspectX*((0<iniModeMFD && iniModeMFD<constMFDModes-1)?(constDCCol3+constDCCol4)/2-constDotText2-2*constDotBorder:constDotNeighbour);
        y: varScaleAspectY*((0<iniModeMFD && iniModeMFD<constMFDModes-1)?constDCY1:constDCY3);
        width: varScaleAspectX*constDotText2;
        height: varScaleAspectY*constDotFont1;
    }
    CLabel
    {
        id: myIDDCValue4
        text : varDCValue4
        paramWndType : 9
        paramIndex : varDCIndex4
        x: varScaleAspectX*((0<iniModeMFD && iniModeMFD<constMFDModes-1)?(constDCCol3+constDCCol4)/2+2*constDotBorder:constDCX3);
        y: varScaleAspectY*((0<iniModeMFD && iniModeMFD<constMFDModes-1)?constDCY1:constDCY3);
        width: varScaleAspectX*constDotText2;
        height: varScaleAspectY*constDotFont1;
    }

    CLabel
    {
        id: myIDDCBattery
        paramWndType : 15
        paramIndex : 0
        x: varScaleAspectX*((0<iniModeMFD && iniModeMFD<constMFDModes-1)?constDCW/2-constDotText0:constDotNeighbour);
        y: varScaleAspectY*((0<iniModeMFD && iniModeMFD<constMFDModes-1)?constSliderPixel[9][0]+constDotFont1+constIconTriH/2+constDotNeighbour:constDCY4);
        width: varScaleAspectX*2*constDotText0;
        height: varScaleAspectY*constDotFont1;
        text:(0<iniModeMFD && iniModeMFD<constMFDModes-1)?"BATTERY":"BATT VOLTS"
    }
    CLabel
    {
        id: myIDDCValue55
        paramWndType : 15
        paramIndex : 0
        x: varScaleAspectX*constDotNeighbour;
        y: varScaleAspectY*constDCY2
        width: varScaleAspectX*constDotText3;
        height: varScaleAspectY*constDotFont1;
        text:"V="
        visible:(0<iniModeMFD && iniModeMFD<constMFDModes-1)?true:false;
    }
    CLabel
    {
        id: myIDDCValue5
        text : varDCBATTV
        paramWndType : 8
        paramIndex : varDCBATTVIndex
        x: varScaleAspectX*((0<iniModeMFD && iniModeMFD<constMFDModes-1)?constDotText3+constDotNeighbour:constDCX3);
        y: varScaleAspectY*((0<iniModeMFD && iniModeMFD<constMFDModes-1)?constDCY2:constDCY4);
        width: varScaleAspectX*constDotText3;
        height: varScaleAspectY*constDotFont1;
    }
    CLabel
    {
        id: myIDDCValue66
        paramWndType : 15
        paramIndex : 0
        x: varScaleAspectX*(constDCW-constDotText2-constDotText3-constDotNeighbour);
        y: varScaleAspectY*constDCY2
        width: varScaleAspectX*constDotText3;
        height: varScaleAspectY*constDotFont1;
        text:"A="
        visible:(0<iniModeMFD && iniModeMFD<constMFDModes-1)?true:false;
    }
    CLabel
    {
        id: myIDDCValue6
        text : varDCBATTA
        paramWndType : 9
        paramIndex : varDCBATTAIndex
        x: varScaleAspectX*constDCX3;
        y: varScaleAspectY*constDCY2
        width: varScaleAspectX*constDotText2;
        height: varScaleAspectY*constDotFont1;
        visible:(0<iniModeMFD && iniModeMFD<constMFDModes-1)?true:false;
    }

    Image
    {
        id: myIDDCTri1;
        source: "qrc:images/Tri1"+constColorStrs[constColorName[8][varDCIndex1]]+".png"
        x:varScaleAspectX*(constDCCol1-constIconTriW);
        y:varScaleAspectY*constDCSliderY1;
        width: varScaleAspectX*constIconTriW;
        height:varScaleAspectY*constIconTriH;
        visible:(0<iniModeMFD && iniModeMFD<constMFDModes-1)?true:false;
    }
    Image
    {
        id: myIDDCTri2;
        source: "qrc:images/Tri2"+constColorStrs[constColorName[8][varDCIndex2]]+".png"
        x:varScaleAspectX*constDCCol2;
        y:varScaleAspectY*constDCSliderY2;
        width: varScaleAspectX*constIconTriW;
        height:varScaleAspectY*constIconTriH;
        visible:(0<iniModeMFD && iniModeMFD<constMFDModes-1)?true:false;
    }

    Image
    {
        id: myIDDCTri3
        source: "qrc:images/Tri1"+constColorStrs[constColorName[9][varDCIndex3]]+".png"
        x:varScaleAspectX*(constDCCol3-constIconTriW);
        y:varScaleAspectY*constDCSliderY3;
        width: varScaleAspectX*constIconTriW;
        height:varScaleAspectY*constIconTriH;
        visible:(0<iniModeMFD && iniModeMFD<constMFDModes-1)?true:false;
    }
    Image
    {
        id: myIDDCTri4;
        source: "qrc:images/Tri2"+constColorStrs[constColorName[9][varDCIndex4]]+".png"
        x:varScaleAspectX*constDCCol4;
        y:varScaleAspectY*constDCSliderY4;
        width: varScaleAspectX*constIconTriW;
        height:varScaleAspectY*constIconTriH;
        visible:(0<iniModeMFD && iniModeMFD<constMFDModes-1)?true:false;
    }
}


