import QtQuick.Shapes 1.12
import QtQuick 2.9
import QtQuick.Controls 2.5
import QtQuick.Controls.Material 2.3
import QtQuick.Extras 1.4
import QtQuick.Controls.Styles 1.4

Rectangle
{
    property double heightCoeficient: 6
    property double numLength: 25
    property double lineLength: 110
    property double horizantalSpace: 0

    clip: true
    color: constColors[7]
    Loader
    {
        asynchronous: true
        visible: status === Loader.Ready
        anchors.fill: parent
        sourceComponent:
        Flickable
        {
            anchors.top: parent.top
            contentX: 0
            contentY: roll_pitch.height * (-varPitchValue * heightCoeficient / 180) + varPitchValue / 6 - 19
            Gauge
            {
                id: pitchGauge
                width: lineLength + 2 * numLength + 2 * horizantalSpace
                anchors.centerIn: parent
                height: 1900//roll_pitch.height * heightCoeficient //Esmaeili
                minimumValue: -90
                value: 0
                maximumValue: 90
                tickmarkStepSize: 5//?????
                minorTickmarkCount: 1
                style:
                GaugeStyle
                {
                    property double indicatorsHorizontalMargin: -12
                    property double heightGrid: 20
                    property double widthV: 30
                    property double maxV: 50
                    property double minV: -30
                    property double heightV: myIDBack.width * heightCoeficient / (3*18*2)
                    property double _lineLength: 110
                    property double smallLine: 60
                    property double _numLength: 25
                    property double lineThickness: outerRadius * 0.01
                    property int fontSize: 20
                    property double backGroundWidth: myIDBack.width*3
                    property double _horizantalSpace: 0

                    tickmarkLabel: null
                    tickmark:
                    Grid
                    {
                        anchors.left: parent.left
                        width: pitchGauge.width
                        anchors.leftMargin: indicatorsHorizontalMargin
                        columns: (styleData.value  === 0) ? 1 : ((styleData.value % 10 == 0) ? 3 : (styleData.value< maxV && styleData.value > minV ? 4 : 2))
                        spacing: _horizantalSpace

                        // line in zero
                        /*Rectangle
                        {
                            visible: styleData.value  === 0
                            width: parent.width
                            height: heightGrid
                            color: constColors[7]
                            Shape
                            {
                                anchors.fill: parent
                                ShapePath
                                {
                                    strokeWidth: 1
                                    strokeColor: constColors[3]
                                    fillColor:   constColors[3]

                                             //startX: (pitchGauge.width - backGroundWidth)/2; startY: heightGrid/2 - 1 ;
                                    //PathLine {      x: (pitchGauge.width + backGroundWidth)/2;      y: heightGrid/2 - 1 }
                                    //PathLine {      x: (pitchGauge.width + backGroundWidth)/2;      y: heightGrid/2 + 1 }
                                    //PathLine {      x: (pitchGauge.width - backGroundWidth)/2;      y: heightGrid/2 + 1 }
                                    //PathLine {      x: (pitchGauge.width - backGroundWidth)/2;      y: heightGrid/2 - 1 }

                                               startX:  50; startY: heightGrid/2 - 1 ;
                                    PathLine {      x: 110;      y: heightGrid/2 - 1 }
                                    PathLine {      x: 110;      y: heightGrid/2 + 1 }
                                    PathLine {      x:  50;      y: heightGrid/2 + 1 }
                                    PathLine {      x:  50;      y: heightGrid/2 - 1 }
                                }
                            }
                        }*/

                        //space in left
                        Rectangle
                        {
                            visible: styleData.value % 10 != 0 && styleData.value  !== 0
                            width: styleData.value< maxV && styleData.value > minV && styleData.value % 10 != 0 ? (_lineLength - smallLine)/2: 0
                            height: heightGrid
                            color: constColors[7]
                        }

                        //left number
                        Rectangle
                        {
                            visible: (styleData.value % 10 == 0 || (styleData.value< maxV && styleData.value > minV)) && styleData.value  !== 0
                            width: _numLength
                            height: heightGrid
                            color: constColors[7]
                            Text
                            {
                                font.pixelSize: fontSize
                                visible: styleData.value !== 0
                                color:  Math.abs(styleData.value) !== 90 ? constColors[3] : constColors[7]
                                anchors.leftMargin: (styleData.value % 10 == 0) ? 0 : outerRadius * 0.05
                                anchors.centerIn: parent
                                text: Math.abs(Math.round(styleData.value,0))
                            }
                        }

                        // line
                        Rectangle
                        {
                            visible: (styleData.value % 10 == 0 || (styleData.value< maxV && styleData.value > minV)) && styleData.value  !== 0
                            width: styleData.value % 10 == 0 ? _lineLength : smallLine
                            height: heightGrid
                            color: constColors[7]
                            Rectangle
                            {
                                width: styleData.value % 10 == 0 ? _lineLength : smallLine
                                height: lineThickness
                                anchors.verticalCenter: parent.verticalCenter
                                antialiasing: true
                                color: Math.abs(styleData.value) !== 90 ? constColors[3] : constColors[7]
                            }
                        }

                        //right number
                        Rectangle
                        {
                            visible: (styleData.value % 10 == 0 || (styleData.value< maxV && styleData.value > minV)) && styleData.value  !== 0
                            width: _numLength
                            height: heightGrid
                            color: constColors[7]
                            Text
                            {
                                font.pixelSize: fontSize
                                visible: styleData.value !== 0
                                color: Math.abs(styleData.value) !== 90 ? constColors[3] : constColors[7]
                                anchors.centerIn: parent
                                text:Math.abs(Math.round(styleData.value,0))
                            }
                        }

                        // v shape
                        Rectangle
                        {
                            visible: (styleData.value % 10 != 0 && (styleData.value > maxV || styleData.value < minV)) && styleData.value  !== 0
                            width: pitchGauge.width
                            height: heightGrid
                            color: constColors[7]

                            Shape
                            {
                                visible: styleData.value > 0 && styleData.value < 80
                                anchors.fill: parent
                                ShapePath
                                {
                                    strokeWidth: 0
                                    strokeColor: constColors[4]
                                    fillColor: constColors[0]
                                          startX: _numLength + 75 - styleData.value;            startY: heightGrid - heightV
                                    PathLine { x: _numLength + (135 - styleData.value) / 2;          y: heightGrid - heightV }
                                    PathLine { x: pitchGauge.width / 2;                              y: (heightGrid + heightV) / 3 }
                                    PathLine { x: pitchGauge.width / 2 + (styleData.value - 25) / 2; y: heightGrid - heightV }
                                    PathLine { x: pitchGauge.width / 2 + styleData.value - 20;       y: heightGrid - heightV }
                                    PathLine { x: pitchGauge.width / 2 + (styleData.value - 5) / 4;  y: heightV}
                                    PathLine { x: pitchGauge.width / 2 - (styleData.value - 5) / 4;  y: heightV}
                                    PathLine { x: _numLength + 75 - styleData.value;                 y: heightGrid - heightV}
                                }
                            }

                            Shape
                            {
                                visible: styleData.value < 0 && styleData.value > -80
                                anchors.fill: parent
                                ShapePath
                                {
                                    strokeWidth: 0
                                    strokeColor: constColors[4]
                                    fillColor: constColors[0]
                                          startX: pitchGauge.width / 2 - (-styleData.value - 5) / 4; startY: heightGrid - heightV
                                    PathLine { x: pitchGauge.width / 2 + (-styleData.value - 5) / 4;      y: heightGrid - heightV}
                                    PathLine { x: pitchGauge.width / 2 + -styleData.value - 20;           y: heightV }
                                    PathLine { x: pitchGauge.width / 2 + (-styleData.value - 25) / 2;     y: heightV }
                                    PathLine { x: pitchGauge.width / 2;                                   y:  0 }
                                    PathLine { x: _numLength + (135 + styleData.value) / 2;               y:  heightV }
                                    PathLine { x: _numLength + 75 + styleData.value;                      y:  heightV }
                                    PathLine { x: pitchGauge.width / 2 - (-styleData.value - 5) / 4;      y: heightGrid - heightV  }
                                }
                            }
                        }
                    }

                    minorTickmark:
                    Grid
                    {
                        anchors.left: parent.left
                        anchors.leftMargin: indicatorsHorizontalMargin
                        width: pitchGauge.width
                        columns: 3
                        spacing: 0
                        Rectangle
                        {
                            width: (pitchGauge.width-30)/2
                            height: heightGrid
                            color: constColors[7]
                        }

                        Rectangle
                        {
                            width: 30
                            height: heightGrid
                            color: constColors[7]
                            Rectangle
                            {
                                visible: styleData.value < 20 && styleData.value > -20
                                width: pitchGauge.width/6
                                height: lineThickness
                                anchors.verticalCenter: parent.verticalCenter
                                antialiasing: true
                                color: constColors[3]
                            }
                        }

                        Rectangle
                        {
                             width: (pitchGauge.width-30)/2
                             height: heightGrid
                             color: constColors[7]
                        }
                    }

                    valueBar: null
                }//GaugeStyle
            }//Gauge
        }//Flickable
    }//Loader
}
