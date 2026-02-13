/*
 * Author: Jonpas
 * Sets current radio volume.
 *
 * Arguments:
 * 0: Volume <NUMBER>
 * 1: Vehicle <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [1, vehicle] call tac_radios_fnc_changeVolume;
 *
 * Public: No
 */

params ["_volume", "_vehicle"];

_vehicle setVariable ["radio_cba_Volume", _volume];
