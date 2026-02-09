params ["_target", "_volume"];

private _playlist = [
	["lieuBack2u", 128],
	["lieuGetOut", 118],
	["avitBreathe", 187],
	["landingStill", 239],
	["keshi2Soon", 207],
	["reservNewEdition", 226],
	["jadesCrashed", 148],
	["jadenParis", 270],
	["glaiveLastThing", 226],
	["gatsbyLetMeIn", 183]
];

[_target, _volume, _playlist] call UKSFTA_Music_fnc_radioOn;
