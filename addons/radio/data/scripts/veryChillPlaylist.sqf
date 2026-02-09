params ["_target", "_volume"];

private _playlist = [
	["hideaSwallowed", 184],
	["weepIris", 136],
	["tailsFloating", 146],
	["kerriWestmount", 277],
	["matchesPeroxide", 173],
	["lucyAlcoholic", 247],
	["potsuBe", 236],
	["keaganClueless", 157],
	["salesForever", 155],
	["dylisHeart", 134],
	["jojiNitrous", 132],
	["jojiAfterthought", 195],
	["sewerLR7", 183],
	["swellSorry", 157],
	["jojiRight", 174],
	["slenderAmnesia", 208]
];

[_target, _volume, _playlist] call UKSFTA_Music_fnc_radioOn;
