import QtQuick 2.12

Item
{
    id: windowFuelID

    Image
    {
        id: myIDFUELBG;
        source: (0<iniModeMFD && iniModeMFD<constMFDModes-1)?"qrc:images/FUELBG.png":"qrc:images/BG.png"

        x:0;
        y:0;
        width: varScaleAspectX*constFUELW;
        height:varScaleAspectY*constFUELH;
    }

    CLabel
    {
        id: myIDFUELFUEL
        paramWndType : 15
        paramIndex: 0
        x: varScaleAspectX*constFUELX1
        y: 0
        width: varScaleAspectX*constDotText0;
        height: varScaleAspectY*constDotFont1;
        text:(0<iniModeMFD && iniModeMFD<constMFDModes-1)?"FUEL QTY":"FUEL"
    }
    CLabel
    {
        id: myIDFUEL2000
        paramWndType : 15
        paramIndex: 0
        x: varScaleAspectX*constFUELX1
        y: varScaleAspectY*(constSliderPixel[10][0]-20*(constSliderPixel[10][0]-constSliderPixel[10][2])/22-constDotFont1/2)
        width: varScaleAspectX*constDotText0;
        height: varScaleAspectY*constDotFont1;
        text:"2000"
        visible:(0<iniModeMFD && iniModeMFD<constMFDModes-1)?true:false;
    }
    CLabel
    {
        id: myIDFUEL1500
        paramWndType : 15
        paramIndex: 0
        x: varScaleAspectX*constFUELX1
        y: varScaleAspectY*(constSliderPixel[10][0]-15*(constSliderPixel[10][0]-constSliderPixel[10][2])/22-constDotFont1/2)
        width: varScaleAspectX*constDotText0;
        height: varScaleAspectY*constDotFont1;
        text:"1500"
        visible:(0<iniModeMFD && iniModeMFD<constMFDModes-1)?true:false;
    }
    CLabel
    {
        id: myIDFUEL1000
        paramWndType : 15
        paramIndex: 0
        x: varScaleAspectX*constFUELX1
        y: varScaleAspectY*(constSliderPixel[10][0]-10*(constSliderPixel[10][0]-constSliderPixel[10][2])/22-constDotFont1/2)
        width: varScaleAspectX*constDotText0;
        height: varScaleAspectY*constDotFont1;
        text:"1000"
        visible:(0<iniModeMFD && iniModeMFD<constMFDModes-1)?true:false;
    }
    CLabel
    {
        id: myIDFUEL500
        paramWndType : 15
        paramIndex: 0
        x: varScaleAspectX*constFUELX1
        y: varScaleAspectY*(constSliderPixel[10][0]-5*(constSliderPixel[10][0]-constSliderPixel[10][2])/22-constDotFont1/2)
        width: varScaleAspectX*constDotText0;
        height: varScaleAspectY*constDotFont1;
        text:"500"
        visible:(0<iniModeMFD && iniModeMFD<constMFDModes-1)?true:false;
    }
    CLabel
    {
        id: myIDFUELLBS
        paramWndType : 15
        paramIndex: 0
        x: varScaleAspectX*constFUELX1
        y: varScaleAspectY*((0<iniModeMFD && iniModeMFD<constMFDModes-1)?constFUELY1:constDotFont1)
        width: varScaleAspectX*constDotText0;
        height: varScaleAspectY*constDotFont1;
        text:"LBS"
    }
    CLabel
    {
        id: myIDFUELValue1
        paramWndType : 10
        paramIndex: varFUELIndex1
        x: varScaleAspectX*((0<iniModeMFD && iniModeMFD<constMFDModes-1)?constFUELSliderTextX1:constDotNeighbour);
        y: varScaleAspectY*((0<iniModeMFD && iniModeMFD<constMFDModes-1)?constFUELY1:constDotFont1)
        width: varScaleAspectX*constDotText0;
        height: varScaleAspectY*constDotFont1;
        text:varFUELValue1
    }
    CLabel
    {
        id: myIDFUELValue2
        paramWndType : 10
        paramIndex: varFUELIndex2
        x: varScaleAspectX*((0<iniModeMFD && iniModeMFD<constMFDModes-1)?constFUELSliderTextX2:constFUELX2);
        y: varScaleAspectY*((0<iniModeMFD && iniModeMFD<constMFDModes-1)?constFUELY1:constDotFont1)
        width: varScaleAspectX*constDotText0;
        height: varScaleAspectY*constDotFont1;
        text:varFUELValue2
    }

    CLabel
    {
        id: myIDFUELValueSum
        text : varFUELValue1+varFUELValue2
        paramWndType : 10
        paramIndex: Math.max(varFUELIndex1,varFUELIndex2)
        x: varScaleAspectX*constFUELX1
        y: varScaleAspectY*(constFUELY1+constDotFont1)
        width: varScaleAspectX*constDotText0;
        height: varScaleAspectY*constDotFont1;
        visible:(0<iniModeMFD && iniModeMFD<constMFDModes-1)?true:false;
    }
    CLabel
    {
        id: myIDFUELPPH
        paramWndType : 15
        paramIndex: 0
        x: varScaleAspectX*constFUELX1
        y: varScaleAspectY*((0<iniModeMFD && iniModeMFD<constMFDModes-1)?constFUELY2:constFUELY4)
        width: varScaleAspectX*constDotText0;
        height: varScaleAspectY*constDotFont1;
        text:"PPH"
    }

    CLabel
    {
        id: myIDFUELPPHValue1
        text : varFUELPPHValue1
        paramWndType : 11
        paramIndex: varFUELPPHIndex1
        x: varScaleAspectX*((0<iniModeMFD && iniModeMFD<constMFDModes-1)?constFUELSliderTextX1:constDotNeighbour);
        y: varScaleAspectY*((0<iniModeMFD && iniModeMFD<constMFDModes-1)?constFUELY2:constFUELY4)
        width: varScaleAspectX*constDotText0;
        height: varScaleAspectY*constDotFont1;
    }

    CLabel
    {
        id: myIDFUELPPHValue2
        text : varFUELPPHValue2
        paramWndType : 11
        paramIndex: varFUELPPHIndex2
        x: varScaleAspectX*((0<iniModeMFD && iniModeMFD<constMFDModes-1)?constFUELSliderTextX2:constFUELX2);
        y: varScaleAspectY*((0<iniModeMFD && iniModeMFD<constMFDModes-1)?constFUELY2:constFUELY4)
        width: varScaleAspectX*constDotText0;
        height: varScaleAspectY*constDotFont1;
    }

    CLabel
    {
        id: myIDFUELC
        paramWndType : 15
        paramIndex: 0
        x: varScaleAspectX*constFUELX1
        y: varScaleAspectY*((0<iniModeMFD && iniModeMFD<constMFDModes-1)?constFUELY3:constFUELY5)
        width: varScaleAspectX*constDotText0;
        height: varScaleAspectY*constDotFont1;
        text:String.fromCharCode(0176)+"C"
    }
    CLabel
    {
        id: myIDFUELCValue
        text : varFUELCValue
        paramWndType : 12
        paramIndex: varFUELCIndex
        x:varScaleAspectX*((0<iniModeMFD && iniModeMFD<constMFDModes-1)?constIconSliderH:constDotNeighbour);
        y:varScaleAspectY*((0<iniModeMFD && iniModeMFD<constMFDModes-1)?constFUELY3:constFUELY5)
        width: varScaleAspectX*constDotText0;
        height: varScaleAspectY*constDotFont1;
    }

    Image
    {
        id: myIDFUELSlider1;
        source: "qrc:images/Slider1"+constColorStrs[constColorName[10][varFUELIndex1]]+".png"
        x:varScaleAspectX*constFUELSliderX1;
        y:varScaleAspectY*constFUELSliderY1;
        width: varScaleAspectX*constIconSliderW;
        height:varScaleAspectY*constIconSliderH;
        visible:(0<iniModeMFD && iniModeMFD<constMFDModes-1)?true:false;
    }
    Image
    {
        id: myIDFUELSlider2;
        source: "qrc:images/Slider2"+constColorStrs[constColorName[10][varFUELIndex2]]+".png"
        x:varScaleAspectX*constFUELSliderX2;
        y:varScaleAspectY*constFUELSliderY2;
        width: varScaleAspectX*constIconSliderW;
        height:varScaleAspectY*constIconSliderH;
        visible:(0<iniModeMFD && iniModeMFD<constMFDModes-1)?true:false;
    }

    Image
    {
        id: myIDFUELSliderTail1;
        source: "qrc:images/SliderTail1"+constColorStrs[constColorName[10][varFUELIndex1]]+".png"
        x:varScaleAspectX*constFUELSliderX1;
        y:varScaleAspectY*constFUELSliderTailY1;
        width: varScaleAspectX*constIconSliderW;
        height:varScaleAspectY*constFUELSliderTailH1;
        visible:(0<iniModeMFD && iniModeMFD<constMFDModes-1)?true:false;
    }
    Image
    {
        id: myIDFUELSliderTail2;
        source: "qrc:images/SliderTail2"+constColorStrs[constColorName[10][varFUELIndex2]]+".png"
        x:varScaleAspectX*constFUELSliderX2;
        y:varScaleAspectY*constFUELSliderTailY2;
        width: varScaleAspectX*constIconSliderW;
        height:varScaleAspectY*constFUELSliderTailH2;
        visible:(0<iniModeMFD && iniModeMFD<constMFDModes-1)?true:false;
    }
}


