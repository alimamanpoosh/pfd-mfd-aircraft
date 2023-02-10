import QtQuick 2.12

Item
{
    id: windowFlapsID

    Image
    {
        id: myIDFLAPSBG;
        source: "qrc:images/BG.png";

        x:0;
        y:0;
        width: varScaleAspectX*constFLAPSW;
        height:parent.height
        fillMode: Image.Stretch
    }
    CLabel
    {
        id: myIDFLAPSFLAPS
        paramWndType : 15
        paramIndex: 0
        x: varScaleAspectX*((0<iniModeMFD && iniModeMFD<constMFDModes-1)?(constFLAPSW-constDotText0)/2:constDotText3);
        y: 0;
        width: varScaleAspectX*constDotText0;
        height: varScaleAspectY*constDotFont1;
        text:"FLAPS"
    }
    CLabel
    {
        id: myIDFLAPSUP
        paramWndType : 15
        paramIndex: 0
        x: varScaleAspectX*(constFLAPSW-constDotText0-constDotFont2);
        y: varScaleAspectY*constDotFont1;
        width: varScaleAspectX*constDotText0;
        height: varScaleAspectY*constDotFont1;
        horizontalAlignment: Text.AlignHCenter;
        text:"UP";
        visible:(0<iniModeMFD && iniModeMFD<constMFDModes-1)?true:false;
    }
    CLabel
    {
        id: myIDFLAPSTOAPR
        paramWndType : 15
        paramIndex: 0
        x: varScaleAspectX*(constFLAPSW-constDotText0-constDotText3);
        y: varScaleAspectY*2*constDotFont1;
        width: varScaleAspectX*(constDotText0+constDotText3);
        height: varScaleAspectY*constDotFont1;
        text:"TO/APR";
        visible:(0<iniModeMFD && iniModeMFD<constMFDModes-1)?true:false;
    }
    CLabel
    {
        id: myIDFLAPSLAND
        paramWndType : 15
        paramIndex: 0
        x: varScaleAspectX*(constFLAPSW-2*constDotText0-constDotText3);
        y: varScaleAspectY*3*constDotFont1;
        width: varScaleAspectX*(2*constDotText0+constDotText3);
        height: varScaleAspectY*constDotFont1;
        text:"LAND";
        visible:(0<iniModeMFD && iniModeMFD<constMFDModes-1)?true:false;
    }
    CLabel
    {
        id: myIDFLAPSUPTOAPRLAND
        paramWndType : 21
        paramIndex: 0
        x: varScaleAspectX*(constFLAPSW-constDotText0-constDotText3);
        y: 0;
        width: varScaleAspectX*(constDotText0+constDotText3);
        height: varScaleAspectY*constDotFont1;
        horizontalAlignment: Text.AlignHCenter;
        text:(varFLAPSValue==0)?"UP":((varFLAPSValue==1)?"TO/APR":"LAND");
        visible:(0<iniModeMFD && iniModeMFD<constMFDModes-1)?false:true;
    }
    Image
    {
        id: myIDFLAPSWING;
        source: "qrc:images/Wing"+varFLAPSValue+".png"
        x:varScaleAspectY*constDotFont1
        y:varScaleAspectY*constDotFont1
        width: varScaleAspectX*constIconWingW;
        height:varScaleAspectY*constIconWingH;
        visible:(0<iniModeMFD && iniModeMFD<constMFDModes-1)?true:false;
    }
}


