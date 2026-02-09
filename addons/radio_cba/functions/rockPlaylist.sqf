params ["_target", "_volume"];

private _playlist = [
	["cvlteHappy", 300],
	["animalRepudiation", 290],
	["mvrksReckoning", 230],
	["mvrksScars", 250],
	["paramorePressure", 185],
	["linkinNumb", 185],
	["graceInfrared", 230],
	["fooEverlong", 250],
	["giantsRiot", 220],
	["radioWolf", 275],
	["graceOutline", 180],
	["girlsEscape", 207]
];

[_target, _volume, _playlist] call UKSFTA_Music_fnc_radioOn;
