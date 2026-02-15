class CfgPatches
{
    class UKSFTA_Objects
    {
        version = "1.0";
        units[] = {"vol10","vol50","vol100","vol10","vol50","vol100","vol10","vol50","vol100","vol10","vol50","vol100","vol10","vol50","vol100","vol10","vol50","vol100"};
        weapons[] = {};
        requiredVersion = 1.0;
        requiredAddons[] = { "A3_Structures_F", "ace_interact_menu" };
    };
};

class CfgEditorCategories
{
    class EdCat_UKSFTA
    {
        displayName = "UKSF";
    };
};

class CfgEditorSubcategories
{
    class Sub_EdCat_UKSFTA_Misc
    {
        displayName = "Misc";
    };
};

class CfgVehicles
{
    class Land_FMradio_F;
    class UKSFTA_Radio: Land_FMradio_F
    {
        displayName = "[UKSF] Music Player";
        editorCategory = "EdCat_UKSFTA";
        editorSubcategory = "Sub_EdCat_UKSFTA_Misc";
        scope = 2;
        scopeCurator = 2;

        class ACE_Actions
        {
            class radioPlaylists
            {
                displayName = "Radio Menu";
                distance = 2;

                class stopPlaylist
                {
                    displayName = "Stop All Music";
                    distance = 2;
                    condition = "(_target getVariable ['radioOn', false])";
                    statement = "[_target] call UKSFTA_Music_fnc_radioOff;";
                    exceptions[] = {};
                };

                class localMusic
                {
                    displayName = "Local Playlists";
                    distance = 2;
                    condition = "true";

                    class rockPlaylist
                    {
                        displayName = "Rock";
                        class vol10 { displayName = "Quiet"; statement = "[_target, 10] call UKSFTA_Music_fnc_mightyRockPlaylist"; };
                        class vol50 { displayName = "Moderate"; statement = "[_target, 50] call UKSFTA_Music_fnc_mightyRockPlaylist"; };
                        class vol100 { displayName = "Loud"; statement = "[_target, 100] call UKSFTA_Music_fnc_mightyRockPlaylist"; };
                    };

                    class chillPlaylist
                    {
                        displayName = "Chill";
                        class vol10 { displayName = "Quiet"; statement = "[_target, 10] call UKSFTA_Music_fnc_mightyChillPlaylist"; };
                        class vol50 { displayName = "Moderate"; statement = "[_target, 50] call UKSFTA_Music_fnc_mightyChillPlaylist"; };
                        class vol100 { displayName = "Loud"; statement = "[_target, 100] call UKSFTA_Music_fnc_mightyChillPlaylist"; };
                    };

                    class veryChillPlaylist
                    {
                        displayName = "Very Chill";
                        class vol10 { displayName = "Quiet"; statement = "[_target, 10] call UKSFTA_Music_fnc_mightyVeryChillPlaylist"; };
                        class vol50 { displayName = "Moderate"; statement = "[_target, 50] call UKSFTA_Music_fnc_mightyVeryChillPlaylist"; };
                        class vol100 { displayName = "Loud"; statement = "[_target, 100] call UKSFTA_Music_fnc_mightyVeryChillPlaylist"; };
                    };

                    class electroPlaylist
                    {
                        displayName = "Electronic";
                        class vol10 { displayName = "Quiet"; statement = "[_target, 10] call UKSFTA_Music_fnc_mightyElectroPlaylist"; };
                        class vol50 { displayName = "Moderate"; statement = "[_target, 50] call UKSFTA_Music_fnc_mightyElectroPlaylist"; };
                        class vol100 { displayName = "Loud"; statement = "[_target, 100] call UKSFTA_Music_fnc_mightyElectroPlaylist"; };
                    };

                    class serePlaylist
                    {
                        displayName = "SERE";
                        class vol10 { displayName = "Quiet"; statement = "[_target, 10] call UKSFTA_Music_fnc_mightySEREPlaylist"; };
                        class vol50 { displayName = "Moderate"; statement = "[_target, 50] call UKSFTA_Music_fnc_mightySEREPlaylist"; };
                        class vol100 { displayName = "Loud"; statement = "[_target, 100] call UKSFTA_Music_fnc_mightySEREPlaylist"; };
                    };

                    class customPlaylist
                    {
                        displayName = "Custom";
                        class vol10 { displayName = "Quiet"; statement = "[_target, 10] call UKSFTA_Music_fnc_mightyCustomPlaylist"; };
                        class vol50 { displayName = "Moderate"; statement = "[_target, 50] call UKSFTA_Music_fnc_mightyCustomPlaylist"; };
                        class vol100 { displayName = "Loud"; statement = "[_target, 100] call UKSFTA_Music_fnc_mightyCustomPlaylist"; };
                    };
                };
                class broadcastSpeakers
                {
                    displayName = "Broadcast to Nearby Speakers";
                    distance = 2;
                    condition = "_target call UKSFTA_Music_fnc_broadcastSpeakers";
                    exceptions[] = {};

                    class radius10
                    {
                        displayName = "10 meters";
                        distance = 2;
                        statement = "[_target, _player, 10] call UKSFTA_Music_fnc_broadcastSpeakers;";
                    };
                    class radius30
                    {
                        displayName = "30 meters";
                        distance = 2;
                        statement = "[_target, _player, 30] call UKSFTA_Music_fnc_broadcastSpeakers;";
                    };
                    class radius50
                    {
                        displayName = "50 meters";
                        distance = 2;
                        statement = "[_target, _player, 50] call UKSFTA_Music_fnc_broadcastSpeakers;";
                    };
                };
            };
        };
    };
};

class CfgFunctions
{
    class UKSFTA_Music
    {
        tag = "UKSFTA_Music";
        class functions
        {
            class radioOff { file = "z\uksfta\addons\radio\data\scripts\radioOff.sqf"; };
            class radioOn { file = "z\uksfta\addons\radio\data\scripts\radioOn.sqf"; };
            class playPlaylist { file = "z\uksfta\addons\radio\data\scripts\playPlaylist.sqf"; };
            class broadcastSpeakers { file = "z\uksfta\addons\radio\data\scripts\broadcastSpeakers.sqf"; };
            class mightyRockPlaylist { file = "z\uksfta\addons\radio\data\scripts\playlists\mightyRockPlaylist.sqf"; };
            class mightyChillPlaylist { file = "z\uksfta\addons\radio\data\scripts\playlists\mightyChillPlaylist.sqf"; };
            class mightyVeryChillPlaylist { file = "z\uksfta\addons\radio\data\scripts\playlists\mightyVeryChillPlaylist.sqf"; };
            class mightyElectroPlaylist { file = "z\uksfta\addons\radio\data\scripts\playlists\mightyElectroPlaylist.sqf"; };
            class mightySEREPlaylist { file = "z\uksfta\addons\radio\data\scripts\playlists\mightySEREPlaylist.sqf"; };
            class mightyCustomPlaylist { file = "z\uksfta\addons\radio\data\scripts\playlists\mightyCustomPlaylist.sqf"; };
        };
    };
};
class CfgSounds
{
    class cvlteHappy
    {
        sound[]= { "z\uksfta\addons\radio\data\music\happy.ogg", 3.1622777, 1, 1000 };
        titles[]={};
    };
    class animalRepudiation
    {
        sound[]= { "z\uksfta\addons\radio\data\music\repudiation.ogg", 3.1622777, 1, 1000 };
        titles[]={};
    };
    class mvrksReckoning
    {
        sound[]= { "z\uksfta\addons\radio\data\music\reckoning.ogg", 3.1622777, 1, 1000 };
        titles[]={};
    };
    class mvrksScars
    {
        sound[]= { "z\uksfta\addons\radio\data\music\scars.ogg", 3.1622777, 1, 1000 };
        titles[]={};
    };
    class paramorePressure
    {
        sound[]= { "z\uksfta\addons\radio\data\music\pressure.ogg", 3.1622777, 1, 1000 };
        titles[]={};
    };
    class linkinNumb
    {
        sound[]= { "z\uksfta\addons\radio\data\music\numb.ogg", 3.1622777, 1, 1000 };
        titles[]={};
    };
    class graceInfrared
    {
        sound[]= { "z\uksfta\addons\radio\data\music\infrared.ogg", 3.1622777, 1, 1000 };
        titles[]={};
    };
    class fooEverlong
    {
        sound[]= { "z\uksfta\addons\radio\data\music\everlong.ogg", 3.1622777, 1, 1000 };
        titles[]={};
    };
    class manaStrangers
    {
        sound[]= { "z\uksfta\addons\radio\data\music\strangers.ogg", 3.1622777, 1, 1000 };
        titles[]={};
    };
    class brakenceVenus
    {
        sound[]= { "z\uksfta\addons\radio\data\music\venus.ogg", 3.1622777, 1, 1000 };
        titles[]={};
    };
    class xaptioxSoup
    {
        sound[]= { "z\uksfta\addons\radio\data\music\soup.ogg", 3.1622777, 1, 1000 };
        titles[]={};
    };
    class lexieMagic
    {
        sound[]= { "z\uksfta\addons\radio\data\music\magician.ogg", 3.1622777, 1, 1000 };
        titles[]={};
    };
    class lvtherMagic
    {
        sound[]= { "z\uksfta\addons\radio\data\music\someKindOfMagic.ogg", 3.1622777, 1, 1000 };
        titles[]={};
    };
    class vicetoneNevada
    {
        sound[]= { "z\uksfta\addons\radio\data\music\nevada.ogg", 3.1622777, 1, 1000 };
        titles[]={};
    };
    class moRighteous
    {
        sound[]= { "z\uksfta\addons\radio\data\music\righteous.ogg", 3.1622777, 1, 1000 };
        titles[]={};
    };
    class vierreMoment
    {
        sound[]= { "z\uksfta\addons\radio\data\music\moment.ogg", 3.1622777, 1, 1000 };
        titles[]={};
    };
    class takayanEternal
    {
        sound[]= { "z\uksfta\addons\radio\data\music\eternal.ogg", 3.1622777, 1, 1000 };
        titles[]={};
    };
    class lieuBack2u
    {
        sound[]= { "z\uksfta\addons\radio\data\music\back2u.ogg", 3.1622777, 1, 1000 };
        titles[]={};
    };
    class lieuGetOut
    {
        sound[]= { "z\uksfta\addons\radio\data\music\getOut.ogg", 3.1622777, 1, 1000 };
        titles[]={};
    };
    class avitBreathe
    {
        sound[]= { "z\uksfta\addons\radio\data\music\breathe.ogg", 3.1622777, 1, 1000 };
        titles[]={};
    };
    class landingStill
    {
        sound[]= { "z\uksfta\addons\radio\data\music\still.ogg", 3.1622777, 1, 1000 };
        titles[]={};
    };
    class keshi2Soon
    {
        sound[]= { "z\uksfta\addons\radio\data\music\2soon.ogg", 3.1622777, 1, 1000 };
        titles[]={};
    };
    class reservNewEdition
    {
        sound[]= { "z\uksfta\addons\radio\data\music\newEdition.ogg", 3.1622777, 1, 1000 };
        titles[]={};
    };
    class jadesCrashed
    {
        sound[]= { "z\uksfta\addons\radio\data\music\crashed.ogg", 3.1622777, 1, 1000 };
        titles[]={};
    };
    class jadenParis
    {
        sound[]= { "z\uksfta\addons\radio\data\music\summertime.ogg", 3.1622777, 1, 1000 };
        titles[]={};
    };
    class glaiveLastThing
    {
        sound[]= { "z\uksfta\addons\radio\data\music\lastThing.ogg", 3.1622777, 1, 1000 };
        titles[]={};
    };
    class gatsbyLetMeIn
    {
        sound[]= { "z\uksfta\addons\radio\data\music\letMeIn.ogg", 3.1622777, 1, 1000 };
        titles[]={};
    };
    class giantsRiot
    {
        sound[]= { "z\uksfta\addons\radio\data\music\shesRiot.ogg", 3.1622777, 1, 1000 };
        titles[]={};
    };
    class radioWolf
    {
        sound[]= { "z\uksfta\addons\radio\data\music\wolfLikeMe.ogg", 3.1622777, 1, 1000 };
        titles[]={};
    };
    class graceOutline
    {
        sound[]= { "z\uksfta\addons\radio\data\music\chalkOutline.ogg", 3.1622777, 1, 1000 };
        titles[]={};
    };
    class girlsEscape
    {
        sound[]= { "z\uksfta\addons\radio\data\music\theGreatEscape.ogg", 3.1622777, 1, 1000 };
        titles[]={};
    };
    class hideaSwallowed
    {
        sound[]= { "z\uksfta\addons\radio\data\music\swallowed.ogg", 3.1622777, 1, 1000 };
        titles[]={};
    };
    class weepIris
    {
        sound[]= { "z\uksfta\addons\radio\data\music\iris.ogg", 3.1622777, 1, 1000 };
        titles[]={};
    };
    class tailsFloating
    {
        sound[]= { "z\uksfta\addons\radio\data\music\floating.ogg", 3.1622777, 1, 1000 };
        titles[]={};
    };
    class kerriWestmount
    {
        sound[]= { "z\uksfta\addons\radio\data\music\westmount.ogg", 3.1622777, 1, 1000 };
        titles[]={};
    };
    class matchesPeroxide
    {
        sound[]= { "z\uksfta\addons\radio\data\music\peroxide.ogg", 3.1622777, 1, 1000 };
        titles[]={};
    };
    class lucyAlcoholic
    {
        sound[]= { "z\uksfta\addons\radio\data\music\alcoholic.ogg", 3.1622777, 1, 1000 };
        titles[]={};
    };
    class potsuBe
    {
        sound[]= { "z\uksfta\addons\radio\data\music\be.ogg", 3.1622777, 1, 1000 };
        titles[]={};
    };
    class keaganClueless
    {
        sound[]= { "z\uksfta\addons\radio\data\music\clueless.ogg", 3.1622777, 1, 1000 };
        titles[]={};
    };
    class salesForever
    {
        sound[]= { "z\uksfta\addons\radio\data\music\forever.ogg", 3.1622777, 1, 1000 };
        titles[]={};
    };
    class dylisHeart
    {
        sound[]= { "z\uksfta\addons\radio\data\music\ripMyHeartOut.ogg", 3.1622777, 1, 1000 };
        titles[]={};
    };
    class jojiNitrous
    {
        sound[]= { "z\uksfta\addons\radio\data\music\nitrous.ogg", 3.1622777, 1, 1000 };
        titles[]={};
    };
    class jojiAfterthought
    {
        sound[]= { "z\uksfta\addons\radio\data\music\afterthought.ogg", 3.1622777, 1, 1000 };
        titles[]={};
    };
    class sewerLR7
    {
        sound[]= { "z\uksfta\addons\radio\data\music\lr7.ogg", 3.1622777, 1, 1000 };
        titles[]={};
    };
    class swellSorry
    {
        sound[]= { "z\uksfta\addons\radio\data\music\sorry.ogg", 3.1622777, 1, 1000 };
        titles[]={};
    };
    class jojiRight
    {
        sound[]= { "z\uksfta\addons\radio\data\music\yeahRight.ogg", 3.1622777, 1, 1000 };
        titles[]={};
    };
    class slenderAmnesia
    {
        sound[]= { "z\uksfta\addons\radio\data\music\amnesia.ogg", 3.1622777, 1, 1000 };
        titles[]={};
    };
    class Boots
    {
        sound[]= { "z\uksfta\addons\radio\data\music\Boots.ogg", 3.1622777, 1, 1000 };
        titles[]={};
    };
    class Yoko
    {
        sound[]= { "z\uksfta\addons\radio\data\music\Yoko.ogg", 3.1622777, 1, 1000 };
        titles[]={};
    };
    class sintotellalie
    {
        sound[]= { "z\uksfta\addons\radio\data\music\sintotellalie.ogg", 3.1622777, 1, 1000 };
        titles[]={};
    };
};
