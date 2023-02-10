import QtQuick 2.9

Rectangle {

    width: 80
    height: 54
    anchors{
        left: parent.left
        bottom: parent.bottom
        leftMargin: 245
        bottomMargin: 226
    }
    color: constColors[4]
    border{
        color: constColors[3]
        width: 1
    }
    Text {
        anchors.fill: parent
        text: qsTr("NO WIND\nDATA")
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        font.pixelSize: 18
        color: constColors[3]
    }
}
