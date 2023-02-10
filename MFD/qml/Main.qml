//110=80   105=142   100=202  95=264  90=325  80=386  70=447  60=509   50=570   40=631   30=692    20=751   %650-1  %430-493

// 1185*891=MFD     in AndazehMFDMustang.png
//  860*818=MAP     in AndazehMFDMustang.png            860/1185=0.7257   <--MAP/MFD-->  818/891=0.9181
// 1157*868=RevMFD  in AndazehReversionMustang.png
//  173*217=N1      in AndazehMFDMustang.png
//  738*932=N1.png                                      173/738=0.234417 <--N1/N1.png--> 217/932=0.232833

//Rev to MFD: x*1024/1157    y*768/868      //MFD to (1024,768): x/((173/738)*(1024/1185))=x/0.202568  y/((217/932)*(768/891))=y/0.200691
//(446, 55)  CommandbarRev  => (395, 49) CommandbarMFD  => (1950, 244) CommandbarImage
//(419,343)  AttitudeRev    => (371,303) AttitudeMFD    => (1831,1512) AttitudeImage
//(121,940)  PitchRev       => (107,832) PitchMFD       => ( 528,4144) PitchImage
//(120,388)  AltitudeRev    => (106,343) AltitudeMFD    => ( 523,1709) AltitudeImage
//((120/1157) * 1024) * ((1185*738)/(1024*173))=524  <--Altitude Image--> ((388/868) * 768) * ((891*932)/(768*217))=1711

// 1290*1080 Display=>   0.7257*1290=936  <--MAP in new Display-->  0.9181*1080=992
// 1024* 768 Display=>   0.7257*1024=743  <--MAP in new Display-->  0.9181* 768=705
// 1547*1080--->860*818   ==>     936/1547=0.6050   992/1080=0.9185        ????

//COM radios can tune either 25 kHz spacing (118.000 to 136.975 MHz) 8.33 kHz spacing (118.000 to 136.990 MHz) for 760-channel or 3040-channel
//Pressing and holding the COM Frequency Transfer key for two seconds automatically loads the emergency COM frequency (121.500 MHz) in the active field of the active COM radio (the one with the transfer arrow).
//The NAV radios receive in the VOR/ILS frequency range of 108.00 to 117.95 MHz with 50 kHz spacing
//Elevator                     Up 18.5 +0/-0.5     Down 15 +/-1
//Elevator Trim Tab            Up  9   +/-1        Down 23 +/-1
//Rudder                                                                       Right 35   +/-1     Left   35 +/-1
//Rudder Trim Tab                                                              Right 20   +/-1     Left   20 +/-1
//Aileron           2.0+/- 0.5 Up 23.5  +/-1       Down          20.5  +/-1
//Aileron Trim Tab             Up 20    +/-1       Down          18    +/-1
//Wing Flap                    Up  0    +/-1       T.O./Appr.    15    +/-1     Land  35   +/-1     Ground 60 +/-1
//Speed Brakes                 Up  0-49 +/-2       Down           0-68 +/-2
//Thrust Attenuators Stow - 4.5 +/- 0.3
//Thrust Attenuators Deploy 65  +/-1
//0=start=3a 1=address=1 2=id=0 3=cmd 4=len 5,6=n1 7,8=itt 9,10=fuel 11,12=roll 13,14=pich 15,16=yaw 17,18=check 19=stop1=0d 20=stop2=0a
//MFD: w:304.128cm h:228.096cm d:15.0inch    //PFD: w:211.200cm h:158.400cm d:10.4inch   //Normal Electricity 21-32V 145-170A
////////////////////////////////////////////////////////////////////////////////////

import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Window 2.12
import CFile3  1.0   //qmlRegisterType<CFile2>("CFile3", 1, 0, "CFile4");
import CUDP3   1.0   //qmlRegisterType<CUDP2> ("CUDP3" , 1, 0, "CUDP4" );
import CSpec3  1.0   //qmlRegisterType<CSpec2>("CSpec3", 1, 0, "CSpec4");

Window
{
    id: wnd
    visible: true

    readonly property int constLCDW: 320
    readonly property int constLCDH: 240
    readonly property int constFormW: 1024  //1290
    readonly property int constFormH: 768   //1080
    readonly property int constWidth1: 738
    readonly property int constWidth2: 612
    readonly property double constScalePdfX:(constFormW*173)/(1185*738) //0.202568   0.885048
    readonly property double constScalePdfY:(constFormH*217)/(891*932)  //0.200691   0.884793
    property double varScaleAspectX: constScalePdfX
    property double varScaleAspectY: constScalePdfY
    property double varScaleAspectMin: Math.min(varScaleAspectX,varScaleAspectY)

    readonly property int    constDelayAspect     :5000   //Changes Aspect Ratio of Main Window
    readonly property int    constDelayRefresh    :10000; //Refresh UDP TCP SPECS
    readonly property int    constStepMapMove     :50
             property double   varStepMapZoom     :1.1

             property int    iniModeBIA           :1;   //0 No, 1 Hardware, 2 Software
             property string iniNetIpBIA          :"192.168.16.254"
             property int    iniNetPortBIA        :1234

    readonly property string iniModeBIAStr        :"iniModeBIA";
    readonly property string iniModeMFDStr        :"iniModeMFD";
    readonly property string iniNetIpBIAStr       :"iniNetIpBIA"
    readonly property string iniNetPortBIAStr     :"iniNetPortBIA"

    readonly property    int constMFDModes        :4;
             property    int iniModeMFD           :0;        /*https://skyvector.com 3=http://legacy.lib.utexas.edu/maps/onc/*/ /*https://www.google.com/maps*/ /*https://ais.airport.ir/aip-cd*/

    //////////ADSB///////////////////////////////////
    property var iniADSBLat: [0,0,27.62926,33.53611,24.028931,40.431511,0,0]
    property var iniADSBLon: [0,0,49.06742,56.13712,43.561653,63.710586,0,0]

    property double varADSBLatBehyaar           :32.715066 //71506648031806
    property double varADSBLonBehyaar           :51.510386 //510385596042376
    property double varADSBLatMin               :varADSBLatBehyaar
    property double varADSBLatMax               :varADSBLatBehyaar
    property double varADSBLonMin               :varADSBLonBehyaar
    property double varADSBLonMax               :varADSBLonBehyaar

    property double varADSBLatToKM              :110.574
    property double varADSBLonToKM              :111.303

    readonly property string iniADSBLat01Str           :"iniADSBLat01"
    readonly property string iniADSBLat02Str           :"iniADSBLat02"
    readonly property string iniADSBLon01Str           :"iniADSBLon01"
    readonly property string iniADSBLon02Str           :"iniADSBLon02"
    readonly property string iniADSBLat11Str           :"iniADSBLat11"
    readonly property string iniADSBLat12Str           :"iniADSBLat12"
    readonly property string iniADSBLon11Str           :"iniADSBLon11"
    readonly property string iniADSBLon12Str           :"iniADSBLon12"
    /*readonly property string iniADSBLat21Str           :"iniADSBLat21"
    readonly property string iniADSBLat22Str           :"iniADSBLat22"
    readonly property string iniADSBLon21Str           :"iniADSBLon21"
    readonly property string iniADSBLon22Str           :"iniADSBLon22"*/

    readonly property int constADSBPlaneW:26;
    readonly property int constADSBPlaneH:28;
    property int varADSBPlaneCount:0;
    property int varADSBPlaneSel:-1;

    ////////////////Temps///////////////////////////////////////////////
    property string varTempStr;
    property int    varTempInt;
    property double varTempDouble;
    property string varTempMessage;
    property string varTempMessage2;

    ///////////text color png////////////////////////////////////////////////////
    readonly property string constFontFamily:"Franklin Gothic Medium"

    readonly property int constIconSliderW: 64
    readonly property int constIconSliderH: 30
    readonly property int constIconTriW: 72
    readonly property int constIconTriH: 58
    readonly property int constIconWingW: 174
    readonly property int constIconWingH: 174

    //Red0 Green1 Blue2 White3 Black4 Amber5 Magenta6 Trans7
    readonly property var constColors    : [Qt.rgba(238/256, 56/256, 56/256, 1),Qt.rgba(95/256, 187/256, 70/256, 1),Qt.rgba(0, 185/256, 241/256, 1),Qt.rgba(1, 1, 1, 1),Qt.rgba(35/256, 31/256, 32/256, 1),Qt.rgba(255/256, 191/256, 0/256, 1),Qt.rgba(239/256, 89/256, 161/256, 1),"Transparent",Qt.rgba(83/256, 54/256, 17/256, 1),Qt.rgba(109/256, 110/256, 112/256, 1),Qt.rgba(23/256, 84/256, 274/256, 1)]
    readonly property var constColorStrs : ["Red","Green","Blue","White","Black","Amber","Magenta","Transparent","Brown","Gray","DarkBlue"]
    readonly property var constColorHtmls: ["","","","","","","<font color=\"#EF59A1\">","","","",""]

    readonly property int constWndTypeRoll:22;
    readonly property int constWndTypePitch:23;
    readonly property int constWndTypeYaw:24;
    readonly property int constWndTypeADSBLat:25;
    readonly property int constWndTypeADSBLon:26;
    readonly property int constWndTypeADSBTrack:27;
    readonly property int constWndTypeAltitude:28;
    readonly property int constWndTypeAirspeed:29;
    readonly property int constWndTypeVSI:30;

    //3 7  16
    //N1Bug:0 N1:1 ITT:2 ?:3 OILPSI:4 OILC:5 N2:6 ?:7 DCVOLTS:8 DCAMPS:9 FUEL:10 FUELPPH:11 FUELC:12 CAS:13 TRIM:14 INFO:15 ?:16 CABINALT:17 CABINRATE:18 CABINDESTELV:19 CABINDIFFPSI:20 FLAPS:21 Roll:22 Pitch:23 Yaw:24 ADSBLat:25 ADSBLon:26 ADSBTrack:27 Altitude:28 Airspeed:29 VSI:30 Pitch:31
    readonly property var constSliderValue: [[20,90,105,110],[20,90,105,110],[100,600,800,825,900,1050],[],[0,22,33,90,100,122],[-40,9,135,139,150],[0,100,102,110],[],[0,10,21,32,36,40],[0,145,170,995],[0,200,2200],[0,1050],[-64,-40,50,64],[1,2,3],[-4.00,4.00],[0],[],[0,8100,10000,15000],[-1000,1000],[0],[0,8.6,10],[0],[],[],[],[],[],[],[],[],[],[]]
    readonly property var constColorName:   [[2,2,2,2,2],[0,3,3,0,0],[0,3,3,5,0,0,0],[],[0,0,5,1,5,0,0],[0,5,1,5,0,0],[],[],[0,0,5,1,5,0,0],[0,1,5,0,0],[0,0,3,0],[],[],[],[2,2,2],[],[],[0,1,5,0,0],[1,1,1],[],[0,1,0,0],[],[],[],[],[],[],[],[],[],[],[]]
    readonly property var constTextColor:   [[2,2,2,2,2],[3,1,1,3,3],[3,1,1,4,3,3,3],[],[3,3,4,1,4,3,3],[3,4,1,4,3,3],[3,1,4,3,3],[],[3,3,4,1,4,3,3],[3,1,4,3,3],[3,3,1,3],[3,1,3],[3,4,1,4,3],[0,3,5,0],[2,2,2],[3,3],[],[3,1,4,3,3],[1,1,1],[2,2],[3,1,3,3],[2,2],[],[],[],[],[],[],[],[],[2,6],[3]]
    readonly property var constBackColor:   [[4,4,4,4,4],[0,4,4,0,0],[0,4,4,5,0,0,0],[],[0,0,5,4,5,0,0],[0,5,4,5,0,0],[0,4,5,0,0],[],[0,0,5,4,5,0,0],[0,4,5,0,0],[0,0,4,0],[0,4,0],[0,5,4,5,0],[4,4,4,4],[2,2,2],[4,4],[],[0,4,5,0,0],[4,4,4],[4,4],[0,4,0,0],[4,4],[],[],[],[],[],[],[],[],[4,4],[7]]
    readonly property var constBorderColor: [[4,4,4,4,4],[0,4,4,0,0],[0,4,4,5,0,0,0],[],[0,0,5,4,5,0,0],[0,5,4,5,0,0],[0,4,5,0,0],[],[0,0,5,4,5,0,0],[0,4,5,0,0],[0,0,4,0],[0,4,0],[0,5,4,5,0],[4,4,4,4],[2,2,2],[4,4],[],[0,4,5,0,0],[4,4,4],[4,4],[0,4,0,0],[4,4],[],[],[],[],[],[],[],[],[3,3],[7]]
    readonly property var constSliderPixel: [[808,381,198,136],[808,381,198,136],[825,649,307,273,180,41],[],[427,368,322,206,166,102],[427,403,181,149,103],[0,100,102,110],[],[430,370,325,209,169,105],[430,182,150,104],[636,583,74],[0,1050],[-64,-40,50,64],[1,2,3],[99,514],[0],[],[569,382,351,244],[569,244],[0],[144,423,469],[0],[],[],[],[],[],[],[],[],[],[0,216,432,648,908,1168,1428,1772,2116,2460,2804,3064,3280,3496,3712,3928,4144]]

////////////Dots///////////////////////////////////////////////////////////////
    readonly property int constDotFont7:    120;
    readonly property int constDotFont0:    100;
    readonly property int constDotFont1:     80;
    readonly property int constDotFont2:     60;
    readonly property int constDotBorder:     2;
    readonly property int constDotNeighbour: 15;
    readonly property int constDotText0:    240;
    readonly property int constDotText1:    210;
    readonly property int constDotText2:    160;
    readonly property int constDotText7:    130;
    readonly property int constDotText3:    100;
///////////BEHYAAR////////////////////////////////////////////////////////////
    readonly property int constBEHYAARW: 620/6
    readonly property int constBEHYAARH: 204/6



///////////N1////////////////////////////////////////////////////////////
    readonly property int constN1W: constWidth1
    readonly property int constN1H: 932

    readonly property int constN1Range1:20;
    readonly property int constN1Range2:90;
    readonly property int constN1Range3:105;
    readonly property int constN1Range4:110;

    readonly property int constN1Col1:182;
    readonly property int constN1Col2:557;

    readonly property int constN1Margin1:178;
    readonly property int constN1Margin2:561;

    readonly property int constN1BugW: 34
    readonly property int constN1BugH: 69

    readonly property int constN1X:(constN1W-constDotText2)/2

    property double varN1BugValue1: 120
    property int varN1BugIndex1:4;
    readonly property int constN1BugX1: constN1Col1-constN1BugW
    readonly property int constN1BugY1: funcFindPixel(0,varN1BugValue1,varN1BugIndex1,-constN1BugH/2);

    property double varN1BugValue2: 18
    property int varN1BugIndex2:0;
    readonly property int constN1BugX2: constN1Col2
    readonly property int constN1BugY2: funcFindPixel(0,varN1BugValue2,varN1BugIndex2,-constN1BugH/2);

    property double varN1Value1: 50
    property int varN1Index1:1;
    readonly property int constN1SliderX1: constN1Margin1-constIconSliderW
    readonly property int constN1SliderY1: funcFindPixel(1,varN1Value1,varN1Index1,0)
    readonly property int constN1SliderTailY1: constN1SliderY1+constIconSliderH;
    readonly property int constN1SliderTailH1: constSliderPixel[1][0]-constN1SliderY1-constIconSliderH/2;

    property double varN1Value2: 40
    property int varN1Index2:1;
    readonly property int constN1SliderX2: constN1Margin2
    readonly property int constN1SliderY2: funcFindPixel(1,varN1Value2,varN1Index2,0)
    readonly property int constN1SliderTailY2: constN1SliderY2+constIconSliderH;
    readonly property int constN1SliderTailH2: constSliderPixel[1][0]-constN1SliderY2-constIconSliderH/2;

//////////N2////////////////////////////////////////////////////////////
    readonly property int constN2W: (0<iniModeMFD && iniModeMFD<constMFDModes-1)?constWidth2:constWidth1
    readonly property int constN2H: 110

    readonly property int constN2Range1:100;
    readonly property int constN2Range2:102;
    readonly property int constN2Range3:110;//alaki

    readonly property int constN2Y1:(constN2H-constDotFont1)/2

    property double varN2Value1: 18//98.3
    property int varN2Index1:1;
    property double varN2Value2: 78.8
    property int varN2Index2:1;

///////////ITT//////////////////////////////////////////////////////////
    readonly property int constITTW: (0<iniModeMFD && iniModeMFD<constMFDModes-1)?constWidth2:constWidth1
    readonly property int constITTH: 932

    readonly property int constITTRange1:100;
    readonly property int constITTRange2:600;
    readonly property int constITTRange3:800;
    readonly property int constITTRange4:825;
    readonly property int constITTRange5:900;
    readonly property int constITTRange6:1050;

    readonly property int constITTCol1:(0<iniModeMFD && iniModeMFD<constMFDModes-1)?126:189;
    readonly property int constITTCol2:(0<iniModeMFD && iniModeMFD<constMFDModes-1)?489:552;

    readonly property int constITTMargin1:(0<iniModeMFD && iniModeMFD<constMFDModes-1)?122:185;
    readonly property int constITTMargin2:(0<iniModeMFD && iniModeMFD<constMFDModes-1)?493:556;

    readonly property int constITTX:(constITTW-constDotText2)/2

    property int varITTValue1: 123
    property int varITTIndex1:1;
    readonly property int constITTSliderX1: constITTMargin1-constIconSliderW
    readonly property int constITTSliderY1: funcFindPixel(2,varITTValue1,varITTIndex1,0)
    readonly property int constITTSliderTailY1: constITTSliderY1+constIconSliderH;
    readonly property int constITTSliderTailH1: constSliderPixel[2][0]-constITTSliderY1-constIconSliderH/2;

    property int varITTValue2: 321
    property int varITTIndex2:1;
    readonly property int constITTSliderX2: constITTMargin2
    readonly property int constITTSliderY2: funcFindPixel(2,varITTValue2,varITTIndex2,0)
    readonly property int constITTSliderTailY2: constITTSliderY2+constIconSliderH;
    readonly property int constITTSliderTailH2: constSliderPixel[2][0]-constITTSliderY2-constIconSliderH/2;

///////////OIL//////////////////////////////////////////////////////////
    readonly property int constOILW: constWidth1
    readonly property int constOILH: (0<iniModeMFD && iniModeMFD<constMFDModes-1)?570:270

    readonly property int constOILRange1:0;
    readonly property int constOILRange2:22;
    readonly property int constOILRange3:33;
    readonly property int constOILRange4:90;
    readonly property int constOILRange5:100;
    readonly property int constOILRange6:122;

    readonly property int constOILRange7:-40;
    readonly property int constOILRange8:9;
    readonly property int constOILRange9:135;
    readonly property int constOILRange10:139;
    readonly property int constOILRange11:150;

    readonly property int constOILCol1:169;
    readonly property int constOILCol2:207;

    readonly property int constOILCol3:525;
    readonly property int constOILCol4:561;

    readonly property int constOILX1:(constOILW-constDotText3)/2;                                 //ref3
    readonly property int constOILX2:constOILW-constDotText2-constDotNeighbour                    //ref2
    readonly property int constOILY1:constSliderPixel[4][0]+constIconTriH/2+constDotNeighbour;    //ref4
    readonly property int constOILY2:2*constDotFont1+constDotNeighbour                            //ref3

    property int varOILValue1: 5
    property int varOILIndex1:1;
    readonly property int constOILSliderY1: funcFindPixel(4,varOILValue1,varOILIndex1,-constIconTriH/2);

    property int varOILValue2: 39
    property int varOILIndex2:3;
    readonly property int constOILSliderY2: funcFindPixel(4,varOILValue2,varOILIndex2,-constIconTriH/2);

    property int varOILValue3: -30
    property int varOILIndex3:1;
    readonly property int constOILSliderY3: funcFindPixel(5,varOILValue3,varOILIndex3,-constIconTriH/2);

    property int varOILValue4: 3
    property int varOILIndex4:1;
    readonly property int constOILSliderY4: funcFindPixel(5,varOILValue4,varOILIndex4,-constIconTriH/2);

///////////FUEL//////////////////////////////////////////////////////////
    readonly property int constFUELW: constWidth1
    readonly property int constFUELH: (0<iniModeMFD && iniModeMFD<constMFDModes-1)?972:365

    readonly property int constFUELRange1:0;
    readonly property int constFUELRange2:2200;

    readonly property int constFUELCol1:159;
    readonly property int constFUELCol2:579;

    readonly property int constFUELMargin1:154;
    readonly property int constFUELMargin2:584;

    property int varFUELValue1: 100
    property int varFUELIndex1:1;
    readonly property int constFUELSliderX1: constFUELMargin1-constIconSliderW
    readonly property int constFUELSliderY1: funcFindPixel(10,varFUELValue1,varFUELIndex1,0)
    readonly property int constFUELSliderTailY1: constFUELSliderY1+constIconSliderH;
    readonly property int constFUELSliderTailH1: constSliderPixel[10][0]-constFUELSliderY1-constIconSliderH/2;
    readonly property int constFUELSliderTextX1:constIconSliderH;

    property int varFUELValue2: 654
    property int varFUELIndex2:2;
    readonly property int constFUELSliderX2: constFUELMargin2
    readonly property int constFUELSliderY2: funcFindPixel(10,varFUELValue2,varFUELIndex2,0)
    readonly property int constFUELSliderTailY2: constFUELSliderY2+constIconSliderH;
    readonly property int constFUELSliderTailH2: constSliderPixel[10][0]-constFUELSliderY2-constIconSliderH/2;
    readonly property int constFUELSliderTextX2: constFUELW-constDotText0-constIconSliderH;

    property int varFUELCValue:13
    property int varFUELCIndex:2;
    readonly property int constFUELCRange1:-64;
    readonly property int constFUELCRange2:-40;
    readonly property int constFUELCRange3:50;
    readonly property int constFUELCRange4:64;

    property int varFUELPPHValue1: 1040
    property int varFUELPPHIndex1:1;
    property int varFUELPPHValue2: 950
    property int varFUELPPHIndex2:1;
    readonly property int constFUELPPHRange1:0;
    readonly property int constFUELPPHRange2:1050;

    readonly property int constFUELX1:(constFUELW-constDotText0)/2                    //ref9
    readonly property int constFUELX2:constFUELW-constDotText0-constDotNeighbour      //ref2
    readonly property int constFUELY1:constSliderPixel[10][0]+constDotNeighbour       //ref4
    readonly property int constFUELY2:775+2*constDotNeighbour                         //ref4
    readonly property int constFUELY3:constFUELY2+constDotFont1
    readonly property int constFUELY4:2*constDotFont1+constDotNeighbour               //ref3
    readonly property int constFUELY5:3*constDotFont1+2*constDotNeighbour             //ref2

///////////DC//////////////////////////////////////////////////////////
    readonly property int constDCW: (0<iniModeMFD && iniModeMFD<constMFDModes-1)?constWidth2:constWidth1
    readonly property int constDCH: (0<iniModeMFD && iniModeMFD<constMFDModes-1)?725:300

    readonly property int constDCRange1:0;
    readonly property int constDCRange2:10;
    readonly property int constDCRange3:21;
    readonly property int constDCRange4:32;
    readonly property int constDCRange5:36;
    readonly property int constDCRange6:40;

    readonly property int constDCRange7:0;
    readonly property int constDCRange8:145;
    readonly property int constDCRange9:170;
    readonly property int constDCRange10:995;

    readonly property int constDCCol1:114;
    readonly property int constDCCol2:152;

    readonly property int constDCCol3:416;
    readonly property int constDCCol4:452;

    readonly property int constDCX1:(constDCW-constDotText0)/2;                                               //ref2
    readonly property int constDCX2:constDCW-constDotText3-constDotNeighbour                                  //ref1
    readonly property int constDCX3:constDCW-constDotText2-constDotNeighbour                                  //ref3
    readonly property int constDCY1:constSliderPixel[8][0]+constIconTriH/2+constDotNeighbour                  //ref4
    readonly property int constDCY2:constSliderPixel[8][0]+2*constDotFont1+constIconTriH/2+constDotNeighbour  //ref4
    readonly property int constDCY3:constDotFont1+2*constDotNeighbour                                         //ref3
    readonly property int constDCY4:2*constDotFont1+3*constDotNeighbour                                       //ref2

    property int varDCValue1: 1
    property int varDCIndex1:1;
    readonly property int constDCSliderY1: funcFindPixel(8,varDCValue1,varDCIndex1,-constIconTriH/2);

    property int varDCValue2: 9
    property int varDCIndex2:1;
    readonly property int constDCSliderY2: funcFindPixel(8,varDCValue2,varDCIndex2,-constIconTriH/2);

    property int varDCValue3: 125
    property int varDCIndex3:1;
    readonly property int constDCSliderY3: funcFindPixel(9,varDCValue3,varDCIndex3,-constIconTriH/2);

    property int varDCValue4: 10
    property int varDCIndex4:1;
    readonly property int constDCSliderY4: funcFindPixel(9,varDCValue4,varDCIndex4,-constIconTriH/2);

    property int varDCBATTV: 31
    property int varDCBATTVIndex: 3;
    property int varDCBATTA: 988
    property int varDCBATTAIndex: 3;

///////////CABIN//////////////////////////////////////////////////////////
    readonly property int constCABINW: (0<iniModeMFD && iniModeMFD<constMFDModes-1)?constWidth2:constWidth1
    readonly property int constCABINH: (0<iniModeMFD && iniModeMFD<constMFDModes-1)?1010:270

    readonly property int constCABINRange1:0;
    readonly property int constCABINRange2:8100;
    readonly property int constCABINRange3:10000;
    readonly property int constCABINRange4:15000;

    readonly property int constCABINRange5:-1000;
    readonly property int constCABINRange6:1000;

    readonly property int constCABINCol1:219;
    readonly property int constCABINMargin1:181;
    readonly property int constCABINCol2:519;
    readonly property int constCABINMargin2:483;

    property int varCABINValue1: 1400
    property int varCABINIndex1:1;
    readonly property int constCABINSliderY1: funcFindPixel(17,varCABINValue1,varCABINIndex1,-constIconTriH/2);

    property int varCABINValue2: -400
    property int varCABINIndex2:1;
    readonly property int constCABINSliderY2: funcFindPixel(18,varCABINValue2,varCABINIndex2,-constIconTriH/2);

    property int varCABINValue3: 1330
    property int varCABINIndex3:0;
    readonly property int constCABINRange7: -1000
    readonly property int constCABINRange8: 14000

    readonly property double constCABINRange9:0;
    readonly property double constCABINRange10:8.6;
    readonly property double constCABINRange11:10;

    property double varCABINValue4: 8.1
    property int varCABINIndex4:1;
    readonly property int constCABINSliderX4: funcFindPixel(20,varCABINValue4,varCABINIndex4,-constIconTriH/2)
    readonly property int constCABINSliderY4: 903

    readonly property int constCABINX1:constCABINW-constDotText0-constDotText3-constDotNeighbour                  //ref3
    readonly property int constCABINY1:constSliderPixel[18][0]+constIconTriH/2+constDotNeighbour+constDotFont1    //ref2
    readonly property int constCABINY2:constSliderPixel[18][0]+constIconTriH/2+constDotNeighbour+2*constDotFont1  //ref2
    readonly property int constCABINY3:2*constDotFont1+constDotNeighbour                                          //ref2

///////////CAS//////////////////////////////////////////////////////////
    readonly property int constCASW: constWidth1
    readonly property int constCASH: 1200

///////////TRIM//////////////////////////////////////////////////////////
    readonly property int constTRIMW: constWidth2
    readonly property int constTRIMH: 412

    //0.05  4.00
    readonly property double constTRIMRange1:-4.00;
    readonly property double constTRIMRange2: 4.00;

    readonly property int constTRIMRow1:229;
    readonly property int constTRIMRow2:265;

    property double varTRIMValue1: 0
    property int varTRIMIndex1:1;
    property double varTRIMValue2: 1.00
    property int varTRIMIndex2:1;

    readonly property int constTRIMSliderX1: funcFindPixel(14,varTRIMValue1,varTRIMIndex1,-constIconTriH/2)
    readonly property int constTRIMSliderX2: funcFindPixel(14,varTRIMValue2,varTRIMIndex2,-constIconTriH/2)
///////////FLAPS//////////////////////////////////////////////////////////
    readonly property int constFLAPSW: (0<iniModeMFD && iniModeMFD<constMFDModes-1)?constWidth2:constWidth1
    readonly property int constFLAPSH: (0<iniModeMFD && iniModeMFD<constMFDModes-1)?380:80
    property int varFLAPSValue: 1

//-----------Reversionary--------------------------------------------------

///////////Roll Pitch Yaw    Temper    Coord///////////////////////////////
    property int varRollValue:0;   //Jafari 0 to 360
    property int varPitchValue:0;  //Jafari -90 to 90
    property int varYawValue:0;    //Jafari -180 to 180
    property int varTemper : 0;
    property int varCoord : 0;
///////////Altitude////////////////////////////////////////////////////////
    readonly property int constALTW:524  //-->106
    readonly property int constALTH:1711 //-->343

    property int altitudenumOfDisplay: 600 //number of displayed numbers
    readonly property double altitudehCoeficient: 343/altitudenumOfDisplay

    readonly property int constAltitudeRange0: -1500 ; //min
    readonly property int constAltitudeRange1:  55000; //max

    readonly property int constAltitudeH: 14
    property int varAltitudeValue:49380;
    property int varAltitudeY1:0;

    property bool    varAltitudeSign    : varAltitudeValue<0
    property bool    varAltitudeLow     : varAltitudeValue<10000
    property int     varAltitudeAbs     : Math.abs(varAltitudeValue)
    property int     varAltitude4       : Math.floor(varAltitudeAbs/10000)%10
    property int     varAltitude3       : Math.floor(varAltitudeAbs/1000)%10
    property int     varAltitude2       : Math.floor(varAltitudeAbs/100)%10
    property int     varAltitude01      : varAltitudeAbs%100
    property double  varAltitude01Hook  : ((80<=varAltitude01 && varAltitude01<=99) ? ((varAltitude01-80)/20.0) : 0)
    property double  varAltitude2Hook   : ((varAltitude2==9 && 80<=varAltitude01 && varAltitude01<=99) ? ((varAltitude01-80)/20.0) : 0)
    property double  varAltitude3Hook   : ((varAltitude3==9 && varAltitude2==9 && 80<=varAltitude01 && varAltitude01<=99) ? ((varAltitude01-80)/20.0) : 0)

    property string constDigitsTwo :"40\n60\n80\n00\n20\n40\n60\n80\n00\n20"
    property string constDigitsOne :"9\n0\n1\n2\n3\n4\n5\n6\n7\n8\n9\n0"
    property string constDigitsHide:"9\n \n1\n2\n3\n4\n5\n6\n7\n8\n9\n "

///////////Airspeed//////////////////////////////////////////////////////
    property int varAirspeedValue:130;

    property double varAirspeedMin: 20
    property double varAirspeedMax: 500
    property double varAirspeedAccel: 0

    readonly property int constAirspeedRange1: 25; //RF
    readonly property int constAirspeedRange2: 30; //AP
    readonly property int constAirspeedRange3: 40; // E
    readonly property int constAirspeedRange4: 60; // 2
    readonly property int constAirspeedRange5: 80; // R
    readonly property int constAirspeedRange6:100; // 1
    readonly property int constAirspeedRange7:150; //LD
    readonly property int constAirspeedRange8:190; //TA

    property double unitCoeficient: 1
    property double boxHeight: 340
    property int numOfDisplay: 60 //number of displayed numbers
    readonly property double hCoeficient: boxHeight/numOfDisplay
    property double boxWidth: 86
    property double vspeedWidth: 30
    property double shownSpeed: (varAirspeedValue>varAirspeedMin)?varAirspeedValue:varAirspeedMin
    property int speedTA: 40
    property double referenceBugSpeed: 120
    property double referenceApproachSpeed: 67
    property var vspeedsList : [{name: "TA", speed: 190, textColor: constColors[3], visible:true}
                               ,{name: "LD", speed: 150, textColor: constColors[3], visible:true}
                               ,{name: "1",  speed: 100, textColor: constColors[2] , visible:true}
                               ,{name: "R",  speed: 80,  textColor: constColors[2] , visible:true}
                               ,{name: "2",  speed: 60,  textColor: constColors[2] , visible:true}
                               ,{name: "E",  speed: 40,  textColor: constColors[2] , visible:true}
                               ,{name: "AP", speed: 30,  textColor: constColors[2] , visible:true}
                               ,{name: "RF", speed: 25,  textColor: constColors[2] , visible:true}]
///////////VSI//////////////////////////////////////////////
    readonly property int  constVSIW:   332*varScaleAspectX    //67   //constVSIW
    readonly property int  constVSIH:  1561*varScaleAspectY    //313  //constVSIH
    property int    varVSIValue:  0
    property int    varVSIBugValue:  2345

    property double widthVSIr:    222*varScaleAspectX    //45  rectangle
    property double widthVSIa:    99*varScaleAspectX     //20  arrow
    property double widthVSIt:    114*varScaleAspectX    //23  text

    property double heightVSIr:   125*varScaleAspectY    //25
    property double heightVSIa:   50*varScaleAspectY     //10
    property double heightVSIp:   10*varScaleAspectY     //2   zekhamat
    property double heightVSId:   174*varScaleAspectY    //35  distance
    property double heightVSIt:   762*varScaleAspectY    //153

    property double scaleVSIarow: 142*varScaleAspectY    //28.5


        property int varVNVtargetAltitudeVSIvar:2000
        property int varRVSIValue: 1000

        property double widthRVSI: 84*varScaleAspectX       //17
        property double widthRVSIstart: 5*varScaleAspectX   //1
        property double heightRVSI: 130*varScaleAspectY     //26

        property double widthBugVSI: 44*varScaleAspectX     //9
        property double heightBugVSI: 90*varScaleAspectY    //18

        property double widthVNVVSI: 272*varScaleAspectX    //51->55
        property double heightVNVVSI: 115*varScaleAspectY   //19->23

//////////Attitude//////////////////////////////////////////
    readonly property int constAttiW:  372
    readonly property int constAttiH:  303
    readonly property int constPitchW: 528
    readonly property int constPitchH: 4144
    readonly property int constPitchLineCount: 16
    readonly property int constPitchTextCount: 4

//////////Compass//////////////////////////////////////////
    readonly property int constCompassW: 340

//////////Softkey//////////////////////////////////////////
    readonly property int constSoftkeyH: 28;

    readonly property int constXpdrLclW: 302
    readonly property int constXpdrLclH: 24

    readonly property int constMapMiniW: 304
    readonly property int constMapMiniH: 220

property double horizontalOffset: 20  ///////////Esmaeili

//////////SlipSkid/////////////////////////////
    readonly property double constSlipSkidWidth: 30
    readonly property double constSlipSkidHeight: 33


///////////Main////////////////////////////////////////////
    width: constFormW
    height:constFormH
    flags: Qt.Window //| Qt.FramelessWindowHint
    title: "MFD"

    ModeReversionary
    {
        id:modeReversionary1
        visible:(iniModeMFD==0 || iniModeMFD==constMFDModes-1)?true:false;
    }

    ModeNormal
    {
        id:modeNormal1
        visible:(0<iniModeMFD && iniModeMFD<constMFDModes-1)?true:false;
    }
    property alias modeNormal1alias:modeNormal1;

    CFile4
    {
        id:cFile5
        Component.onCompleted: cFile5.funcPath(0)
    }
    /*CFile4
    {
        id:cFile6
        Component.onCompleted:
        {
            cFile6.funcPath(2)
            cFile6.funcWrite(new Date(),true)
        }
    }*/
    CSpec4
    {
        id:cSpec5
    }

    CUDP4
    {
        id:cUDP5

        onSigMessChanged: varTempMessage=mess //FPGA

        onSigVarsChanged:
        {
            if (iniModeBIA==1 || iniModeBIA==2)
            {
                wnd.varN1Value1      =varN1Value1/10;  wnd.varN1Index1  =funcFindIndex(1,wnd.varN1Value1);
                wnd.varITTValue1     =varITTValue1;      wnd.varITTIndex1 =funcFindIndex(2,wnd.varITTValue1);
                wnd.varFUELValue1    =varFUELValue1;     wnd.varFUELIndex1=funcFindIndex(10,wnd.varFUELValue1);
                wnd.varRollValue     =varRollValue/10;                 //0 to 360
                wnd.varPitchValue    =varPitchValue/10;                //-90 to 90
                wnd.varYawValue      =(/*180+*/varYawValue/10).toFixed(0)  //-180 to 180
                wnd.varAltitudeValue =varAltitudeValue;

                wnd.varAirspeedValue =varAirspeedValue;
                wnd.varAirspeedAccel =varAirspeedAccel;
                wnd.varVSIValue      =varVSIValue;
            }//if (iniModeBIA==1 || iniModeBIA==2)

            if (iniModeBIA==2)
            {
                wnd.varN1BugValue1=varN1BugValue1/10; wnd.varN1BugIndex1=funcFindIndex(0,wnd.varN1BugValue1);
                wnd.varN1BugValue2=varN1BugValue2/10; wnd.varN1BugIndex2=funcFindIndex(0,wnd.varN1BugValue2);

                wnd.varN1Value2=varN1Value2/10; wnd.varN1Index2=funcFindIndex(1,wnd.varN1Value2);
                wnd.varN2Value1=varN2Value1/10; wnd.varN2Index1=funcFindIndex(6,wnd.varN2Value1);
                wnd.varN2Value2=varN2Value2/10; wnd.varN2Index2=funcFindIndex(6,wnd.varN2Value2);

                wnd.varITTValue2=varITTValue2;  wnd.varITTIndex2=funcFindIndex(2,wnd.varITTValue2);

                wnd.varOILValue1=varOILValue1;  wnd.varOILIndex1=funcFindIndex(4,wnd.varOILValue1);
                wnd.varOILValue2=varOILValue2;  wnd.varOILIndex2=funcFindIndex(4,wnd.varOILValue2);
                wnd.varOILValue3=varOILValue3;  wnd.varOILIndex3=funcFindIndex(5,wnd.varOILValue3);
                wnd.varOILValue4=varOILValue4;  wnd.varOILIndex4=funcFindIndex(5,wnd.varOILValue4);

                wnd.varFUELValue2=varFUELValue2;       wnd.varFUELIndex2=funcFindIndex(10,wnd.varFUELValue2);
                wnd.varFUELCValue=varFUELCValue;       wnd.varFUELCIndex=funcFindIndex(12,wnd.varFUELCValue);
                wnd.varFUELPPHValue1=varFUELPPHValue1; wnd.varFUELPPHIndex1=funcFindIndex(11,wnd.varFUELPPHValue1);
                wnd.varFUELPPHValue2=varFUELPPHValue2; wnd.varFUELPPHIndex2=funcFindIndex(11,wnd.varFUELPPHValue2);

                wnd.varDCValue1=varDCValue1; wnd.varDCIndex1    =funcFindIndex(8,wnd.varDCValue1);
                wnd.varDCValue2=varDCValue2; wnd.varDCIndex2    =funcFindIndex(8,wnd.varDCValue2);
                wnd.varDCValue3=varDCValue3; wnd.varDCIndex3    =funcFindIndex(9,wnd.varDCValue3);
                wnd.varDCValue4=varDCValue4; wnd.varDCIndex4    =funcFindIndex(9,wnd.varDCValue4);
                wnd.varDCBATTV =varDCBATTV;  wnd.varDCBATTVIndex=funcFindIndex(8,wnd.varDCBATTV);
                wnd.varDCBATTA =varDCBATTA;  wnd.varDCBATTAIndex=funcFindIndex(9,wnd.varDCBATTA);

                wnd.varCABINValue1=varCABINValue1;    wnd.varCABINIndex1=funcFindIndex(17,wnd.varCABINValue1);
                wnd.varCABINValue2=varCABINValue2;    wnd.varCABINIndex2=funcFindIndex(18,wnd.varCABINValue2);
                wnd.varCABINValue3=varCABINValue3;    wnd.varCABINIndex3=funcFindIndex(19,wnd.varCABINValue3);
                wnd.varCABINValue4=varCABINValue4/10; wnd.varCABINIndex4=funcFindIndex(20,wnd.varCABINValue4);

                wnd.varTRIMValue1=varTRIMValue1/100;  wnd.varTRIMIndex1=funcFindIndex(14,wnd.varTRIMValue1);
                wnd.varTRIMValue2=varTRIMValue2/100;  wnd.varTRIMIndex2=funcFindIndex(14,wnd.varTRIMValue2);

                wnd.varFLAPSValue=varFLAPSValue;

                wnd.varVSIValue=varVSIValue;
                //cFile6.funcWrite("\r\n"+new Date()+","+varFLAPSValue+","+varThread,false)
            }//if (iniModeBIA==2)
        }//onSigVarsChanged:
    }//CUDP4
    Timer
    {id: timer2}

    function delay2(delayTime,cb)
    {
        timer2.interval = delayTime;
        timer2.repeat = true;
        timer2.triggered.connect(cb);
        timer2.start();
    }

    Timer
    {id: timer3}

    function delay3(delayTime,cb)
    {
        timer3.interval = delayTime;
        timer3.repeat = true;
        timer3.triggered.connect(cb);
        timer3.start();
    }

    Component.onCompleted:
    {
        varTempInt=cFile5.funcReadIntINI(iniModeBIAStr);
        if (varTempInt!=-1 && varTempInt!=-2) iniModeBIA=varTempInt;
        varTempInt=cFile5.funcReadIntINI(iniModeMFDStr);
        if (varTempInt!=-1 && varTempInt!=-2) iniModeMFD=varTempInt;

        varTempStr=cFile5.funcReadStringINI(iniNetIpBIAStr);
        if (varTempStr!="-1" && varTempStr!="-2") iniNetIpBIA=varTempStr;
        varTempInt=cFile5.funcReadIntINI(iniNetPortBIAStr);
        if (varTempInt!=-1 && varTempInt!=-2) iniNetPortBIA=varTempInt;

        if (iniModeBIA==1)  cUDP5.funcUDPSend1('B',iniNetIpBIA,iniNetPortBIA)

        delay2(constDelayRefresh,
                function()
                  {
                    if (iniModeBIA==1)  cUDP5.funcUDPSend1('B',iniNetIpBIA,iniNetPortBIA);
                    varTempMessage2=cSpec5.getSpecs()
                    modeNormal1alias.windowMAPID1alias.funcADSBDrawPlanes()
                  }
               )

        /*delay3(constDelayAspect,
                  function()
                  {
                      var xx=Math.random()/50
                      var yy=Math.random()/50
                      if (Math.random() < 0.5) xx=-xx;
                      if (Math.random() < 0.5) yy=-yy;
                      varScaleAspectX=constScalePdfX+xx;
                      varScaleAspectY=constScalePdfY+yy;
                      wnd.width=constFormW*(1+xx)
                      wnd.height=constFormH*(1+yy)
                  }
             )*/

    }//onCompleted

    //////////Functions/////////////////////////////////////////////////
        function funcFindIndex(paramWndType,paramValue)
        {
            var u;
            if (paramValue<constSliderValue[paramWndType][0]) return 0;
            for (u=0;u<constSliderValue[paramWndType].length-1;u++)
                if (constSliderValue[paramWndType][u]<=paramValue && paramValue<constSliderValue[paramWndType][u+1]) return u+1;
            return constSliderValue[paramWndType].length;
        }

        function funcFindPixel(paramWndType,paramValue,paramIndex,paramOffset)
        {
            var u;
            if (paramIndex===0) u=constSliderPixel[paramWndType][0];
            else if (paramIndex===constSliderValue[paramWndType].length) u=constSliderPixel[paramWndType][paramIndex-1];
            else u= constSliderPixel[paramWndType][paramIndex-1]-(constSliderPixel[paramWndType][paramIndex-1]-constSliderPixel[paramWndType][paramIndex])*(paramValue-constSliderValue[paramWndType][paramIndex-1])/(constSliderValue[paramWndType][paramIndex]-constSliderValue[paramWndType][paramIndex-1]);
            return  u+paramOffset;
        }
}


