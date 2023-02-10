import QtQuick 2.0
import QtQuick.Controls 2.12

Item
{
    WindowMAP
    {
        id: windowMAPID1
        x:varScaleAspectX*(constN1W+constITTW+2*constDotNeighbour)
        y:varScaleAspectY*(constDotFont0+constDotNeighbour)
        width:wnd.width-varScaleAspectX*(constN1W+constITTW+2*constDotNeighbour)
        height:wnd.height-varScaleAspectY*(2*constDotFont0+2*constDotNeighbour)
        focus:true
    }
    property alias windowMAPID1alias:windowMAPID1

    WindowN1
    {
        id: windowN1ID1
        x:0
        y:0
    }
    WindowITT
    {
        id: windowITTID1
        x:varScaleAspectX*(constN1W+constDotNeighbour);
        y:0
    }

    WindowOIL
    {
        id: windowOILID1
        x:0
        y:varScaleAspectY*(constN1H+constDotNeighbour);
    }
    WindowN2
    {
        id: windowN2ID1
        x:varScaleAspectX*(constOILW+constDotNeighbour);
        y:varScaleAspectY*(constITTH+constDotNeighbour);
    }
    WindowFUEL
    {
        id: windowFUELID1
        x:0
        y:varScaleAspectY*(constN1H+constOILH+2*constDotNeighbour);
    }

    WindowDC
    {
        id: windowDCID1
        x:varScaleAspectX*(constOILW+constDotNeighbour);
        y:varScaleAspectY*(constITTH+constN2H+2*constDotNeighbour);
    }

    WindowCABIN
    {
        id: windowCABINID1
        x:varScaleAspectX*(constOILW+constDotNeighbour);
        y:varScaleAspectY*(constITTH+constN2H+constDCH+3*constDotNeighbour);
    }

    WindowCAS
    {
        id: windowCASID1
        x:0
        y:varScaleAspectY*(constN1H+constOILH+constFUELH+3*constDotNeighbour);
        height:wnd.height-varScaleAspectY*(constN1H+constOILH+constFUELH+constDotFont0+4*constDotNeighbour);
    }
    WindowTRIM
    {
        id: windowTRIMID1
        x:varScaleAspectX*(constOILW+constDotNeighbour);
        y:varScaleAspectY*(constITTH+constN2H+constDCH+constCABINH+4*constDotNeighbour);
    }
    WindowFLAPS
    {
        id: windowFLAPSID1
        x:varScaleAspectX*(constOILW+constDotNeighbour);
        y:varScaleAspectY*(constITTH+constN2H+constDCH+constCABINH+constTRIMH+5*constDotNeighbour);
        height:wnd.height-varScaleAspectY*(constITTH+constN2H+constDCH+constCABINH+constTRIMH+constDotFont0+6*constDotNeighbour);
    }

    CLabel
    {
        id: tx0
        paramWndType:15

        y: 0
        width:(wnd.width-varScaleAspectX*(constN1W+constITTW+6*constDotNeighbour))/5 ;
        x:varScaleAspectX*(constN1W+constITTW+2*constDotNeighbour)+0*(width+varScaleAspectX*constDotNeighbour)
        height: varScaleAspectY*constDotFont0;
        text:"GS    "+constColorHtmls[6]+"123KT</font>"

        MouseArea
        {
            width:  tx0.width
            height: tx0.height
            onClicked:
            {
                var cc = Qt.createComponent("Wnd0.qml")
                if (cc.status === Component.Ready)
                {
                    var oo = cc.createObject(wnd);
                    oo.open()
                }
            }
        }
    }
    CLabel
    {
        id: tx1
        paramWndType:15

        y: 0
        width:(wnd.width-varScaleAspectX*(constN1W+constITTW+6*constDotNeighbour))/5 ;
        x:varScaleAspectX*(constN1W+constITTW+2*constDotNeighbour)+1*(width+varScaleAspectX*constDotNeighbour)
        height: varScaleAspectY*constDotFont0;
        text:"TRK   "+constColorHtmls[6]+"054"+String.fromCharCode(0176)+"</font>"

        MouseArea
        {
            width:  tx1.width
            height: tx1.height
            onClicked:
            {
                var cc = Qt.createComponent("Wnd1.qml")
                if (cc.status === Component.Ready)
                {
                    var oo = cc.createObject(wnd);
                    oo.open()
                }
            }
        }
    }
    CLabel
    {
        id: tx2
        paramWndType:15

        y: 0
        width:(wnd.width-varScaleAspectX*(constN1W+constITTW+6*constDotNeighbour))/5 ;
        x:varScaleAspectX*(constN1W+constITTW+2*constDotNeighbour)+2*(width+varScaleAspectX*constDotNeighbour)
        height: varScaleAspectY*constDotFont0;
        text: "XTK   "+constColorHtmls[6]+"2.93NM</font>"

        MouseArea
        {
            width:  tx2.width
            height: tx2.height
            onClicked:
            {
                var cc = Qt.createComponent("Wnd2.qml")
                if (cc.status === Component.Ready)
                {
                    var oo = cc.createObject(wnd);
                    oo.show()
                }
            }
        }
    }
    CLabel
    {
        id: tx3
        paramWndType:15

        y: 0
        width:(wnd.width-varScaleAspectX*(constN1W+constITTW+6*constDotNeighbour))/5 ;
        x:varScaleAspectX*(constN1W+constITTW+2*constDotNeighbour)+3*(width+varScaleAspectX*constDotNeighbour)
        height: varScaleAspectY*constDotFont0;
        text:"ETE   "+constColorHtmls[6]+"06:40</font>"

        MouseArea
        {
            width:  tx3.width
            height: tx3.height
            onClicked:
            {
                var cc = Qt.createComponent("Wnd3.qml")
                if (cc.status === Component.Ready)
                {
                    var oo = cc.createObject(wnd);
                    oo.open()
                }
            }
        }
    }

    CLabel
    {
        id: tx4
        paramWndType:15

        y: 0
        width:(wnd.width-varScaleAspectX*(constN1W+constITTW+6*constDotNeighbour))/5 ;
        x:varScaleAspectX*(constN1W+constITTW+2*constDotNeighbour)+4*(width+varScaleAspectX*constDotNeighbour)
        height: varScaleAspectY*constDotFont0;
        color:constColors[2]
        text:"MAP-WEATHER"
    }

    CLabel
    {
        id: txt0
        paramWndType:15

        y: wnd.height-height;
        width:(wnd.width-11*varScaleAspectX*constDotNeighbour)/12 ;
        x:0*(width+varScaleAspectX*constDotNeighbour)
        height: varScaleAspectY*constDotFont0;
        text:"CAS"
    }
    CLabel
    {
        id: txt1
        paramWndType:15

        y: wnd.height-height;
        width:(wnd.width-11*varScaleAspectX*constDotNeighbour)/12 ;
        x:1*(width+varScaleAspectX*constDotNeighbour)
        height: varScaleAspectY*constDotFont0;
        text:"CAS"
    }
    CLabel
    {
        id: txt2
        paramWndType:15

        y: wnd.height-height;
        width:(wnd.width-11*varScaleAspectX*constDotNeighbour)/12 ;
        x:2*(width+varScaleAspectX*constDotNeighbour)
        height: varScaleAspectY*constDotFont0;
        text:"NEXRAD"
    }
    CLabel
    {
        id: txt3
        paramWndType:15

        y: wnd.height-height;
        width:(wnd.width-11*varScaleAspectX*constDotNeighbour)/12 ;
        x:3*(width+varScaleAspectX*constDotNeighbour)
        height: varScaleAspectY*constDotFont0;
        text:"ECHO TOP"
    }

    CLabel
    {
        id: txt4
        paramWndType:15

        y: wnd.height-height;
        width:(wnd.width-11*varScaleAspectX*constDotNeighbour)/12 ;
        x:4*(width+varScaleAspectX*constDotNeighbour)
        height: varScaleAspectY*constDotFont0;
        text:"CLD TOP"
    }
    CLabel
    {
        id: txt5
        paramWndType:15

        y: wnd.height-height;
        width:(wnd.width-11*varScaleAspectX*constDotNeighbour)/12 ;
        x:5*(width+varScaleAspectX*constDotNeighbour)
        height: varScaleAspectY*constDotFont0;
        text:"LTNG"
    }
    CLabel
    {
        id: txt6
        paramWndType:15

        y: wnd.height-height;
        width:(wnd.width-11*varScaleAspectX*constDotNeighbour)/12 ;
        x:6*(width+varScaleAspectX*constDotNeighbour)
        height: varScaleAspectY*constDotFont0;
        text:"CELL MOV"
    }
    CLabel
    {
        id: txt7
        paramWndType:15

        y: wnd.height-height;
        width:(wnd.width-11*varScaleAspectX*constDotNeighbour)/12 ;
        x:7*(width+varScaleAspectX*constDotNeighbour)
        height: varScaleAspectY*constDotFont0;
        text:"SIG/AIR"
    }
    CLabel
    {
        id: txt8
        paramWndType:15

        y: wnd.height-height;
        width:(wnd.width-11*varScaleAspectX*constDotNeighbour)/12 ;
        x:8*(width+varScaleAspectX*constDotNeighbour)
        height: varScaleAspectY*constDotFont0;
        text:"METAR"
    }

    CLabel
    {
        id: txt9
        paramWndType:15

        y: wnd.height-height;
        width:(wnd.width-11*varScaleAspectX*constDotNeighbour)/12 ;
        x:9*(width+varScaleAspectX*constDotNeighbour)
        height: varScaleAspectY*constDotFont0;
        text:"LEGEND"
    }

    CLabel
    {
        id: txt10
        paramWndType:15

        y: wnd.height-height;
        width:(wnd.width-11*varScaleAspectX*constDotNeighbour)/12 ;
        x:10*(width+varScaleAspectX*constDotNeighbour)
        height: varScaleAspectY*constDotFont0;
        text:"MORE WX"
    }
    CLabel
    {
        id: txt11
        paramWndType:15

        y: wnd.height-height;
        width:(wnd.width-11*varScaleAspectX*constDotNeighbour)/12 ;
        x:11*(width+varScaleAspectX*constDotNeighbour)
        height: varScaleAspectY*constDotFont0;
        text:"CHKLIST"
    }
}
