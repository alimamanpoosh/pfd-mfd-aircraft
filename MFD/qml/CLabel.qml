import QtQuick 2.12
import QtQuick.Controls 2.12

Label
{
    property int    paramWndType ;
    property int    paramIndex;

    color:constColors[constTextColor[paramWndType][paramIndex]]
    font.family: constFontFamily
    font.pixelSize: varScaleAspectMin*constDotFont1
    font.bold:true
    background:
    Rectangle
    {
        id: id1
        color: constColors[constBackColor[paramWndType][paramIndex]]
        border.color: constColors[constBorderColor[paramWndType][paramIndex]]
        border.width: constDotBorder;
    }
    horizontalAlignment: Text.AlignHCenter;
    verticalAlignment: Text.AlignVCenter;
}
