/*
    UKSFTA Broadcast to Speakers
    _target = The Radio object (source)
    _player = The player who interacted
    _radius = Distance to search for speakers
*/
params ["_target", ["_player", objNull], ["_radius", 30]];

// 1. Check if the radio is even playing anything
private _currentTrack = _target getVariable ["UKSFTA_CurrentTrack", ""];
if (_currentTrack == "") exitWith {
    hint "The radio isn't playing anything to broadcast!";
};

// 2. Find nearby speaker objects
private _speakerClasses = ["Land_Loudspeakers_F", "Land_PublicAddressSystem_F", "Land_Speaker_F"];
private _nearbySpeakers = nearestObjects [_target, _speakerClasses, _radius];

// Remove the source radio from the list if it happens to be in the classes
_nearbySpeakers = _nearbySpeakers - [_target];

if (_nearbySpeakers isEqualTo []) exitWith {
    hint "No speakers found within range.";
};

// 3. Tell each speaker to start playing
{
    // Pass the track name and a standard volume to the speaker play logic
    [_x, 50, [[_currentTrack, 0]]] remoteExec ["UKSFTA_Music_fnc_playPlaylist", 0];
} forEach _nearbySpeakers;

hint format ["Broadcasting to %1 speakers.", count _nearbySpeakers];
