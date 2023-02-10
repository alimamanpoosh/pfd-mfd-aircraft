import QtQuick 2.12

Item
{
    id: windowITTID

    Image
    {
        id: myIDITTBG;
        source: (0<iniModeMFD && iniModeMFD<constMFDModes-1)?"qrc:images/ITTBG.png":"qrc:images/ITTBG2.png"

        x:0;
        y:0;
        width: varScaleAspectX*constITTW;
        height:varScaleAspectY*constITTH;
    }

    CLabel
    {
        id: myIDITTITT
        paramWndType : 15
        paramIndex: 0
        font.pixelSize: varScaleAspectMin*constDotFont2
        x: varScaleAspectX*constITTX
        y: 0
        width: varScaleAspectX*constDotText2;
        height: varScaleAspectY*constDotFont2;
        text:"ITT"+String.fromCharCode(0176)+"C"
    }
    CLabel
    {
        id: myIDITT1000
        paramWndType : 15
        paramIndex: 0
        font.pixelSize: constDotFont2*varScaleAspectMin
        x: varScaleAspectX*constITTX
        y: varScaleAspectY*(constSliderPixel[2][4]-2*(constSliderPixel[2][4]-constSliderPixel[2][5])/3-constDotFont2/2)
        width: varScaleAspectX*constDotText2;
        height: varScaleAspectY*constDotFont2;
        text:"1000"
    }
    CLabel
    {
        id: myIDITT900
        paramWndType : 15
        paramIndex: 0
        font.pixelSize: constDotFont2*varScaleAspectMin
        x: varScaleAspectX*constITTX
        y: varScaleAspectY*(constSliderPixel[2][4]-constDotFont2/2)
        width: varScaleAspectX*constDotText2;
        height: varScaleAspectY*constDotFont2;
        text:"900"
    }
    CLabel
    {
        id: myIDITT800
        paramWndType : 15
        paramIndex: 0
        font.pixelSize: constDotFont2*varScaleAspectMin
        x: varScaleAspectX*constITTX
        y: varScaleAspectY*(constSliderPixel[2][2]-constDotFont1/2)
        width: varScaleAspectX*constDotText2;
        height: varScaleAspectY*constDotFont2;
        text:"800"
    }
    CLabel
    {
        id: myIDITT700
        paramWndType : 15
        paramIndex: 0
        font.pixelSize: constDotFont2*varScaleAspectMin
        x: varScaleAspectX*constITTX
        y: varScaleAspectY*(constSliderPixel[2][1]+constSliderPixel[2][2]-constDotFont1/2)/2
        width: varScaleAspectX*constDotText2;
        height: varScaleAspectY*constDotFont2;
        text:"700"
    }
    CLabel
    {
        id: myIDITT600
        paramWndType : 15
        paramIndex: 0
        font.pixelSize: constDotFont2*varScaleAspectMin
        x: varScaleAspectX*constITTX
        y: varScaleAspectY*(constSliderPixel[2][0]-5*(constSliderPixel[2][0]-constSliderPixel[2][1])/5-constDotFont1/2)
        width: varScaleAspectX*constDotText2;
        height: varScaleAspectY*constDotFont2;
        text:"600"
    }
    CLabel
    {
        id: myIDITT400
        paramWndType : 15
        paramIndex: 0
        font.pixelSize: constDotFont2*varScaleAspectMin
        x: varScaleAspectX*constITTX
        y: varScaleAspectY*(constSliderPixel[2][0]-3*(constSliderPixel[2][0]-constSliderPixel[2][1])/5-constDotFont1/2)
        width: varScaleAspectX*constDotText2;
        height: varScaleAspectY*constDotFont2;
        text:"400"
    }
    CLabel
    {
        id: myIDITT200
        paramWndType : 15
        paramIndex: 0
        font.pixelSize: constDotFont2*varScaleAspectMin
        x: varScaleAspectX*constITTX
        y: varScaleAspectY*(constSliderPixel[2][0]-(constSliderPixel[2][0]-constSliderPixel[2][1])/5-constDotFont1/2)
        width: varScaleAspectX*constDotText2;
        height: varScaleAspectY*constDotFont2;
        text:"200"
    }

    CLabel
    {
        id: myIDITTValue1
        text : varITTValue1
        paramWndType : 2
        paramIndex: varITTIndex1
        x: varScaleAspectX*constIconSliderH;
        y: varScaleAspectY*(constITTSliderTailY1+constITTSliderTailH1);
        width: varScaleAspectX*constDotText0;
        height: varScaleAspectY*constDotFont1;
    }
    CLabel
    {
        id: myIDITTValue2
        text : varITTValue2
        paramWndType : 2
        paramIndex: varITTIndex2
        x: varScaleAspectX*(constITTW-constDotText0-constIconSliderH);
        y: varScaleAspectY*(constITTSliderTailY2+constITTSliderTailH2);
        width: varScaleAspectX*constDotText0;
        height: varScaleAspectY*constDotFont1;
    }

    Image
    {
        id: myIDITTSlider1;
        source: "qrc:images/Slider1"+constColorStrs[constColorName[2][varITTIndex1]]+".png"
        x:varScaleAspectX*constITTSliderX1;
        y:varScaleAspectY*constITTSliderY1;
        width: varScaleAspectX*constIconSliderW;
        height:varScaleAspectY*constIconSliderH;
    }
    Image
    {
        id: myIDITTSlider2;
        source: "qrc:images/Slider2"+constColorStrs[constColorName[2][varITTIndex2]]+".png"
        x:varScaleAspectX*constITTSliderX2;
        y:varScaleAspectY*constITTSliderY2;
        width: varScaleAspectX*constIconSliderW;
        height:varScaleAspectY*constIconSliderH;
    }

    Image
    {
        id: myIDITTSliderTail1;
        source: "qrc:images/SliderTail1"+constColorStrs[constColorName[2][varITTIndex1]]+".png"
        x:varScaleAspectX*constITTSliderX1;
        y:varScaleAspectY*constITTSliderTailY1;
        width: varScaleAspectX*constIconSliderW;
        height:varScaleAspectY*constITTSliderTailH1;
    }
    Image
    {
        id: myIDITTSliderTail2;
        source: "qrc:images/SliderTail2"+constColorStrs[constColorName[2][varITTIndex2]]+".png"
        x:varScaleAspectX*constITTSliderX2;
        y:varScaleAspectY*constITTSliderTailY2;
        width: varScaleAspectX*constIconSliderW;
        height:varScaleAspectY*constITTSliderTailH2;
    }
}


