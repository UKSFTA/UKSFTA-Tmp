class CfgPatches {
    class ballistic_impact {
        units[] = {};
        weapons[] = {};
        requiredVersion = 0.1;
        requiredAddons[] = {};
        version = "1.1";
        author = "UKSF Taskforce Alpha";
    };
};

class CfgFunctions {
    class ballistic_impact {
        class ballistic_impact {
            class main {
                file = "z\uksfta\addons\ballistic_impact\functions\fn_main.sqf"; // Point to the script file
            };
            class fx_blood {
                file = "z\uksfta\addons\ballistic_impact\functions\fn_fx_blood.sqf";
                preInit = 1;
            };
            class fx_headgear {
                file = "z\uksfta\addons\ballistic_impact\functions\fn_fx_headgear.sqf";
                preInit = 1;
            };
            class fx_hmd {
                file = "z\uksfta\addons\ballistic_impact\functions\fn_fx_hmd.sqf";
                preInit = 1;
            };
            class fx_other {
                file = "z\uksfta\addons\ballistic_impact\functions\fn_fx_other.sqf";
                preInit = 1;
            };
            class cba_options {
                file = "z\uksfta\addons\ballistic_impact\functions\fn_cba_options.sqf";
                preInit = 1;
            };
            class getBallisticVariables {
                file = "z\uksfta\addons\ballistic_impact\functions\fnc_getBallisticVariables.sqf";
            };
        };
    };
};

class CfgLights {
    class bulletexplo {
        diffuse[] = {1, 0.6, 0.4};
        color[] = {1, 0.6, 0.4};
        ambient[] = {0, 0, 0, 0};
        brightness = 10;
        size = 1;
        intensity = 10000;
        drawLight = 0;
        blinking = 1;
        class Attenuation {
            start = 0;
            constant = 0;
            linear = 0;
            quadratic = 2.2;
            hardLimitStart = 500;
            hardLimitEnd = 1000;
        };
        position[] = {0, 3.5, 0};
    };
    class bulletexplo2 {
        diffuse[] = {1, 0.5, 0.4};
        color[] = {1, 0.6, 0.4};
        ambient[] = {0, 0, 0, 0};
        brightness = 2;
        size = 1;
        intensity = 1000;
        drawLight = 0;
        blinking = 1;
        class Attenuation {
            start = 0;
            constant = 0;
            linear = 0;
            quadratic = 2.2;
            hardLimitStart = 500;
            hardLimitEnd = 1000;
        };
        position[] = {0, 3.5, 0};
    };
};

class CfgSounds {
    sounds[] = {};
    class headgearSfx01
    {
        name = "hs1";
        sound[] = {"z\uksfta\addons\ballistic_impact\sounds\headgear1.wav", 1, 1, 100};
        titles[] = {{}};
    };
    class headgearSfx02
    {
        name = "hs2";
        sound[] = {"z\uksfta\addons\ballistic_impact\sounds\headgear2.wav", 1, 1, 100};
        titles[] = {{}};
    };
    class headgearSfx03
    {
        name = "hs3";
        sound[] = {"z\uksfta\addons\ballistic_impact\sounds\headgear3.wav", 1, 1, 100};
        titles[] = {{}};
    };
    class headgearSfx04
    {
        name = "hs4";
        sound[] = {"z\uksfta\addons\ballistic_impact\sounds\headgear4.wav", 1, 1, 100};
        titles[] = {{}};
    };
    class headgearSfx05
    {
        name = "hs5";
        sound[] = {"z\uksfta\addons\ballistic_impact\sounds\headgear5.wav", 1, 1, 100};
        titles[] = {{}};
    };
    class headgearSfx06
    {
        name = "hs6";
        sound[] = {"z\uksfta\addons\ballistic_impact\sounds\headgear6.wav", 1, 1, 100};
        titles[] = {{}};
    };
    class headgearSfx07
    {
        name = "hs7";
        sound[] = {"z\uksfta\addons\ballistic_impact\sounds\headgear7.wav", 1, 1, 100};
        titles[] = {{}};
    };
    class headgearSfx08
    {
        name = "hs8";
        sound[] = {"z\uksfta\addons\ballistic_impact\sounds\headgear8.wav", 1, 1, 100};
        titles[] = {{}};
    };
    class headshotPumpkinSfx01
    {
        name = "hsp1";
        sound[] = {"z\uksfta\addons\ballistic_impact\sounds\headshot_pumpkin01.wav", 1, 1, 100};
        titles[] = {{}};
    };
    class headshotPumpkinSfx02
    {
        name = "hsp2";
        sound[] = {"z\uksfta\addons\ballistic_impact\sounds\headshot_pumpkin02.wav", 1, 1, 100};
        titles[] = {{}};
    };
    class headshotPumpkinSfx03
    {
        name = "hsp3";
        sound[] = {"z\uksfta\addons\ballistic_impact\sounds\headshot_pumpkin03.wav", 1, 1, 100};
        titles[] = {{}};
    };
    class headshotPumpkinSfx04
    {
        name = "hsp4";
        sound[] = {"z\uksfta\addons\ballistic_impact\sounds\headshot_pumpkin04.wav", 1, 1, 100};
        titles[] = {{}};
    };
    class headshotPumpkinSfx05
    {
        name = "hsp5";
        sound[] = {"z\uksfta\addons\ballistic_impact\sounds\headshot_pumpkin05.wav", 1, 1, 100};
        titles[] = {{}};
    };
    class headshotPumpkinSfx06
    {
        name = "hsp6";
        sound[] = {"z\uksfta\addons\ballistic_impact\sounds\headshot_pumpkin06.wav", 1, 1, 100};
        titles[] = {{}};
    };
    class headshotPumpkinSfx07
    {
        name = "hsp7";
        sound[] = {"z\uksfta\addons\ballistic_impact\sounds\headshot_pumpkin07.wav", 1, 1, 100};
        titles[] = {{}};
    };
    class headshotPumpkinSfx08
    {
        name = "hsp8";
        sound[] = {"z\uksfta\addons\ballistic_impact\sounds\headshot_pumpkin08.wav", 1, 1, 100};
        titles[] = {{}};
    };
    class headshotPumpkinSfx09
    {
        name = "hsp9";
        sound[] = {"z\uksfta\addons\ballistic_impact\sounds\headshot_pumpkin09.wav", 1, 1, 100};
        titles[] = {{}};
    };
    class nvgBreakSFX01
    {
        name = "nvg1";
        sound[] = {"z\uksfta\addons\ballistic_impact\sounds\nvgbreak1.wav", 1, 1, 100};
        titles[] = {{}};
    };
    class nvgBreakSFX02
    {
        name = "nvg2";
        sound[] = {"z\uksfta\addons\ballistic_impact\sounds\nvgbreak2.wav", 1, 1, 100};
        titles[] = {{}};
    };
    class nvgBreakSFX03
    {
        name = "nvg3";
        sound[] = {"z\uksfta\addons\ballistic_impact\sounds\nvgbreak3.wav", 1, 1, 100};
        titles[] = {{}};
    };
    class nvgBreakSFX04
    {
        name = "nvg4";
        sound[] = {"z\uksfta\addons\ballistic_impact\sounds\nvgbreak4.wav", 1, 1, 100};
        titles[] = {{}};
    };
    class nvgBreakSFX05
    {
        name = "nvg5";
        sound[] = {"z\uksfta\addons\ballistic_impact\sounds\nvgbreak5.wav", 1, 1, 100};
        titles[] = {{}};
    };
    class helmetHitSFX01
    {
        name = "hhit1";
        sound[] = {"z\uksfta\addons\ballistic_impact\sounds\raw_headshot1.wav", 1, 1, 100};
        titles[] = {{}};
    };
    class helmetHitSFX02
    {
        name = "hhit2";
        sound[] = {"z\uksfta\addons\ballistic_impact\sounds\raw_headshot2.wav", 1, 1, 100};
        titles[] = {{}};
    };
    class helmetHitSFX03
    {
        name = "hhit3";
        sound[] = {"z\uksfta\addons\ballistic_impact\sounds\raw_headshot3.wav", 1, 1, 100};
        titles[] = {{}};
    };
    class helmetHitSFX04
    {
        name = "hhit4";
        sound[] = {"z\uksfta\addons\ballistic_impact\sounds\raw_headshot4.wav", 1, 1, 100};
        titles[] = {{}};
    };
    class helmetHitSFX05
    {
        name = "hhit5";
        sound[] = {"z\uksfta\addons\ballistic_impact\sounds\raw_headshot5.wav", 1, 1, 100};
        titles[] = {{}};
    };
};

class CfgVehicles {
    class Land;
    class Man: Land {
        class EventHandlers;
    };
    class CAManBase: Man {
        class EventHandlers: EventHandlers {
            class ballistic_impact {
                init = "_this execVM 'z\uksfta\addons\ballistic_impact\functions\fn_init.sqf'";
            };
        };
    };
};
