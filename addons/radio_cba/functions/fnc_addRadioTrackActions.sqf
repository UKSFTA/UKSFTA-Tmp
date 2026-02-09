
/*
 * Author: Jonpas
 * Adds radio tracks actions.
 *
 * Arguments:
 * 0: Vehicle <OBJECT>
 *
 * Return Value:
 * Children Actions <ARRAY>
 *
 * Example:
 * [vehicle] call tac_radios_fnc_addRadioTrackActions;
 *
 * Public: No
 */

params ["_vehicle"];

private _actions = [];
{
    _actions pushBack
    (
        [
            format ["RadioTrack%1", _forEachIndex],
            getText (configFile >> "CfgSounds" >> _x >> "name") splitString "_" joinString " ",
            "",
            {(_this select 2) call radio_cba_fnc_playRadio},
            {true},
            {},
            [_vehicle, _x]
        ] call ace_interact_menu_fnc_createAction
    );
} forEach (call radio_cba_fnc_getRadioTracks);

_actions
