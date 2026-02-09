if(is3DEN) exitWith {};

private _unit = _this select 0;

if (local _unit) then {
	_unit addEventHandler ["HandleDamage", {_this call Uksfta_BallisticImpact_fnc_main}];
};
