import QtQuick 2.12

Item
{
    id: windowN2ID
    Image
    {
        id: n2BG;
        source: "qrc:images/BG.png";

        x:0;
        y:0;
        width: varScaleAspectX*constN2W;
        height:varScaleAspectY*constN2H;
    }
    CLabel
    {
        id: myIDN2
        paramWndType : 15
        paramIndex: 0
        x: varScaleAspectX*(constN2W-constDotText3)/2;
        y: varScaleAspectY*constN2Y1
        width: varScaleAspectX*constDotText3;
        height: varScaleAspectY*constDotFont1;
        text:"N2%"
    }
    CLabel
    {
        id: myIDN2Value1
        text : varN2Value1
        paramWndType : 6
        paramIndex: varN2Index1
        x: varScaleAspectX*constDotNeighbour;
        y: varScaleAspectY*constN2Y1
        width: varScaleAspectX*constDotText1;
        height: varScaleAspectY*constDotFont1;
    }

    CLabel
    {
        id: myIDN2Value2
        text : varN2Value2
        paramWndType : 6
        paramIndex: varN2Index2
        x: varScaleAspectX*(constN2W-constDotText1-constDotNeighbour);
        y: varScaleAspectY*constN2Y1
        width: varScaleAspectX*constDotText1;
        height: varScaleAspectY*constDotFont1;
    }

}


