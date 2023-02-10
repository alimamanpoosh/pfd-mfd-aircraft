import QtQuick 2.9

Rectangle {

    width: constMapMiniW
    height: constMapMiniH
    anchors{
        right: parent.right
        bottom: parent.bottom
        rightMargin: mapRightMargin
        bottomMargin: mapBottomMargin
    }
    border{
        width: 1
        color: constColors[3]
    }
    color: constColors[4]

    Text {
        id: name
        text: qsTr("tmr")
        color: constColors[3]
    }
}
