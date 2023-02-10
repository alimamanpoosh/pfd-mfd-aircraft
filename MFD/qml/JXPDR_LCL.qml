import QtQuick 2.9

Rectangle{
    property double delay: 500

    width: constXpdrLclW
    height: constXpdrLclH
    anchors{
        right: parent.right
        bottom: parent.bottom
        rightMargin: 3
        bottomMargin: 2
    }
    color: constColors[7]
    Row {
        Rectangle{
            width: 170
            height: 24
            border{
                color: constColors[3]
                width: 1
            }
            color: constColors[4]
            Row{
                Text {
                    text: qsTr("XPDR")
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    height: 24
                    width: 42
                    color: constColors[3]
                    font.pixelSize: 16
                }
                Text {
                    id: xpdr
                    text: qsTr("1200")
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    height: 24
                    width: 62
                    color: constColors[3]
                    font.pixelSize: 20
                }
                Text {
                    id: alt
                    text: qsTr("ALT")
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    height: 24
                    width: 44
                    color: constColors[3]
                    font.pixelSize: 16
                }
                Text {
                    id: r
                    text: qsTr("R")
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    height: 24
                    width: 22
                    color: constColors[3]
                    font.pixelSize: 14
                }
            }
        }
        Rectangle{
            width: 132
            height: 24
            border{
                color: constColors[3]
                width: 1
            }
            color: constColors[4]
            Row{
                Text {
                    id: lcl
                    text: qsTr("LCL")
                    horizontalAlignment: Text.AlignLeft
                    verticalAlignment: Text.AlignVCenter
                    height: 24
                    width: 48
                    color: constColors[3]
                    font.pixelSize: 16
                    leftPadding: 5
                }
                Text {
                    id: time
                    horizontalAlignment: Text.AlignRight
                    verticalAlignment: Text.AlignVCenter
                    height: 24
                    width: 84
                    color: constColors[3]
                    font.pixelSize: 20
                    rightPadding: 5
                }
            }
        }
    }
    Timer {
        interval: delay; running: true; repeat: true
        onTriggered:{
            if(r.opacity == 1)
            {
                delay = 100;
                r.opacity = 0;
            }
            else{
                delay = 500;
                r.opacity = 1;
            }
        }
    }
    Timer {
        interval: 1000; running: true; repeat: true
        onTriggered: time.text = Qt.formatDateTime(new Date(), "hh:mm:ss")
    }
}
