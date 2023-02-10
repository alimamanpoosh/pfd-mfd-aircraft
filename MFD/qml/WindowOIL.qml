import QtQuick 2.12

Item
{
    id: windowoilID

    Image
    {
        id: oilBG1;
        source: (0<iniModeMFD && iniModeMFD<constMFDModes-1)?"qrc:images/OILBG.png":"qrc:images/BG.png"

        x:0;
        y:0;
        width: varScaleAspectX*constOILW;
        height:varScaleAspectY*constOILH;
    }

    CLabel
    {
        id: myIDOIL
        paramWndType : 15
        paramIndex: 0
        x: varScaleAspectX*((0<iniModeMFD && iniModeMFD<constMFDModes-1)?(constOILW/2-constDotText3/2):constOILX1);
        y: 0
        width: varScaleAspectX*constDotText3;
        height: varScaleAspectY*constDotFont1;
        text:"OIL"
    }
    CLabel
    {
        id: myIDOILPSI
        paramWndType : 15
        paramIndex: 0
        x: varScaleAspectX*((0<iniModeMFD && iniModeMFD<constMFDModes-1)?(constOILCol1+constOILCol2-constDotText3)/2:constOILX1);
        y: varScaleAspectY*((0<iniModeMFD && iniModeMFD<constMFDModes-1)?constDotNeighbour:constDotFont1);
        width: varScaleAspectX*constDotText3;
        height: varScaleAspectY*constDotFont1;
        text:"PSI"
    }
    CLabel
    {
        id: myIDOILC
        paramWndType : 15
        paramIndex: 0
        x: varScaleAspectX*((0<iniModeMFD && iniModeMFD<constMFDModes-1)?(constOILCol3+constOILCol4-constDotText3)/2:constOILX1);
        y: varScaleAspectY*((0<iniModeMFD && iniModeMFD<constMFDModes-1)?constDotNeighbour:constOILY2);
        width: varScaleAspectX*constDotText3;
        height: varScaleAspectY*constDotFont1;
        text:String.fromCharCode(0176)+"C"
    }
    CLabel
    {
        id: myIDOILValue1
        text : varOILValue1
        paramWndType : 4
        paramIndex: varOILIndex1
        x: varScaleAspectX*((0<iniModeMFD && iniModeMFD<constMFDModes-1)?(constOILCol1+constOILCol2)/2-constDotText2-2*constDotBorder:constDotNeighbour);
        y: varScaleAspectY*((0<iniModeMFD && iniModeMFD<constMFDModes-1)?constOILY1:constDotFont1)
        width: varScaleAspectX*constDotText2;
        height: varScaleAspectY*constDotFont1;
    }
    CLabel
    {
        id: myIDOILValue2
        text : varOILValue2
        paramWndType : 4
        paramIndex: varOILIndex2
        x: varScaleAspectX*((0<iniModeMFD && iniModeMFD<constMFDModes-1)?(constOILCol1+constOILCol2)/2+2*constDotBorder:constOILX2);
        y: varScaleAspectY*((0<iniModeMFD && iniModeMFD<constMFDModes-1)?constOILY1:constDotFont1)
        width: varScaleAspectX*constDotText2;
        height: varScaleAspectY*constDotFont1;
    }
    CLabel
    {
        id: myIDOILValue3
        text : varOILValue3
        paramWndType : 5
        paramIndex: varOILIndex3
        x: varScaleAspectX*((0<iniModeMFD && iniModeMFD<constMFDModes-1)?(constOILCol3+constOILCol4)/2-constDotText2-2*constDotBorder:constDotNeighbour);
        y: varScaleAspectY*((0<iniModeMFD && iniModeMFD<constMFDModes-1)?constOILY1:constOILY2)
        width: varScaleAspectX*constDotText2;
        height: varScaleAspectY*constDotFont1;
    }
    CLabel
    {
        id: myIDOILValue4
        text : varOILValue4
        paramWndType : 5
        paramIndex: varOILIndex4
        x: varScaleAspectX*((0<iniModeMFD && iniModeMFD<constMFDModes-1)?(constOILCol3+constOILCol4)/2+2*constDotBorder:constOILX2);
        y: varScaleAspectY*((0<iniModeMFD && iniModeMFD<constMFDModes-1)?constOILY1:constOILY2)
        width: varScaleAspectX*constDotText2;
        height: varScaleAspectY*constDotFont1;
    }

    Image
    {
        id: myIDOILTri1;
        source: "qrc:images/Tri1"+constColorStrs[constColorName[4][varOILIndex1]]+".png"
        x:varScaleAspectX*(constOILCol1-constIconTriW);
        y:varScaleAspectY*constOILSliderY1;
        width: varScaleAspectX*constIconTriW;
        height:varScaleAspectY*constIconTriH;
        visible:(0<iniModeMFD && iniModeMFD<constMFDModes-1)?true:false;
    }
    Image
    {
        id: myIDOILTri2;
        source: "qrc:images/Tri2"+constColorStrs[constColorName[4][varOILIndex2]]+".png"
        x:varScaleAspectX*constOILCol2;
        y:varScaleAspectY*constOILSliderY2;
        width: varScaleAspectX*constIconTriW;
        height:varScaleAspectY*constIconTriH;
        visible:(0<iniModeMFD && iniModeMFD<constMFDModes-1)?true:false;
    }

    Image
    {
        id: myIDOILTri3
        source: "qrc:images/Tri1"+constColorStrs[constColorName[5][varOILIndex3]]+".png"
        x:varScaleAspectX*(constOILCol3-constIconTriW);
        y:varScaleAspectY*constOILSliderY3;
        width: varScaleAspectX*constIconTriW;
        height:varScaleAspectY*constIconTriH;
        visible:(0<iniModeMFD && iniModeMFD<constMFDModes-1)?true:false;
    }
    Image
    {
        id: myIDOILTri4;
        source: "qrc:images/Tri2"+constColorStrs[constColorName[5][varOILIndex4]]+".png"
        x:varScaleAspectX*constOILCol4;
        y:varScaleAspectY*constOILSliderY4;
        width: varScaleAspectX*constIconTriW;
        height:varScaleAspectY*constIconTriH;
        visible:(0<iniModeMFD && iniModeMFD<constMFDModes-1)?true:false;
    }

}


