import QtQuick.Shapes 1.12
import QtQuick 2.9
import QtQuick.Controls 2.5
import QtQuick.Controls.Material 2.3
import QtQuick.Extras 1.4
import QtQuick.Controls.Styles 1.4
import "qrc:/js/main.js" as Jmain

CircularGauge {
    property double needleWidth: 15
    property int brgCircleVisiblity: 0
    id: compass
    width: constCompassW
    height: constCompassW
    minimumValue: 0
    maximumValue: 360
    value: varYawValue  //Esmaeili
    style: CircularGaugeStyle
    {
        minorTickmarkCount: 4
        minorTickmarkInset: 10
        tickmarkInset: 10
        tickmarkStepSize: 45
        minimumValueAngle: 360
        maximumValueAngle: 0
        tickmarkLabel: null
        foreground:
        JGpsNeedle
        {
            offsetValue: gpsOffset.value
            angleValue: varYawValue//gpsSlider.value - varYawValue  //Esmaeili
        }
        tickmark: Rectangle {
            visible: styleData.value !==0 && styleData.value !==180 && styleData.value !==-180
            width: 4
            antialiasing: true
            height: 13
            color: constColors[3]
        }
        minorTickmark: Rectangle {
            visible: styleData.value < 20 || styleData.value > 340
            width: 2
            antialiasing: true
            height: 13
            color: constColors[3]
        }
        background: Canvas {
            onPaint: {
                var ctx = getContext("2d");
                ctx.reset();
                ctx.beginPath();
                ctx.strokeStyle = constColors[9];
                ctx.globalAlpha = 0.6;
                ctx.lineWidth = 25.5;
                ctx.arc(outerRadius, outerRadius, outerRadius - ctx.lineWidth / 2,
                        Jmain.degreesToRadians(valueToAngle(25) - 90), Jmain.degreesToRadians(valueToAngle(-25) - 90));
                ctx.stroke();
            }
        }
        needle: JHSI{
            navName: gpsCheck.checked ? gpsCheck.text : vor1Check.checked ? vor1Check.text : vor2Check.text
            navTxtColor: gpsCheck.checked ? constColors[6]/*purpleColor*/ : constColors[1]/*lightGreenColor*/
        }
    }

}

