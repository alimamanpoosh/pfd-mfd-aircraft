import QtQuick 2.12
import QtQuick.Controls 2.12
import QtGraphicalEffects 1.0

Item
{
    //message_type, transmission_type, session_id, aircraft_id, hex_ident, flight_id, generated_date, generated_time, logged_date, logged_time, callsign, altitude, ground_speed, track, lat, lon, vertical_rate, squawk, alert, emergency, spi, is_on_ground
    property int varADSBColor:0;
    property string varADSBHexIdent;
    property int varADSBAltitude:0;
    property int varADSBSpeed:0;
    property int varADSBTrack:0;
    property double varADSBLat:0.0;
    property double varADSBLon:0.0;
    property int varADSBRate:0;
    property date varADSBUpdate:new Date();
    x:0
    y:0
    Image
    {
        id:idCImage0
        source:"qrc:images/Plane"+constColorStrs[varADSBColor]+".png"
        x:0
        y:0
        width: constADSBPlaneW
        height: constADSBPlaneH
        rotation: varADSBTrack
    }
    Text
    {
        id: idCImage1
        x:idCImage0.x
        y:idCImage0.y+constADSBPlaneH
        text:varADSBHexIdent
        color: constColors[varADSBColor]
        font.pixelSize:varScaleAspectMin*constDotFont2
        font.bold:true
    }
}
