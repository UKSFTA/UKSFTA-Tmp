/*
 * Author: DaC, Jonpas
 * Attaches a radio to a vehicle and starts playing the selected track on it.
 *
 * Arguments:
 * 0: Vehicle <OBJECT>
 * 1: Music Track <STRING>
 *
 * Return Value:
 * None
 *
 * Example:
 * [vehicle, player] call tac_radios_fnc_playRadio;
 *
 * Public: No
 */

params ["_vehicle", "_track"];

private _volume = _vehicle getVariable ["radio_cba_Volume", 1];

if (_volume != 1) then {
    private _volumeText = ["_quiet", "_loud"] select (_volume == 2);
    _track = [_track, _volumeText] joinString "";
};



// Create and Attach the radio object to the helicopter
private _radio = "Sign_Sphere10cm_F" createVehicle position _vehicle; // Non-collidable
_radio attachTo [_vehicle, [0, 0, 0]];

// Make the radio object invisible (MP and SP support)
[ace_common_fnc_hideObjectGlobal, [_radio, true]] call CBA_fnc_serverEvent; // hideObjectGlobal must be executed on server

// Set Variable for menu conditions
_vehicle setVariable ["radio_cba_playingRadio", _radio, true];

// Star playing music on radio object
["radio_cba_play", [_radio, _track]] call CBA_fnc_globalEvent;
