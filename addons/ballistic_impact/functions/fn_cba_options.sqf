var_AllowedCaliber = profileNamespace getVariable ["var_AllowedCaliber", 1.6]; //only allow designated marksmen rifles, heavy mgs and such remove headgear
var_onoffswitch = profileNamespace getVariable ["var_onoffswitch", true];
var_debug = profileNamespace getVariable ["var_debug", false];

diag_log "[UKSFTA Ballistic Impact] fn_cba_options.sqf preInit executed.";

if(isClass(configFile >> "CfgPatches" >> "cba_settings")) then
{
    [] spawn
    {
        [
            "var_onoffswitch", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
            "CHECKBOX", // setting type
            ["Damage simulation","Enable headshot mechanics."], // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
            "Ballistic Impact", // Pretty name of the category where the setting can be found. Can be stringtable entry.
            true, // default
            true, // "global" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
            {
            } // function that will be executed once on mission start and every time the setting is changed.
        ] call CBA_Settings_fnc_init;

        [
            "var_debug", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
            "CHECKBOX", // setting type
            ["Debug","Enable debug info."], // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
            "Ballistic Impact", // Pretty name of the category where the setting can be found. Can be stringtable entry.
            false, // default
            false, // "global" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
            {
            } // function that will be executed once on mission start and every time the setting is changed.
        ] call CBA_Settings_fnc_init;

        [
            "var_AllowedCaliber", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
            "SLIDER", // setting type
            ["Required caliber to initialise","Caliber in cfgAmmo. Only designated marksmen rifles, heavy MGs can remove headgear by mod default."], // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
            "Ballistic Impact", // Pretty name of the category where the setting can be found. Can be stringtable entry.
            [0.8,2.4,1.6,1], // default
            true, // "global" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
            {
            } // function that will be executed once on mission start and every time the setting is changed.
        ] call CBA_Settings_fnc_init;

        [
            "var_DisableHelmetDeletion", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
            "CHECKBOX", // setting type
            ["Disable Helmet Deletion","If enabled, helmets will not be deleted on critical head hits."], // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
            "Ballistic Impact", // Pretty name of the category where the setting can be found. Can be stringtable entry.
            false, // default (helmets are deleted by default)
            true, // "global" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
            {
            } // function that will be executed once on mission start and every time the setting is changed.
        ] call CBA_Settings_fnc_init;
    };
};
