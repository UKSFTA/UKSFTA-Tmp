/*
    UKSFTA Play Playlist
    _target   = the physical Radio object
    _volume   = volume (0-100)
    _playlist = array of [ClassName, Duration]
*/

params ["_target", "_volume", "_playlist"];

if (isNil "_playlist" || {count _playlist == 0}) exitWith {hint "Playlist empty!";};

// 1. Cleanup any existing music first
[_target] call TAG_fnc_radioOff;

// 2. Selection
private _randomPair = selectRandom _playlist;
_randomPair params ["_trackName", "_duration"];

// 3. Create the Sound Source (Invisible helper)
// Using "#particlesource" or "UserTexture1m_F" is common as they are lightweight
private _soundObj = "UserTexture1m_F" createVehicleLocal [0,0,0];
_soundObj hideObject true;
_soundObj attachTo [_target, [0,0,0.2]];

// 4. Store the object on the radio so radioOff.sqf can find it
_target setVariable ["radioObject", _soundObj, true];
_target setVariable ["radioOn", true, true];

// 5. Volume/Distance logic
private _dist = 50;
if (_volume <= 10) then { _dist = 15; };
if (_volume >= 100) then { _dist = 120; };

// 6. Play the sound on the HELPER object
// Note: We remoteExec this so everyone hears it, but the object is deleted globally later
[_soundObj, [_trackName, _dist, 1]] remoteExec ["say3D", 0];

// 7. Auto-cleanup after song ends (Optional)
[_target, _soundObj, _duration] spawn {
    params ["_radio", "_source", "_time"];
    sleep _time;
    if (!isNull _source) then {
        deleteVehicle _source;
        _radio setVariable ["radioOn", false, true];
    };
};
