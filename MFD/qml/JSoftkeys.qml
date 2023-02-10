import QtQuick 2.9
import QtQuick.Controls 2.5
import "qrc:/js/softkeys.js" as Jsoftkey
import "qrc:/js/public.js" as Jpublic

Rectangle {
    property color btnDefault: constColors[4] //"#202020"
    property color btnPressed: constColors[9] //"#808080"
    property color textDefault: constColors[3] //"#ffffff"
    property color textPressed: constColors[4] //"#202020"
    property color textDisable: constColors[9] //"#7a7a7a"
    property double btnWidth: 85
    property double fontSize: 16
    property int status: 1
    property variant btnTexts: ["ENGINE", "INSET", "", "PFD","OBS", "CDI", "DME", "XPDR","IDENT", "TMR/REF"]
    property variant btnEnablePressed: [true, true, false, true, false, true, true, true,true, true]
    property variant btnEnableReleased: [false, true, false, true, false, true, true, true, true, true]
    property variant textColor: [textDefault, textDefault, textDefault, textDefault, textDisable, textDefault, textDefault, textDefault, textDefault, textDefault]
    property variant backgroundColor: [btnDefault, btnDefault, btnDefault, btnDefault, btnDefault, btnDefault, btnDefault, btnDefault, btnDefault, btnDefault]
    property int index: -1
    property int btnLayer: 1

    property int dcltr: 0
    property bool wxLgnd: false
    property int traffic: 0
    property bool strmscp: false
    property bool nexrad: false
    property bool xmltng: false
    property bool metar: false
    property bool insetVisible: false
    property bool tmrVisible: false
    property bool nrstVisible: false
    property int wind: 0
    property bool dme: false
    property int brg1: 0
    property int brg2: 0

    signal setGalRem(int value)
    signal setMapContent(int value)
    signal windStatus(bool value)
    signal dmeVisibility(bool value)
    signal brg1Status(int value)
    signal brg2Status(int value)

    id: softkeysRect
    width: root.width
    height: constSoftkeyH
    color: constColors[7]
    Row {
        spacing: 0
        focus: true
        Rectangle {
            id: firstBtn
            height: constSoftkeyH
            width: btnWidth + 2
            color: backgroundColor[0]
            border.color: textColor[0]
            border.width: 2
            Text {
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
                id: firstBtnText
                text: qsTr(btnTexts[0])
                color: textColor[0]
                font.pixelSize: fontSize
            }
        }
        Rectangle {
            id: secondBtn
            height: constSoftkeyH
            width: btnWidth
            color: backgroundColor[1]
            border.color: textColor[1]
            border.width: 2
            Text {
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
                id: secondBtnText
                text: qsTr(btnTexts[1])
                color: textColor[1]
                font.pixelSize: fontSize
            }
        }
        Rectangle {
            id: thirdBtn
            height: constSoftkeyH
            width: btnWidth
            color: backgroundColor[2]
            border.color: textColor[2]
            border.width: 2
            Text {
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
                id: thirdBtnText
                text: qsTr(btnTexts[2])
                color: textColor[2]
                font.pixelSize: fontSize
            }
        }
        Rectangle {
            id: forthBtn
            height: constSoftkeyH
            width: btnWidth
            color: backgroundColor[3]
            border.color: textColor[3]
            border.width: 2
            Text {
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
                id: forthBtnText
                text: qsTr(btnTexts[3])
                color: textColor[3]
                font.pixelSize: fontSize
            }
        }
        Rectangle {
            id: fifthBtn
            height: constSoftkeyH
            width: btnWidth
            color: backgroundColor[4]
            border.color: textColor[4]
            border.width: 2
            Text {
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
                id: fifthBtnText
                text: qsTr(btnTexts[4])
                color: textColor[4]
                font.pixelSize: fontSize
            }
        }
        Rectangle {
            id: sixthBtn
            height: constSoftkeyH
            width: btnWidth
            color: backgroundColor[5]
            border.color: textColor[5]
            border.width: 2
            Text {
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
                id: sixthBtnText
                text: qsTr(btnTexts[5])
                color: textColor[5]
                font.pixelSize: fontSize
            }
        }
        Rectangle {
            id: seventhBtn
            height: constSoftkeyH
            width: btnWidth
            color: backgroundColor[6]
            border.color: textColor[6]
            border.width: 2
            Text {
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
                id: seventhBtnText
                text: qsTr(btnTexts[6])
                color: textColor[6]
                font.pixelSize: fontSize
            }
        }
        Rectangle {
            id: eighthBtn
            height: constSoftkeyH
            width: btnWidth
            color: backgroundColor[7]
            border.color: textColor[7]
            border.width: 2
            Text {
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
                id: eighthBtnText
                text: qsTr(btnTexts[7])
                color: textColor[7]
                font.pixelSize: fontSize
            }
        }
        Rectangle {
            id: ninthBtn
            height: constSoftkeyH
            width: btnWidth
            color: backgroundColor[8]
            border.color: textColor[8]
            border.width: 2
            Text {
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
                id: ninthBtnText
                text: qsTr(btnTexts[8])
                color: textColor[8]
                font.pixelSize: fontSize
            }
        }
        Rectangle {
            id: tenthBtn
            height: constSoftkeyH
            width: btnWidth
            color: backgroundColor[9]
            border.color: textColor[9]
            border.width: 2
            Text {
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
                id: tenthBtnText
                text: qsTr(btnTexts[9])
                color: textColor[9]
                font.pixelSize: fontSize
            }
        }
        Rectangle {
            id: eleventhBtn
            height: constSoftkeyH
            width: btnWidth
            color: btnDefault
            border.color: textDefault
            border.width: 2
            Text {
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
                id: eleventhBtnText
                text: qsTr(btnLayer == 1 ? "NRST" : "BACK")
                color: textDefault
                font.pixelSize: fontSize
            }
        }
        Rectangle {
            id: twlevthBtn
            height: constSoftkeyH
            width: btnWidth + 2
            color: btnDefault
            border.color: textDefault
            border.width: 2
            Text {
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
                id: twlevthBtnText
                text: qsTr(status.toString() + " " + btnLayer.toString())
                color: textDefault
                font.pixelSize: fontSize
            }
        }
        Keys.onPressed: {
            index = -1;
            switch(event.key){
            case Qt.Key_1:
                if(btnEnablePressed[0]){
                    index = 0;
                    switch(btnLayer)
                    {
                    case 1:
                        btnLayer = 2;
                        status = 11;
                        break;
                    case 2:
                        switch(Jpublic.quotient(status))
                        {
                        case 1:
                            status = 11;
                            break;
                        case 2:
                            insetVisible = false;
                            setMapContent(0);
                            status = 1;
                            btnLayer =1;
                            break;
                        case 4:
                            status = 411;
                            btnLayer =3;
                            break;
                        }
                        break;
                    case 3:
                        btnLayer = 2;
                        status = 11;
                        break;
                    }
                }
                break;
            case Qt.Key_2:
                if(btnEnablePressed[1]){
                    index = 1;
                    switch(btnLayer)
                    {
                    case 1:
                        btnLayer = 2;
                        status = 21;
                        insetVisible = true;
                        setMapContent(1);
                        break;
                    case 2:
                        switch(Jpublic.quotient(status))
                        {
                        case 1:
                            status = 12;
                            break;
                        case 2:
                            dcltr++;
                            dcltr %= 4;
                            break;
                        }
                        break;
                    case 3:
                        btnLayer = 2;
                        status = 12;
                        break;
                    }
                }
                break;
            case Qt.Key_3:
                if(btnEnablePressed[2]){
                    index = 2;
                    switch(btnLayer)
                    {
                    case 1:
                        break;
                    case 2:
                        switch(Jpublic.quotient(status))
                        {
                        case 1:
                            status = 13;
                            break;
                        case 2:
                            wxLgnd = !wxLgnd;
                            break;
                        case 4:
                            status = 413;
                            btnLayer =3;
                            break;
                        }
                        break;
                    case 3:
                        wind = 1;
                        windStatus(true);
                        break;
                    }
                }
                break;
            case Qt.Key_4:
                if(btnEnablePressed[3]){
                    index = 3;
                    switch(btnLayer)
                    {
                    case 1:
                        status = 41;
                        btnLayer = 2;
                        break;
                    case 2:
                        switch(Jpublic.quotient(status))
                        {
                        case 1:

                            break;
                        case 2:
                            traffic++;
                            traffic %= 3;
                            break;
                        case 4:
                            dme = !dme
                            dmeVisibility(dme);
                            break;
                        }
                        break;
                    case 3:
                        switch(Jpublic.quotient(status))
                        {
                        case 13:
                            softkeysRect.setGalRem(-10);
                            break;
                        case 41:
                            wind = 2;
                            windStatus(true);
                            break;
                        }
                        break;
                    }
                }
                break;
            case Qt.Key_5:
                if(btnEnablePressed[4]){
                    index = 4;
                    switch(btnLayer)
                    {
                    case 1:

                        break;
                    case 2:
                        switch(Jpublic.quotient(status))
                        {
                        case 4:
                            brg1++;
                            brg1 %= 4;
                            brg1Status(brg1);
                            break;
                        }
                        break;
                    case 3:
                        switch(Jpublic.quotient(status))
                        {
                        case 13:
                            softkeysRect.setGalRem(-1);
                            break;
                        case 41:
                            wind = 3;
                            windStatus(true);
                            break;
                        }
                        break;
                    }
                }
                break;
            case Qt.Key_6:
                if(btnEnablePressed[5]){
                    index = 5;
                    switch(btnLayer)
                    {
                    case 1:

                        break;
                    case 2:
                        status = 416;
                        btnLayer = 3;
                        break;
                    case 3:
                        switch(Jpublic.quotient(status))
                        {
                        case 13:
                            softkeysRect.setGalRem(1);
                            break;
                        case 41:
                            wind = 0;
                            windStatus(false);
                            break;
                        }
                        break;
                    }
                }
                break;
            case Qt.Key_7:
                if(btnEnablePressed[6]){
                    index = 6;
                    switch(btnLayer)
                    {
                    case 1:

                        break;
                    case 2:
                        switch(Jpublic.quotient(status))
                        {
                        case 1:
                            softkeysRect.setGalRem(0);
                            break;
                        case 2:
                            strmscp = !strmscp;
                            break;
                        case 4:
                            brg2++;
                            brg2 %= 4;
                            brg2Status(brg2);
                            break;
                        }
                        break;
                    case 3:
                        softkeysRect.setGalRem(10);
                        break;
                    }
                }
                break;
            case Qt.Key_8:
                if(btnEnablePressed[7]){
                    index = 7;
                    switch(btnLayer)
                    {
                    case 1:

                        break;
                    case 2:
                        switch(Jpublic.quotient(status))
                        {
                        case 1:
                            btnLayer = 3;
                            status=130;
                            break;
                        case 2:
                            nexrad = !nexrad;
                            break;
                        }
                        break;
                    case 3:
                        softkeysRect.setGalRem(64);
                        break;
                    }
                }
                break;
            case Qt.Key_9:
                if(btnEnablePressed[8]){
                    index = 8;
                    switch(btnLayer)
                    {
                    case 1:

                        break;
                    case 2:
                        switch(Jpublic.quotient(status))
                        {
                        case 1:

                            break;
                        case 2:
                            xmltng = !xmltng;
                            break;
                        case 4:
                            status = 419;
                            btnLayer = 3;
                            break;
                        }
                        break;
                    case 3:
                        softkeysRect.setGalRem(87);
                        break;
                    }
                }
                break;
            case Qt.Key_0:
                if(btnEnablePressed[9]){
                    index = 9;
                    switch(btnLayer)
                    {
                    case 1:
                        setMapContent(tmrVisible ? (insetVisible ? 1 : 0) : 2);
                        tmrVisible = !tmrVisible;
                        nrstVisible = false;
                        break;
                    case 2:
                        switch(Jpublic.quotient(status))
                        {
                        case 1:

                            break;
                        case 2:
                            metar = !metar;
                            break;
                        }
                        break;
                    case 3:
                        softkeysRect.setGalRem(87);
                        break;
                    }
                }
                break;
            case Qt.Key_Minus:
                eleventhBtn.color = btnPressed;
                eleventhBtn.border.color = textPressed;
                eleventhBtnText.color = textPressed;
                switch(btnLayer)
                {
                case 1:
                    setMapContent(nrstVisible ? (insetVisible ? 1 : 0) : 3);
                    nrstVisible = !nrstVisible;
                    tmrVisible = false;
                    break;
                case 2:
                    btnLayer = 1
                    status = 1;
                    break;
                case 3:
                    btnLayer = 2
                    status = Jpublic.quotient(status)
                    break;
                }
                break;
            case Qt.Key_Equal:
                twlevthBtn.color = btnPressed;
                twlevthBtn.border.color = textPressed;
                twlevthBtnText.color = textPressed;
                break;
            default:
                index = -1;
            }
            if(index != -1)
            {
                var t = textColor
                t[index] = textPressed;
                textColor = t;
                var b = backgroundColor
                b[index] = btnPressed;
                backgroundColor = b;
            }
        }
        Keys.onReleased: {
            if(event.key === Qt.Key_Minus){
                eleventhBtn.color = btnDefault;
                eleventhBtn.border.color = textDefault;
                eleventhBtnText.color = textDefault;
            }
            btnTexts = Jsoftkey.btnContent(status);
            btnEnablePressed = Jsoftkey.btnPressedEnabled(status);
            //btnEnableReleased = Jsoftkey.btnReleasedEnabled(status);
            textColor = Jsoftkey.textColor(status);
            backgroundColor = Jsoftkey.backgroundColor(status);
        }
    }
}
