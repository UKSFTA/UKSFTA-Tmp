class CfgPatches
{
	class UKSFTA_Radio_CBA
	{
		name="[UKSF] Radio (CBA)";
		units[]={ "UKSFTA_Radio" };
		weapons[]={};
		requiredVersion=1.8200001;
		requiredAddons[]=
		{
			"A3_Structures_F", 
			"ace_interact_menu",
			"cba_main"
		};
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
        displayname = "[UKSF] Radio";
        author = "UKSF Taskforce Alpha";
        scope = 2;
        scopeCurator = 2;
        editorCategory = "EdCat_UKSFTA";
        editorSubcategory = "Sub_EdCat_UKSFTA_Misc";
        radio_cba_isRadio = 1;
    };
};
