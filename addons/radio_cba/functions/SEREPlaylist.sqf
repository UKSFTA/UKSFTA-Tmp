params ["_target", "_volume"];

private _playlist = [
    ["Boots", 318]
//    ["Yoko", 162]
];

[_target, _volume, _playlist] call UKSFTA_Music_fnc_radioOn;
