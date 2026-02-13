params ["_target", "_volume"];

private _playlist = [
    ["manaStrangers", 283],
    ["brakenceVenus", 296],
    ["xaptioxSoup", 205],
    ["lexieMagic", 210],
    ["lvtherMagic", 194],
    ["vicetoneNevada", 205],
    ["moRighteous", 160],
    ["vierreMoment", 130],
    ["takayanEternal", 150]
];

[_target, _volume, _playlist] call UKSFTA_Music_fnc_radioOn;
