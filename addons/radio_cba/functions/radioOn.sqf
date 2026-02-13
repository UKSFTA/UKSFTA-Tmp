params ["_target", "_volume", "_playlist"];

_target setVariable ["radioOn", true, true];
private _shuffle = _playlist call BIS_fnc_arrayShuffle;

nul = [_target, _shuffle, _volume] spawn
{
    params ["_target", "_shuffle", "_volume"];
    {
        private _radioOn = _target getVariable ["radioOn", false];
        if (!_radioOn || count attachedObjects _target != 0) exitWith {};

        private _music = "Land_FMradio_F" createVehicle position _target;
        private _pos = getPosATL _target;
        _music setPosATL [_pos select 0, _pos select 1, _pos select 2];
        _music attachTo [_target];
        hideObjectGlobal _music;
        _target setVariable ["radioObject", _music, true];

        [_music, [((_shuffle select _forEachIndex) select 0), _volume, 1, 2, 0]] remoteExec ["say3D", 0, true];

        sleep ((_shuffle select _forEachIndex) select 1);
        deleteVehicle _music;
    } forEach _shuffle;
};
