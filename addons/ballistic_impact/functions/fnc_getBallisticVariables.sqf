fnc_getBallisticVariables = {
    params ["_unit", "_instigator", "_projectile"];
    diag_log format ["[UKSFTA Ballistic Impact] fnc_getBallisticVariables called. Unit: %1, Instigator: %2, Projectile: %3", _unit, _instigator, _projectile];

    /// getters and local variables setup
    private _getGlasses = goggles _unit;
    private _getHeadMountedDisplay = hmd _unit;
    private _getHeadgear = headgear _unit;
    private _headgearProtection = getNumber (configFile >> "CfgWeapons" >> _getHeadgear >> "ItemInfo" >> "HitpointsProtectionInfo" >> "Head" >> "armor");

    private _getInstigatorDirection = _instigator weaponDirection (currentWeapon _instigator) vectorMultiply 2 + random 3;
    private _velocityVector = _getInstigatorDirection vectorAdd [-1 + random 2, -1 + random 2, random 5];
    private _projectileCaliber = getNumber (configFile >> "CfgAmmo" >> _projectile >> "caliber");

    /// Formula using values taken from weaponsCfg and ammoCfg to calculate current projectile's potential.
    private _caliberLowest = 0.869565;  // 5.56
    private _caliberHighest = 2.4;  // .408 cheetah of m320 LRR
    private _minProtectionLevel = 4;  // level 1 headgear protection value
    private _maxProtectionLevel = 12;    // level 5

    private _projectileForce =
    linearConversion [
        _caliberLowest,
        _caliberHighest,
        _projectileCaliber,
        _minProtectionLevel,
        _maxProtectionLevel
    ];

    ///    Spark effects upon destruction of head-mounted display.
    private _hmdParticleEffects = selectRandom [
        "fnc_hmdSparks2", "fnc_hmdSparks3",
        "fnc_hmdSparks4", "fnc_hmdSparks6",
        "fnc_hmdSparks7", "fnc_hmdSparks8"
    ];

    ///    Sound effects for destruction of head mounted display.
    private _hmdSoundEffects = selectRandom [
        "z\uksfta\ballistic_impact\sounds\nvgbreak1.wav", "z\uksfta\ballistic_impact\sounds\nvgbreak2.wav",
        "z\uksfta\ballistic_impact\sounds\nvgbreak3.wav", "z\uksfta\ballistic_impact\sounds\nvgbreak4.wav",
        "z\uksfta\ballistic_impact\sounds\nvgbreak5.wav"
    ];

    ///    Spark effects upon helmet penetration
    private _helmetParticleEffects = selectRandom [
        "fnc_helmetSparks1", "fnc_helmetSparks2",
        "fnc_helmetSparks3", "fnc_helmetSparks4"
    ];

    ///    Helmet penetrate sounds
    private _helmetPenetrateSoundEffects = selectRandom [
        "z\uksfta\ballistic_impact\sounds\headgear1.wav", "z\uksfta\ballistic_impact\sounds\headgear2.wav",
        "z\uksfta\ballistic_impact\sounds\headgear3.wav", "z\uksfta\ballistic_impact\sounds\headgear4.wav",
        "z\uksfta\ballistic_impact\sounds\headgear5.wav", "z\uksfta\ballistic_impact\sounds\headgear6.wav",
        "z\uksfta\ballistic_impact\sounds\headgear7.wav", "z\uksfta\ballistic_impact\sounds\headgear8.wav"
    ];

    ///    Helmet hit sounds
    private _helmetHitSoundEffects = selectRandom [
        "z\uksfta\ballistic_impact\sounds\raw_headshot1.wav", "z\uksfta\ballistic_impact\sounds\raw_headshot2.wav",
        "z\uksfta\ballistic_impact\sounds\raw_headshot3.wav", "z\uksfta\ballistic_impact\sounds\raw_headshot4.wav",
        "z\uksfta\ballistic_impact\sounds\raw_headshot5.wav"
    ];

    ///    HS flesh sound
    private _headshotFleshEffects = selectRandom [
        "z\uksfta\ballistic_impact\sounds\headshot_pumpkin01.wav", "z\uksfta\ballistic_impact\sounds\headshot_pumpkin02.wav",
        "z\uksfta\ballistic_impact\sounds\headshot_pumpkin03.wav", "z\uksfta\ballistic_impact\sounds\headshot_pumpkin04.wav",
        "z\uksfta\ballistic_impact\sounds\headshot_pumpkin05.wav", "z\uksfta\ballistic_impact\sounds\headshot_pumpkin06.wav",
        "z\uksfta\ballistic_impact\sounds\headshot_pumpkin07.wav", "z\uksfta\ballistic_impact\sounds\headshot_pumpkin08.wav",
        "z\uksfta\ballistic_impact\sounds\headshot_pumpkin09.wav"
    ];

    ///    Gore particle effects
    private _goreParticleEffects = selectRandom [
        "fnc_brainsBlow",    "fnc_bloodSpit"
    ];

    ///    Blood particle effects
    private _bloodParticleEffects = selectRandom [
        "fnc_bloodSpray2", "fnc_bloodSpray3",
        "fnc_bloodUpNdown"
    ];

    ///    Helmet heavy hit and destruction
    private _artisticRemoval = selectRandom ["fnc_helmetDestroyed", "fnc_FlyOff"];

    [_getGlasses, _getHeadMountedDisplay, _getHeadgear, _headgearProtection, _getInstigatorDirection, _velocityVector, _projectileCaliber, _projectileForce, _hmdParticleEffects, _hmdSoundEffects, _helmetParticleEffects, _helmetPenetrateSoundEffects, _helmetHitSoundEffects, _headshotFleshEffects, _goreParticleEffects, _bloodParticleEffects, _artisticRemoval, _caliberLowest, _caliberHighest, _minProtectionLevel, _maxProtectionLevel]
};
