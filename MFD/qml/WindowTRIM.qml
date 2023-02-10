import QtQuick 2.12

Item
{
    id: windowTrimID

    Image
    {
        id: trimBG;
        source: "qrc:images/TRIMBG.png";

        x:0;
        y:0;
        width: varScaleAspectX*constTRIMW;
        height:varScaleAspectY*constTRIMH;
    }
    CLabel
    {
        id: myIDTRIM
        paramWndType : 15
        paramIndex: 0
        x: varScaleAspectX*(constTRIMW/2-constDotText2/2);
        y: 0;
        width: varScaleAspectX*constDotText2;
        height: varScaleAspectY*constDotFont1;
        text:"TRIM"
    }
    CLabel
    {
        id: myIDAILERON
        paramWndType : 15
        paramIndex: 0
        x: varScaleAspectX*(constTRIMW/2-constDotText2/2);
        y: varScaleAspectY*(constDotFont1);
        width: varScaleAspectX*constDotText2;
        height: varScaleAspectY*constDotFont1;
        text:"AILERON"
    }
    CLabel
    {
        id: myIDL
        paramWndType : 15
        paramIndex: 0
        x: 0;
        y: varScaleAspectY*(constTRIMH/2);
        width: varScaleAspectX*constDotText3;
        height: varScaleAspectY*constDotFont1;
        text:"L"
    }
    CLabel
    {
        id: myIDR
        paramWndType : 15
        paramIndex: 0
        x: varScaleAspectX*(constTRIMW-constDotText3);
        y: varScaleAspectY*(constTRIMH/2);
        width: varScaleAspectX*constDotText3;
        height: varScaleAspectY*constDotFont1;
        text:"R"
    }
    CLabel
    {
        id: myIDRUDDER
        paramWndType : 15
        paramIndex: 0
        x: varScaleAspectX*(constTRIMW/2-constDotText2/2);
        y: varScaleAspectY*(constTRIMH-constDotFont1);
        width: varScaleAspectX*constDotText2;
        height: varScaleAspectY*constDotFont1;
        text:"RUDDER"
    }
    Image
    {
        id: myIDTRIMTri3;
        source: "qrc:images/Tri3"+constColorStrs[constColorName[14][varTRIMIndex1]]+".png"
        x:varScaleAspectX*constTRIMSliderX1;
        y:varScaleAspectY*(constTRIMRow1-constIconTriW);
        width: varScaleAspectX*constIconTriH;
        height:varScaleAspectY*constIconTriW;
    }
    Image
    {
        id: myIDTRIMTri4;
        source: "qrc:images/Tri4"+constColorStrs[constColorName[14][varTRIMIndex2]]+".png"
        x:varScaleAspectX*constTRIMSliderX2;
        y:varScaleAspectY*constTRIMRow2;
        width: varScaleAspectX*constIconTriH;
        height:varScaleAspectY*constIconTriW;
    }
}


