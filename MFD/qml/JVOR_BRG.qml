import QtQuick.Shapes 1.12
import QtQuick 2.9
import QtQuick.Controls 2.5
import QtQuick.Controls.Material 2.3
import QtQuick.Extras 1.4
import QtQuick.Controls.Styles 1.4
import QtGraphicalEffects 1.0
import "qrc:/js/main.js" as Jmain

Item {
    CircularGauge
    {//blue1line
        visible: brg1Check.checked
        id: brg1
        implicitWidth: hsiDiameter
        implicitHeight: hsiDiameter
        minimumValue: 0
        maximumValue: 360
        value: varYawValue//brgOneSlider.value
        style:
        CircularGaugeStyle
        {
            minimumValueAngle: 0
            maximumValueAngle: 360
            tickmarkLabel: null
            foreground: null
            tickmark: null
            minorTickmark: null
            needle: JBrg1Needle{}
        }
    }
    CircularGauge
    {//blue2line
        visible: brg2Check.checked
        id: brg2
        implicitWidth: hsiDiameter
        implicitHeight: hsiDiameter
        minimumValue: 0
        maximumValue: 360
        value: varYawValue//brgTwoSlider.value
        style:
        CircularGaugeStyle
        {
            minimumValueAngle: 0
            maximumValueAngle: 360
            tickmarkLabel: null
            foreground: null
            tickmark: null
            minorTickmark: null
            needle: JBrg2Needle{}
        }
    }
    CircularGauge
    {//green1line
        visible: vor1Check.checked
        id: vor1
        implicitWidth: hsiDiameter
        implicitHeight: hsiDiameter
        minimumValue: 0
        maximumValue: 360
        value: varYawValue//vorOneSlider.value
        style:
        CircularGaugeStyle
        {
            minimumValueAngle: 0
            maximumValueAngle: 360
            tickmarkLabel: null
            foreground: null
            tickmark: null
            minorTickmark: null
            needle:
            JVorNeedle
            {
                needleColor: constColors[1]//lightGreenColor
                offsetValue: vorOneOffset.value
            }
        }
    }

    CircularGauge
    {//green2line
        visible: vor2Check.checked
        id: vor2
        implicitWidth: hsiDiameter
        implicitHeight: hsiDiameter
        minimumValue: 0
        maximumValue: 360
        value: varYawValue//vorTwoSlider.value
        style:
        CircularGaugeStyle
        {
            minimumValueAngle: 0
            maximumValueAngle: 360
            tickmarkLabel: null
            foreground: null
            tickmark: null
            minorTickmark: null
            needle:
            JVorNeedle
            {
                needleColor: constColors[7]
                borderColor: constColors[1]//lightGreenColor
                borderThickness: 3
                rodWidth: 8
                offsetValue: vorTwoOffset.value
            }
        }
    }
}
