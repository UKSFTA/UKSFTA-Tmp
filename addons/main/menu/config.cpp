////////////////////////////////////////////////////////////////////
//DeRap: config.bin
//Produced from mikero's Dos Tools Dll version 10.04
//https://mikero.bytex.digital/Downloads
//'now' is Tue Dec 16 19:39:51 2025 : 'file' last modified on Sun Oct 12 09:34:42 2025
////////////////////////////////////////////////////////////////////

#define _ARMA_

class CfgPatches
{
    class UKSFTA
    {
        units[] = {};
        weapons[] = {};
        requiredVersion = 0.1;
        requiredAddons[] = {"A3_Data_F_Enoch_Loadorder"};
        author = "Anytature";
        worlds[] = {};
    };
};
class Attributes;
class RscStandardDisplay;
class RscProgress;
class RscStructuredText;
class RscPicture;
class RscButton;
class RscShortcutButton;
class RscButtonMenu;
class RscButtonMenuOK;
class RscButtonMenuCancel;
class RscText;
class RscVignette;
class RscDisplayGetReady;
class RscActiveText;
class RscListBox;
class RscListNBox;
class RscCombo;
class RscXListBox;
class RscHTML;
class RscPictureKeepAspect;
class RscActivePicture;
class RscMapControl;
class RscControlsGroupNoScrollbars;
class RscControlsGroupNoHScrollbars;
class RscFrame;
class RscTitle;
class CA_Title;
class RscDebugConsole;
class RscTrafficLight;
class RscFeedback;
class RscMessageBox;
class RscControlsGroup;
class RscTextCheckbox;
class RscDisplayInventory_DLCTemplate;
class RscEdit;
class RscCheckBox;
class RscIGProgress;
class RscHitZones;
class RscIGUIText;
class RscIGUIValue;
class RscOpticsValue;
class RscOpticsText;
class Scrollbar;
class RscIGUIShortcutButton;
class RscActivePictureKeepAspect;
class RscTree;
class RscXSliderH;
class RscObject;
class ctrlMenu;
class ctrlStaticPicture;
class RscButtonMenuSteam;
class RscButtonTextOnly;
class RscMainMenuSpotlight: RscControlsGroupNoScrollbars
{
    show = 0;
    onLoad = "";
};
class RscDisplayMain: RscStandardDisplay
{
    class controls
    {
        class BackgroundSpotlight: RscPicture
        {
            show = 0;
            onload = "";
        };
        class BackgroundSpotlightLeft: BackgroundSpotlight
        {
            show = 0;
            onload = "";
        };
        class BackgroundSpotlightRight: BackgroundSpotlightLeft
        {
            show = 0;
            onload = "";
        };
        class Spotlight1: RscMainMenuSpotlight
        {
            idc = 1021;
            show = 0;
            onload = "";
        };
        class Spotlight2: RscText
        {
            idc = 1020;
            show = 0;
            onload = "";
        };
        class Spotlight3: RscMainMenuSpotlight
        {
            idc = 1022;
            show = 0;
            onload = "";
        };
        class SpotlightPrev: RscActivePictureKeepAspect
        {
            idc = 1060;
            show = 0;
            onload = "";
        };
        class SpotlightNext: SpotlightPrev
        {
            show = 0;
            onload = "";
        };
        class logo: RscActivePicture
        {
            text = "z\z\z\uksfta\addons\tmp\addons\tmp\addons\menu\assets\icon_ca.paa";
            url = "";
            tooltip = "";
            onButtonClick = "";
            onload = "";
        };
        class logoApex: logo
        {
            show = 0;
            onload = "";
            text = "";
        };
        class infomods: RscControlsGroupNoHScrollbars
        {
            show = 0;
        };
        class infoDLCsOwned: infomods
        {
            show = 1;
        };
        class infoDLCs: infoDLCsOwned
        {
            show = 1;
        };
        class infoNews: infomods
        {
            show = 1;
        };
        class infoVersion: infoNews
        {
            show = 0;
        };
    };
};
class CfgWorlds
{
    class CAWorld;
    class Altis: CAWorld
    {
        cutscenes[] = {"mymainmenu"};
    };
    class Stratis: CAWorld
    {
        cutscenes[] = {"mymainmenu"};
    };
    class Enoch: CAWorld
    {
        cutscenes[] = {"mymainmenu"};
    };
    class hellanmaa: CAWorld
    {
        cutscenes[] = {"mymainmenu"};
    };
    class hellanmaaw: CAWorld
    {
        cutscenes[] = {"mymainmenu"};
    };
    class VR: CAWorld
    {
        cutscenes[] = {"mymainmenu"};
    };
    initWorld = "VR";
    demoWorld = "VR";
};
class CfgMissions
{
    class Cutscenes
    {
        class mymainmenu
        {
            directory = "z\z\z\uksfta\addons\tmp\addons\tmp\addons\menu\mainmenu.vr";
        };
    };
};
