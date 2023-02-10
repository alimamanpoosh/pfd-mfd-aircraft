import QtQuick 2.12
import QtQuick.Controls 2.12
import CFile3 1.0  //qmlRegisterType<CFile2>("CFile3", 1, 0, "CFile4");
import CTCP3 1.0   //qmlRegisterType<CTCP2>("CTCP3", 1, 0, "CTCP4");

Item
{

    Image
    {
        id: idIMG3
        source: (iniModeMFD==1)?"qrc:images/NavChart1.png":((iniModeMFD==2)?"qrc:images/NavChart0.png":"qrc:images/SliderTail1Amber.png");
        width: parent.width
        height: parent.height
        asynchronous: true
    }

    //message_type, transmission_type, session_id, aircraft_id, hex_ident, flight_id, generated_date, generated_time, logged_date, logged_time, callsign, altitude, ground_speed, track, lat, lon, vertical_rate, squawk, alert, emergency, spi, is_on_ground
    Repeater
    {
        id: repeater1
        width: parent.width
        height: parent.height

        delegate:
            CImage {}
        model:
            ListModel
            {
                id: listModel1
            }
    }

    Repeater
    {
        id: repeater2
        width: parent.width
        height: parent.height

        delegate:
            CPoint{}
        model:
            ListModel
            {
                id: listModel2
            }
    }

    CFile4
    {
       id:cFile5
       Component.onCompleted: cFile5.funcPath(0)
    }

    CTCP4
    {
        id:cTCP5
        //message_type, transmission_type, session_id, aircraft_id, hex_ident, flight_id, generated_date, generated_time, logged_date, logged_time, callsign, altitude, ground_speed, track, lat, lon, vertical_rate, squawk, alert, emergency, spi, is_on_ground
        onSigVarsChanged:funcADSBDrawPlane(varADSBPlaneIndex);
    }

    Component.onCompleted:
    {
        varTempDouble=cFile5.funcReadDoubleINI(iniADSBLat01Str);
        if (varTempDouble!==-1) iniADSBLat[2]=varTempDouble;
        varTempDouble=cFile5.funcReadDoubleINI(iniADSBLat02Str);
        if (varTempDouble!==-1) iniADSBLat[3]=varTempDouble;
        varTempDouble=cFile5.funcReadDoubleINI(iniADSBLon01Str);
        if (varTempDouble!==-1) iniADSBLon[2]=varTempDouble;
        varTempDouble=cFile5.funcReadDoubleINI(iniADSBLon02Str);
        if (varTempDouble!==-1) iniADSBLon[3]=varTempDouble;

        varTempDouble=cFile5.funcReadDoubleINI(iniADSBLat11Str);
        if (varTempDouble!==-1) iniADSBLat[4]=varTempDouble;
        varTempDouble=cFile5.funcReadDoubleINI(iniADSBLat12Str);
        if (varTempDouble!==-1) iniADSBLat[5]=varTempDouble;
        varTempDouble=cFile5.funcReadDoubleINI(iniADSBLon11Str);
        if (varTempDouble!==-1) iniADSBLon[4]=varTempDouble;
        varTempDouble=cFile5.funcReadDoubleINI(iniADSBLon12Str);
        if (varTempDouble!==-1) iniADSBLon[5]=varTempDouble;

        cTCP5.funcTCPStart();
        idIMG3.focus=true
        funcADSBDrawPlane(0);
        repeater1.itemAt(0).varADSBColor=1;
    }
    Image
    {
        id: idBEHYAAR;
        x: idIMG3.x+idIMG3.width-constBEHYAARW
        y: idIMG3.y+idIMG3.height-1.0*constBEHYAARH
        width:constBEHYAARW;
        height:constBEHYAARH;
        source: "qrc:images/BEHYAAR.png";
        MouseArea
        {
            anchors.fill: parent

            onClicked:
            {
                iniModeMFD=(iniModeMFD+1)%constMFDModes;
                if (cTCP5.varTCPStatus===false) cTCP5.funcTCPStart();
                funcADSBDrawPlanes()
            }
        }
    }

    Rectangle
    {
        id: idADSBRegion
        border.color: constColors[4];
        color: constColors[7]
        y: funcADSBAdjustY(varADSBLatMax);
        x: funcADSBAdjustX(varADSBLonMin);
        height:funcADSBAdjustY(varADSBLatMin)-funcADSBAdjustY(varADSBLatMax);
        width: funcADSBAdjustX(varADSBLonMax)-funcADSBAdjustX(varADSBLonMin);
    }
    Label
    {
      id: idADSBSelected
      font.pixelSize:varScaleAspectMin*constDotFont2
      font.bold:true
      anchors.left: idADSBRegion.left;
      color:constColors[8]
      y:idADSBRegion.y+idADSBRegion.height-2*idADSBSelected.height
    }
    Label
    {
      id: idADSBDistances
      font.pixelSize:varScaleAspectMin*constDotFont2
      font.bold:true
      text: "N:"+(varADSBLatToKM*(varADSBLatMax-varADSBLatBehyaar)).toFixed(0)+"Km\tS:"+ (varADSBLatToKM*(varADSBLatBehyaar-varADSBLatMin)).toFixed(0)+"Km\tW:"+(varADSBLonToKM*(varADSBLonBehyaar-varADSBLonMin)).toFixed(0)+"Km\tE:"+ (varADSBLonToKM*(varADSBLonMax-varADSBLonBehyaar)).toFixed(0)+"Km\r\n" + "N:"+varADSBLatMax+"\tS:"+varADSBLatMin+"\tW:"+varADSBLonMin+"\tE:"+varADSBLonMax;
      anchors.left: idADSBRegion.left;
      y:idADSBRegion.y+idADSBRegion.height-idADSBDistances.height
    }
    MouseArea
    {
       anchors.fill: parent
       propagateComposedEvents: true

       onClicked:
       {
           var u;

           idADSBSelected.text="";
           if (varADSBPlaneSel==0) repeater1.itemAt(0).varADSBColor=1;
           else if (varADSBPlaneSel>0 ) repeater1.itemAt(varADSBPlaneSel).varADSBColor=0;
           if(!(mouseX>=idBEHYAAR.x && mouseX<=idBEHYAAR.x+idBEHYAAR.width && mouseY>=idBEHYAAR.y && mouseY<=idBEHYAAR.y+idBEHYAAR.height))  varADSBPlaneSel=-1;

           for (u=0;u<varADSBPlaneCount;u++)
               if (Math.abs(mouseX-repeater1.itemAt(u).x-constADSBPlaneW/2)<=constADSBPlaneW/2 &&
                   Math.abs(mouseY-repeater1.itemAt(u).y-constADSBPlaneH/2)<=constADSBPlaneH/2)
               {
                   varADSBPlaneSel=u;
                   funcADSBDrawText();
                   break;
               }

            mouse.accepted = false
       }
    }

///////////////////////////////
    function funcADSBAdjustY(paramADSBLat)
    {
        return idIMG3.height-(paramADSBLat-iniADSBLat[iniModeMFD*2])/(iniADSBLat[iniModeMFD*2+1]-iniADSBLat[iniModeMFD*2])*idIMG3.height;
    }

    function funcADSBAdjustX(paramADSBLon)
    {
        return (paramADSBLon-iniADSBLon[iniModeMFD*2])/(iniADSBLon[iniModeMFD*2+1]-iniADSBLon[iniModeMFD*2])*idIMG3.width;
    }

    function funcADSBDrawPlane(paramADSBPlaneIndex)
    {
        varTempInt=Math.abs(paramADSBPlaneIndex);
        var u,v,s1,s2,r1,r2;

        //Find
        if (varTempInt==varADSBPlaneCount)
        {
            u=varADSBPlaneCount++;
            listModel1.append({});          //listModel1.append({number})  listModel1.append({current: "text " + (++number)})   listModel1.append({current: "text " + (++number)})  ({"cost": 5.95, "name":"Jackfruit"})  fruitModel.insert(2, {"cost": 5.95, "name":"Pizza"})
            repeater1.itemAt(u).varADSBHexIdent=cTCP5.varADSBHexIdent;
        }
        else
            for (u=0;u<varADSBPlaneCount;u++)//test
                if (repeater1.itemAt(u).varADSBHexIdent===cTCP5.varADSBHexIdent) break;

        //Time
        repeater1.itemAt(u).varADSBUpdate=new Date();

        //Color
        if (cTCP5.varADSBColor!=="-1")  repeater1.itemAt(u).varADSBColor=cTCP5.varADSBColor;

        //Altitude
        if (cTCP5.varADSBAltitude!==-1) repeater1.itemAt(u).varADSBAltitude=cTCP5.varADSBAltitude;

        //Speed
        if (cTCP5.varADSBSpeed!==-1) repeater1.itemAt(u).varADSBSpeed=cTCP5.varADSBSpeed;

        //Track
        if (cTCP5.varADSBTrack!==-1) repeater1.itemAt(u).varADSBTrack=cTCP5.varADSBTrack;

        //Lat
        if (cTCP5.varADSBLat!==-1)
        {
            repeater1.itemAt(u).varADSBLat=cTCP5.varADSBLat;
            repeater1.itemAt(u).y=(cTCP5.varADSBLat>0.0) ? -constADSBPlaneH/2+funcADSBAdjustY(cTCP5.varADSBLat) : 0;
            if (varADSBLatMin>cTCP5.varADSBLat) varADSBLatMin=cTCP5.varADSBLat;
            if (varADSBLatMax<cTCP5.varADSBLat) varADSBLatMax=cTCP5.varADSBLat;
        }

        //Lon
        if (cTCP5.varADSBLon!==-1)
        {
            repeater1.itemAt(u).varADSBLon=cTCP5.varADSBLon;
            repeater1.itemAt(u).x=(cTCP5.varADSBLon>0.0) ? -constADSBPlaneW/2+funcADSBAdjustX(cTCP5.varADSBLon) : 0;
            if (varADSBLonMin>cTCP5.varADSBLon) varADSBLonMin=cTCP5.varADSBLon;
            if (varADSBLonMax<cTCP5.varADSBLon) varADSBLonMax=cTCP5.varADSBLon;
        }

        //Rate
        if (cTCP5.varADSBRate!==-1) repeater1.itemAt(u).varADSBRate=cTCP5.varADSBRate;

        //Select
        if (varADSBPlaneSel!=-1) funcADSBDrawText()

    }//funcADSBDrawPlane

    function funcADSBDrawPlanes()
    {
        var d=new Date();
        var f,u;

        for (u=0;u<varADSBPlaneCount;u++)
        {
            repeater1.itemAt(u).y=(repeater1.itemAt(u).varADSBLat>0.0) ? funcADSBAdjustY(repeater1.itemAt(u).varADSBLat)-constADSBPlaneH/2 : 0;
            repeater1.itemAt(u).x=(repeater1.itemAt(u).varADSBLon>0.0) ? funcADSBAdjustX(repeater1.itemAt(u).varADSBLon)-constADSBPlaneW/2 : 0;
            f = d - repeater1.itemAt(u).varADSBUpdate;

            if (u>0 && f>10*constDelayRefresh)
            {
                if (u==varADSBPlaneSel) {varADSBPlaneSel=-1;repeater1.itemAt(u).varADSBColor=0;idADSBSelected.text="";}
                else if (u<varADSBPlaneSel) varADSBPlaneSel--;
                repeater1.itemAt(u).visible=false;
                listModel1.remove(u);
                varADSBPlaneCount--;
                cTCP5.funcADSBRemove(u);
            }
        }
    }

    function funcADSBDrawText()
    {
        if (0<=varADSBPlaneSel && varADSBPlaneSel<varADSBPlaneCount)
        {
            repeater1.itemAt(varADSBPlaneSel).varADSBColor=8;

            idADSBSelected.text=repeater1.itemAt(varADSBPlaneSel).varADSBHexIdent+"\t";
            idADSBSelected.text+=repeater1.itemAt(varADSBPlaneSel).varADSBTrack+"°    ";
            idADSBSelected.text+=repeater1.itemAt(varADSBPlaneSel).varADSBSpeed+"KT    ";
            idADSBSelected.text+=repeater1.itemAt(varADSBPlaneSel).varADSBAltitude+"ft    ";
            idADSBSelected.text+=repeater1.itemAt(varADSBPlaneSel).varADSBRate+"ft/min\r\n";

            idADSBSelected.text+="N:"+repeater1.itemAt(varADSBPlaneSel).varADSBLat;
            idADSBSelected.text+="\t\tE:"+repeater1.itemAt(varADSBPlaneSel).varADSBLon;
        }
    }
}
