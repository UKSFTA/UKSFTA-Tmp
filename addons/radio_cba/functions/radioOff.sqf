params ["_target"];

if (isNull _target) exitWith {};

_target setVariable ["radioOn", false, true];
private _music = _target getVariable "radioObject";
deleteVehicle _music;

// Cleanup Speakers
private _nearbySpeakers = nearestObjects [_target, ["Land_Loudspeakers_F", "Land_PublicAddressSystem_F", "Land_Speaker_F"], 100];
{
    [_x] remoteExec ["UKSFTA_Music_fnc_radioOff", 0];
} forEach _nearbySpeakers;
