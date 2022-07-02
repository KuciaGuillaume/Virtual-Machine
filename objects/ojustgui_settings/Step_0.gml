/// @Project by Kucia Guillaume* ///

if (TAG == undefined)
	return;

if (!FIRST_PASS && !FADE_IN) {image_alpha = 2; FIRST_PASS = true; } 

// FADE_IN

if (FADE_IN && image_alpha < 1)
	image_alpha += FADE_POWER * delta_time;
else
	FADE_IN = false;

if (CLOSE && string_count("SETTINGS", WINDOW_TAG)) {
	if (ICON != undefined) {
		DestroyText(ICON.TEXT_CONNECT.TAG);
		DestroyObject(ICON.TAG);
		ICON = undefined;
	}
	if (FIND_SETTING != undefined)
		DestroyTextButton(FIND_SETTING.TAG);
	for (var i = 0; all_settings[i] != undefined; i++)
		DestroyEmptyButton(all_settings[i].TAG);
	DestroyObject(OBJECT_SELECT.TAG);
	DestroyObject(TAG);
	return;
}

if ((WINDOW != undefined && instance_exists(WINDOW)) && !CLOSE && string_count("SETTINGS", WINDOW.TAG) ) {
	
	if (CREATE) {

		// ICON POSITION
		if (ICON != undefined) {
			ICON.x = x - 332.5; ICON.y = y + 70;
			ICON.TEXT_CONNECT.x = ICON.x + 60; ICON.TEXT_CONNECT.y = ICON.y;
			ICON.image_alpha = image_alpha;
			ICON.ON = WINDOW.ON;
		}
		
		//FIND SETTING
		if (FIND_SETTING != undefined) {
			FIND_SETTING.x = x - 247;FIND_SETTING.y = y + 150;
			FIND_SETTING.image_alpha = image_alpha;
			FIND_SETTING.ON = WINDOW.ON;
			if (!WINDOW.ON) {
				FIND_SETTING.write.ON_WRITE = false;
				FIND_SETTING.image_index = 0;
			}
		}
		
		// OBJECT SELECT
		if (OBJECT_SELECT != undefined) {
			OBJECT_SELECT.x = OBJECT_SELECT_INDEX.x;
			OBJECT_SELECT.y = OBJECT_SELECT_INDEX.OBJECT_LINKED.y - 1;
			OBJECT_SELECT.ON = WINDOW.ON;
		}
		
		// ALL_SETTING
		for (var i = 0; all_settings[i] != undefined; i++)
			all_settings[i].ON = WINDOW.ON;
		ON = false;
	}
	if (!CREATE) {
		
		// CREATE ICON
		if (global.USER[6][0] == 0)
			ICON = CreateObjectSprite(x - 332.5, y + 70, WINDOW.LAYERS[0], Shomme, OJustGUI, "IMAGE", "SETTINGS_USER_ICON_" + TAG , [["INDEX_IMAGE", global.USER[6][1]], ["SLIDE", 0.0001], ["FADE_IN", 0.000005], undefined]);
		else
			ICON = CreateObjectSprite(x - 332.5, y + 70, WINDOW.LAYERS[0], Sfemme, OJustGUI, "IMAGE", "SETTINGS_USER_ICON_" + TAG, [["INDEX_IMAGE", global.USER[6][1]], ["SLIDE", 0.0001], ["FADE_IN", 0.000005], undefined]);
		ICON.image_xscale = 0.7;
		ICON.image_yscale = 0.7;
		ICON.TEXT_CONNECT = AddText(ICON.x + 60, ICON.y, global.USER[1] + "\nLocal Account", Segoe10, c_black, WINDOW.LAYERS[1], "SETTINGS_USER_NAME_" + TAG, [["BACK", 5], undefined]);
		WINDOW.list_objects = addtolist(ICON, WINDOW.list_objects);
		
		//CREATE FIND SETTING
		
		FIND_SETTING = CreateTextButton(x - 247, y + 150, S_Find_setting, "Find setting", WINDOW.LAYERS[0], WINDOW.LAYERS[1], #5E6668, Arial10, 25, TAG + "FIND_SETTING", [["BACK", 10], undefined]);
		FIND_SETTING.write.BAR.image_index = 1;
		WINDOW.list_objects = addtolist(FIND_SETTING, WINDOW.list_objects);
		

		// CREATE SETTING
		var system = CreateSetting("System", S_Settings_System, WINDOW.LAYERS[0], WINDOW.LAYERS[1], TAG + "SYSTEM", id); system.SETTING_SELECT = true;
		OBJECT_SELECT_INDEX = system;
		OBJECT_SELECT = CreateObjectSprite(system.x + 125, system.OBJECT_LINKED.y - 1, WINDOW.LAYERS[1], S_Settings_Select, OJustGUI, "IMAGE", "SETTING_SELECT" + TAG, [undefined]);
		CreateSetting("Network & internet", S_Settings_Network, WINDOW.LAYERS[0], WINDOW.LAYERS[1], TAG + "NETWORK", id);
		CreateSetting("Account", S_Settings_Account, WINDOW.LAYERS[0], WINDOW.LAYERS[1], TAG + "ACCOUNT", id);
		CreateSetting("Update", S_Settings_Update, WINDOW.LAYERS[0], WINDOW.LAYERS[1], TAG + "UPDATE", id);
		CreateSetting("Power system", S_Settings_Power, WINDOW.LAYERS[0], WINDOW.LAYERS[1], TAG + "POWER_SYSTEM", id);
		WINDOW.list_objects = addtolist(OBJECT_SELECT, WINDOW.list_objects);
		CREATE = true;
	} else if (CREATE && (WINDOW.ON || WINDOW.REDUCING || !WINDOW.FADE_MOVEMENT)) {
		ON = true;
	}	
	return;
}