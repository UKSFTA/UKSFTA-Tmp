params [
        "_unit",
        "_selection",
        "_damage",
        "_source",
        "_projectile",
        "_hitIndex",
        "_instigator",
        "_hitPoint"
    ];
    diag_log format ["[UKSFTA Ballistic Impact] fnc_ballisticImpact_main called. Unit: %1, Selection: %2, Damage: %3, Projectile: %4", _unit, _selection, _damage, _projectile];    private _isAceMedicalActive = missionNamespace getVariable ["ace_medical_fnc_setDamage", objNull] isNotEqualTo objNull;

    private _ballisticVariables = [_unit, _instigator, _projectile] call Uksfta_BallisticImpact_fnc_getBallisticVariables;
    private _getGlasses = _ballisticVariables select 0;
    private _getHeadMountedDisplay = _ballisticVariables select 1;
    private _getHeadgear = _ballisticVariables select 2;
    private _headgearProtection = _ballisticVariables select 3;
    private _getInstigatorDirection = _ballisticVariables select 4;
    private _velocityVector = _ballisticVariables select 5;
    private _projectileCaliber = _ballisticVariables select 6;
    private _projectileForce = _ballisticVariables select 7;
    private _hmdParticleEffects = _ballisticVariables select 8;
    private _hmdSoundEffects = _ballisticVariables select 9;
    private _helmetParticleEffects = _ballisticVariables select 10;
    private _helmetPenetrateSoundEffects = _ballisticVariables select 11;
    private _helmetHitSoundEffects = _ballisticVariables select 12;
    private _headshotFleshEffects = _ballisticVariables select 13;
    private _goreParticleEffects = _ballisticVariables select 14;
    private _bloodParticleEffects = _ballisticVariables select 15;
    private _artisticRemoval = _ballisticVariables select 16;
    private _caliberLowest = _ballisticVariables select 17;
    private _caliberHighest = _ballisticVariables select 18;
    private _minProtectionLevel = _ballisticVariables select 19;
    private _maxProtectionLevel = _ballisticVariables select 20;

    diag_log format ["[UKSFTA Ballistic Impact] ACE Active: %1", _isAceMedicalActive];

    if (not _isAceMedicalActive) then {
        if (_hitIndex != 2 || _damage < 0.9) exitWith {};
        if(_getGlasses != "") then
        {
            removeGoggles _unit;
            _unit remoteExecCall ["fnc_brokenGlassParticles"];
            _unit remoteExecCall ["fnc_smallHelmetParts"];
        };
        if (_getHeadMountedDisplay != "") then
        {
            _unit unassignItem _getHeadMountedDisplay;
            _unit removeItem _getHeadMountedDisplay;
            playSound3D [format ["%1",_hmdSoundEffects], _unit, false, getPosASL _unit, 0.8, 1, 70];
            [_unit, _velocityVector] remoteExecCall ["fnc_cheesyDestruct"];
            _unit remoteExecCall [_hmdParticleEffects];
            _unit remoteExecCall ["fnc_blackSmoke"];
        };
        if (_headgearProtection != 0) then
        {
            diag_log format ["[UKSFTA Ballistic Impact] Non-ACE: Headgear Protection: %1, Projectile Caliber: %2, Projectile Force: %3", _headgearProtection, _projectileCaliber, _projectileForce];
            if ( floor _projectileForce > _headgearProtection && _projectileCaliber >= 0.1) then
            {
                [_unit, _velocityVector] remoteExecCall [_helmetParticleEffects];
                _unit remoteExecCall [_bloodParticleEffects];
                playSound3D [format ["%1",_helmetPenetrateSoundEffects], _unit, false, getPosASL _unit, 2, 1, 80];

                if (_projectileCaliber >= _caliberHighest) then
                {
                    if (!var_DisableHelmetDeletion) then {
                        _unit remoteExecCall [_goreParticleEffects];
                        _unit remoteExecCall ["fnc_helmetTrashed"];
                        removeHeadgear _unit;
                    };
                }
                else
                {
                    if (!var_DisableHelmetDeletion) then {
                        _unit remoteExecCall [_goreParticleEffects];
                        [_unit, _velocityVector] remoteExecCall [_artisticRemoval];
                        removeHeadgear _unit
                    };
                };
            }
            else
            {
                _unit remoteExecCall ["fnc_smallHelmetParts"];
                playSound3D [format ["%1",_helmetHitSoundEffects], _unit, false, getPosASL _unit, 3, 1, 50];
            };
        }
        else
        {
            if (!alive _unit) exitWith{};
            if (!var_DisableHelmetDeletion) then {
                [_unit, _velocityVector] remoteExecCall ["fnc_FlyOff"];
                playSound3D [format ["%1",_headshotFleshEffects], _unit, false, getPosASL _unit, 1, 1, 70];
                _unit remoteExecCall [_bloodParticleEffects];
                removeHeadgear _unit;
            };
        };
    } else {
        // ACE Medical is active
        if (_hitIndex != 2 || _damage < 0.9) exitWith {}; // Still filter non-head hits or low damage

        // Check for headgear and HMD removal, same as non-ACE
        if(_getGlasses != "") then
        {
            removeGoggles _unit;
            _unit remoteExecCall ["fnc_brokenGlassParticles"];
            _unit remoteExecCall ["fnc_smallHelmetParts"];
        };
        if (_getHeadMountedDisplay != "") then
        {
            _unit unassignItem _getHeadMountedDisplay;
            _unit removeItem _getHeadMountedDisplay;
            playSound3D [format ["%1",_hmdSoundEffects], _unit, false, getPosASL _unit, 0.8, 1, 70];
            [_unit, _velocityVector] remoteExecCall ["fnc_cheesyDestruct"];
            _unit remoteExecCall [_hmdParticleEffects];
            _unit remoteExecCall ["fnc_blackSmoke"];
        };

        // ACE-specific penetration inference
        // If damage is very high to the head (ACE has processed it and it's a critical hit)
        diag_log format ["[UKSFTA Ballistic Impact] ACE: Damage to head: %1, Disable Helmet Deletion: %2", _damage, var_DisableHelmetDeletion];
        if (_damage >= 0.95) then { // Threshold for critical head hit
            // Assume penetration for high damage values
            [_unit, _velocityVector] remoteExecCall [_helmetParticleEffects];
            _unit remoteExecCall [_bloodParticleEffects];
            playSound3D [format ["%1",_helmetPenetrateSoundEffects], _unit, false, getPosASL _unit, 2, 1, 80];

            // Distinguish between severe and extreme damage (e.g., instant kill vs incapacitation)
            if (_damage >= 1.0) then { // Assuming _damage == 1.0 means instant kill / extreme trauma
                if (!var_DisableHelmetDeletion) then {
                    _unit remoteExecCall [_goreParticleEffects];
                    _unit remoteExecCall ["fnc_helmetTrashed"];
                    removeHeadgear _unit;
                };
            } else { // High damage, but perhaps not instant lethal based on ACE
                if (!var_DisableHelmetDeletion) then {
                    _unit remoteExecCall [_goreParticleEffects];
                    [_unit, _velocityVector] remoteExecCall [_artisticRemoval];
                    removeHeadgear _unit;
                };
            };
        } else { // This else now captures cases where _damage < 0.95
            if (_damage > 0) then { // If _damage is > 0 but not critical, consider it a hit with no penetration
                _unit remoteExecCall ["fnc_smallHelmetParts"];
                playSound3D [format ["%1",_helmetHitSoundEffects], _unit, false, getPosASL _unit, 3, 1, 50];
            };
        };
    };
