import QtQuick 2.12

Item
{
    id: windowN1ID

    Image
    {
        id: n1BG;
        source: "qrc:images/N1BG.png";

        x:0;
        y:0;
        width: varScaleAspectX*constN1W;
        height:varScaleAspectY*constN1H;
    }
    CLabel
    {
        id: myIDN1N1
        paramWndType : 15
        paramIndex: 0
        x: varScaleAspectX*constN1X
        y: 0
        width: varScaleAspectX*constDotText2;
        height: varScaleAspectY*constDotFont1;
        text:"N1%"
    }
    CLabel
    {
        id: myIDN1100
        paramWndType : 15
        paramIndex: 0
        x: varScaleAspectX*constN1X
        y: varScaleAspectY*(constSliderPixel[1][1]-2*(constSliderPixel[1][1]-constSliderPixel[1][2])/3-constDotFont1/2)
        width: varScaleAspectX*constDotText2;
        height: varScaleAspectY*constDotFont1;
        text:"100"
    }
    CLabel
    {
        id: myIDN190
        paramWndType : 15
        paramIndex: 0
        x: varScaleAspectX*constN1X
        y: varScaleAspectY*(constSliderPixel[1][0]-7*(constSliderPixel[1][0]-constSliderPixel[1][1])/7-constDotFont1/2)
        width: varScaleAspectX*constDotText2;
        height: varScaleAspectY*constDotFont1;
        text:"90"
    }
    CLabel
    {
        id: myIDN170
        paramWndType : 15
        paramIndex: 0
        x: varScaleAspectX*constN1X
        y: varScaleAspectY*(constSliderPixel[1][0]-5*(constSliderPixel[1][0]-constSliderPixel[1][1])/7-constDotFont1/2)
        width: varScaleAspectX*constDotText2;
        height: varScaleAspectY*constDotFont1;
        text:"70"
    }
    CLabel
    {
        id: myIDN150
        paramWndType : 15
        paramIndex: 0
        x: varScaleAspectX*constN1X
        y: varScaleAspectY*(constSliderPixel[1][0]-3*(constSliderPixel[1][0]-constSliderPixel[1][1])/7-constDotFont1/2)
        width: varScaleAspectX*constDotText2;
        height: varScaleAspectY*constDotFont1;
        text:"50"
    }
    CLabel
    {
        id: myIDN130
        paramWndType : 15
        paramIndex: 0
        x: varScaleAspectX*constN1X
        y: varScaleAspectY*(constSliderPixel[1][0]-(constSliderPixel[1][0]-constSliderPixel[1][1])/7-constDotFont1/2)
        width: varScaleAspectX*constDotText2;
        height: varScaleAspectY*constDotFont1;
        text:"30"
    }

    CLabel
    {
        id: n1SliderValueTextID1
        paramWndType : 1
        paramIndex: varN1Index1
        x: varScaleAspectX*constIconSliderH;
        y: varScaleAspectY*(constN1SliderTailY1+constN1SliderTailH1);
        width: varScaleAspectX*constDotText0;
        height: varScaleAspectY*constDotFont1;
        text: varN1Value1.toFixed(1)
    }
    CLabel
    {
        id: n1SliderValueTextID2
        paramWndType : 1
        paramIndex: varN1Index2
        x: varScaleAspectX*(constN1W-constDotText0-constIconSliderH)
        y: varScaleAspectY*(constN1SliderTailY2+constN1SliderTailH2);
        width: varScaleAspectX*constDotText0;
        height: varScaleAspectY*constDotFont1;
        text: varN1Value2.toFixed(1)
    }
    CLabel
    {
        id: n1BugValueText
        paramWndType : 0
        paramIndex: varN1BugIndex1
        x: varScaleAspectX*(constN1W-constDotText0)/2;
        y: varScaleAspectY*(constSliderPixel[1][3]-constDotFont1/2);
        width: varScaleAspectX*constDotText0;
        height: varScaleAspectY*constDotFont1;
        text: varN1BugValue1.toFixed(1)//////////ajiiib
    }

    Image
    {
        id: myIDN1Bug1;
        source: "qrc:images/N1Bug1.png";
        x:varScaleAspectX*constN1BugX1;
        y:varScaleAspectY*constN1BugY1;
        width: varScaleAspectX*constN1BugW;
        height:varScaleAspectY*constN1BugH;
     }
    Image
    {
        id: myIDN1Bug2;
        source: "qrc:images/N1Bug2.png";
        x:varScaleAspectX*constN1BugX2;
        y:varScaleAspectY*constN1BugY2;
        width: varScaleAspectX*constN1BugW;
        height:varScaleAspectY*constN1BugH;
    }
    Image
    {
        id: myIDN1Slider1;
        source: "qrc:images/Slider1"+constColorStrs[constColorName[1][varN1Index1]]+".png"
        x:varScaleAspectX*constN1SliderX1;
        y:varScaleAspectY*constN1SliderY1;
        width: varScaleAspectX*constIconSliderW;
        height:varScaleAspectY*constIconSliderH;
    }
    Image
    {
        id: myIDN1Slider2;
        source: "qrc:images/Slider2"+constColorStrs[constColorName[1][varN1Index2]]+".png"
        x:varScaleAspectX*constN1SliderX2;
        y:varScaleAspectY*constN1SliderY2;
        width: varScaleAspectX*constIconSliderW;
        height:varScaleAspectY*constIconSliderH;
    }
    Image
    {
        id: myIDN1SliderTail1;
        source: "qrc:images/SliderTail1"+constColorStrs[constColorName[1][varN1Index1]]+".png"
        x:varScaleAspectX*constN1SliderX1;
        y:varScaleAspectY*constN1SliderTailY1;
        width: varScaleAspectX*constIconSliderW;
        height:varScaleAspectY*constN1SliderTailH1;
    }
    Image
    {
        id: myIDN1SliderTail2;
        source: "qrc:images/SliderTail2"+constColorStrs[constColorName[1][varN1Index2]]+".png"
        x:varScaleAspectX*constN1SliderX2;
        y:varScaleAspectY*constN1SliderTailY2;
        width: varScaleAspectX*constIconSliderW;
        height:varScaleAspectY*constN1SliderTailH2;
    }
}

