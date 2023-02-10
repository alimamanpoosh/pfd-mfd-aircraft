const Status = Object.freeze(
                 {
                     Standby: 1,
                     E_Engine: 11,
                     E_Lean: 12,
                     E_System: 13,
                     GalRem: 130,
                     Inset: 21,
                     Pfd: 41,
                     P_Syn: 411,
                     P_Wind: 413,
                     P_Hsi: 416,
                     P_Alt: 419,
                 })

function btnContent(index) {

    const status = Object.keys(Status).find(name => Status[name] === index);
    switch(status)
    {
    case "Standby":
        return ["ENGINE", "INSET", "", "PFD","OBS", "CDI", "DME", "XPDR","IDENT", "TMR/REF"];
    case "E_Engine":
        return ["ENGINE", "LEAN", "SYSTEM", "","", "", "", "","", ""];
    case "E_Lean":
        return ["ENGINE", "LEAN", "SYSTEM", "","CYL SLCT", "ASSIST", "", "","", ""];
    case "E_System":
        return ["ENGINE", "LEAN", "SYSTEM", "","", "", "RST FUEL", "GAL REM","", ""];
    case "GalRem":
        return ["ENGINE", "LEAN", "SYSTEM", "-10 GAL","-1 GAL", "+1 GAL", "+10 GAL", "64 GAL","87 GAL", ""];
    case "Inset":
        var _dcltr = dcltr == 0 ? "DCLTR" : "DCLTR-" + dcltr.toString()
        var _traffic = traffic == 0 ? "TRAFFIC" : "TRFC-" + traffic.toString()
        return ["OFF", _dcltr, "WX LGND", _traffic,"TOPO", "TERRAIN", "STRMSCP", "NEXRAD","XM LTNG", "METAR"];
    case "Pfd":
        return ["SYN VIS", "DFLTS", "WIND", "DME","BRG1", "HSI FRMT", "BRG2", "","ALT UNIT", "STD BARO"];
    case "P_Syn":
        return ["PATHWAY", "SYN TERR", "HRZN HDG", "APTSIGNS","", "", "", "","", ""];
    case "P_Wind":
        return ["", "", "OPTN 1", "OPTN 2","OPTN 3", "OFF", "", "","", ""];
    case "P_Hsi":
        return ["", "", "", "","", "360 HSI", "ARC HSI", "","", ""];
    case "P_Alt":
        return ["", "", "", "","", "METERS", "", "IN","HPA", ""];
    }
}

function btnPressedEnabled(index) {

    const status = Object.keys(Status).find(name => Status[name] === index);
    switch(status)
    {
    case "Standby":
        return [true, true, false, true, false, true, true, true,true, true];
    case "E_Engine":
        return [true, true, true, false, false, false, false, false,false, false];
    case "E_Lean":
        return [true, true, true, false, true, true, false, false,false, false];
    case "E_System":
        return [true, true, true, false, false, false, true, true, false, false];
    case "GalRem":
        return [true, true, true, true, true, true, true, true, true, false];
    case "Inset":
        return [true, traffic !== 2, traffic !== 2, true, false, false, traffic !== 2, traffic !== 2, traffic !== 2, true];
    case "Pfd":
        return [true, true, true, true, true, true, true, false, true, true];
    case "P_Syn":
        return [false, false, false, false, false, false, false, false, false, false];
    case "P_Wind":
        return [false, false, true, true, true, true, false, false, false, false];
    case "P_Hsi":
        return [false, false, false, false, false, true, true, false, false, false];
    case "P_Alt":
        return [false, false, false, false, false, true, false, true, true, false];
    }
}

//function btnReleasedEnabled(index) {

//    const status = Object.keys(Status).find(name => Status[name] === index);
//    switch(status)
//    {
//    case "Standby":
//        return [false, true, false, true, false, true, true, true,true, true];
//    case "E_Engine":
//        return [false, false, false, false, false, false, false, false,false, false];
//    case "E_Lean":
//        return [false, false, false, false, true, false, false, false,false, false];
//    case "E_System":
//        return [false, false, false, false, false, false, true, true,false, false];
//    case "GalRem":
//        return [false, false, false, true, true, true, true, true,true, false];
//    case "Inset":
//        return [true, false, false, true, false, false, false, false, false, false];
//    case "Pfd":
//        return [true, true, true, false, true, true, true, true, true, true];
//    case "P_Syn":
//        return [false, false, false, false, false, false, false, false, false, false];
//    case "P_Wind":
//        return [false, false, false, false, false, false, false, false, false, false];
//    case "P_Hsi":
//        return [false, false, false, false, false, false, false, false, false, false];
//    case "P_Alt":
//        return [false, false, false, false, false, false, false, false, false, false];
//    }
//}

function textColor(index) {

    const status = Object.keys(Status).find(name => Status[name] === index);
    switch(status)
    {
    case "Standby":
        return [textDefault, textDefault, textDefault, textDefault, textDisable, textDefault, textDefault, textDefault, textDefault, textDefault];
    case "E_Engine":
        return [textPressed, textDefault, textDefault, textDisable, textDisable, textDisable, textDisable, textDisable, textDisable, textDisable];
    case "E_Lean":
        return [textDefault, textPressed, textDefault, textDisable, textDefault, textDefault, textDisable, textDisable, textDisable, textDisable];
    case "E_System":
        return [textDefault, textDefault, textPressed, textDisable, textDisable, textDisable, textDefault, textDefault, textDisable, textDisable];
    case "GalRem":
        return [textDefault, textDefault, textPressed, textDefault, textDefault, textDefault, textDefault, textDefault, textDefault, textDisable];
    case "Inset":
        var _dcltr = dcltr == 0 ? textDefault : textPressed;
        var _wxlgnd = wxLgnd ? textPressed : textDefault;
        var _traffic = traffic == 0 ? textDefault : textPressed;
        var _strmscp = strmscp ? textPressed : textDefault;
        var _nexrad = nexrad ? textPressed : textDefault;
        var _xmltng = xmltng ? textPressed : textDefault;
        return [textDefault,
                traffic !== 2 ? _dcltr :textDisable,
                traffic !== 2 ? _wxlgnd :textDisable,
                _traffic,
                textDisable,
                textDisable,
                traffic != 2 ? _strmscp : textDisable,
                traffic != 2 ? _nexrad : textDisable,
                traffic != 2 ? _xmltng : textDisable,
                metar ? textPressed : textDefault];
    case "Pfd":
        return [textDefault, textDefault, textDefault, dme ? textPressed : textDefault, textDefault, textDefault, textDefault, textDefault, textDefault, textDefault];
    case "P_Syn":
        return [textDisable, textDisable, textDisable, textDisable, textDisable, textDisable, textDisable, textDisable, textDisable, textDisable];
    case "P_Wind":
        return [textDisable, textDisable, wind == 1 ? textPressed : textDefault, wind == 2 ? textPressed : textDefault, wind == 3 ? textPressed : textDefault, wind == 0 ? textPressed : textDefault, textDisable, textDisable, textDisable, textDisable];
    case "P_Hsi":
        return [textDisable, textDisable, textDisable, textDisable, textDisable, textDefault, textDefault, textDisable, textDisable, textDisable];
    case "P_Alt":
        return [textDisable, textDisable, textDisable, textDisable, textDisable, textDefault, textDisable, textDefault, textDefault, textDisable];
    }
}

function backgroundColor(index) {

    const status = Object.keys(Status).find(name => Status[name] === index);
    switch(status)
    {
    case "Standby":
        return [btnDefault, btnDefault, btnDefault, btnDefault, btnDefault, btnDefault, btnDefault, btnDefault, btnDefault, btnDefault];
    case "E_Engine":
        return [btnPressed, btnDefault, btnDefault, btnDefault, btnDefault, btnDefault, btnDefault, btnDefault, btnDefault, btnDefault];
    case "E_Lean":
        return [btnDefault, btnPressed, btnDefault, btnDefault, btnDefault, btnDefault, btnDefault, btnDefault, btnDefault, btnDefault];
    case "E_System":
        return [btnDefault, btnDefault, btnPressed, btnDefault, btnDefault, btnDefault, btnDefault, btnDefault, btnDefault, btnDefault];
    case "GalRem":
        return [btnDefault, btnDefault, btnPressed, btnDefault, btnDefault, btnDefault, btnDefault, btnDefault, btnDefault, btnDefault];
    case "Inset":
        var _dcltr = dcltr == 0 ? btnDefault : btnPressed;
        var _wxlgnd = wxLgnd ? btnPressed : btnDefault
        var _traffic = traffic == 0 ? btnDefault : btnPressed;
        var _strmscp = strmscp ? btnPressed : btnDefault
        var _nexrad = nexrad ? btnPressed : btnDefault
        var _xmltng = xmltng ? btnPressed : btnDefault
        return [btnDefault,
                traffic !== 2 ? _dcltr : btnDefault,
                traffic !== 2 ? _wxlgnd : btnDefault,
                _traffic, btnDefault,
                btnDefault,
                traffic !== 2 ? _strmscp : btnDefault,
                traffic !== 2 ? _nexrad : btnDefault,
                traffic !== 2 ? _xmltng : btnDefault,
                metar ? btnPressed: btnDefault];
    case "Pfd":
        return [btnDefault, btnDefault, btnDefault, dme ? btnPressed : btnDefault, btnDefault, btnDefault, btnDefault, btnDefault, btnDefault, btnDefault];
    case "P_Syn":
        return [btnDefault, btnDefault, btnDefault, btnDefault, btnDefault, btnDefault, btnDefault, btnDefault, btnDefault, btnDefault];
    case "P_Wind":
        return [btnDefault, btnDefault, wind == 1 ? btnPressed : btnDefault, wind == 2 ? btnPressed : btnDefault, wind == 3 ? btnPressed : btnDefault, wind == 0 ? btnPressed : btnDefault, btnDefault, btnDefault, btnDefault, btnDefault];
    case "P_Hsi":
        return [btnDefault, btnDefault, btnDefault, btnDefault, btnDefault, btnDefault, btnDefault, btnDefault, btnDefault, btnDefault];
    case "P_Alt":
        return [btnDefault, btnDefault, btnDefault, btnDefault, btnDefault, btnDefault, btnDefault, btnDefault, btnDefault, btnDefault];
    }
}


