/// @Project by Kucia Guillaume* ///

IMAGE_WIDTH = SIZE_X;
IMAGE_HEIGHT = SIZE_Y;
DevKit(id);


if (PARENT != undefined && AUTO_PLACE) {
	x = PARENT.x + REF_X;
	y = PARENT.y + REF_Y;
	if (TEXT_CONNECT != undefined) {
		TEXT_CONNECT.x = x + TEXT_REF_X; TEXT_CONNECT.y = y + TEXT_REF_Y; }
	if (OBJECT_LINKED != undefined) {
		OBJECT_LINKED.x = x + OBJ_REF_X; OBJECT_LINKED.y = y + OBJ_REF_Y; }
	image_alpha = PARENT.image_alpha;
	if (OBJECT_LINKED != undefined)
		OBJECT_LINKED.image_alpha = PARENT.image_alpha;
	if (TEXT_CONNECT != undefined)
		TEXT_CONNECT.image_alpha = PARENT.image_alpha;
}

if (PARENT != undefined) {
	if (PARENT.TAG + "BAR_CURRENT_NETWORK_SPEED" == TAG) {
		var objective = MathPercentOf2(global.GAME_VALUE[6][0], global.GAME_VALUE[6][1], 370);
		
		if (objective > SIZE_X)
			SIZE_X += (Diff(x + SIZE_X, x + objective) * (delta_time * 0.000005));
		else
			SIZE_X -= (Diff(x + SIZE_X, x + objective) * (delta_time * 0.000005));
			
		PARENT.SNETWORK_OBJECT[OBJECT_LINKED][1] = Diff(id.x, ((x + SIZE_X) - string_width(TEXT_CONNECT.TEXT)) - 50);
		TEXT_CONNECT.TEXT = string(global.GAME_VALUE[6][0]) + " Mb/s"; 
	}
}

if (PARENT != undefined && string_count("EDIT_LANGUAGE_CHANGE", TAG) > 0) {
	
	if (LANGUAGE_BUTTON_SELECT == undefined && MouseInsideRound(id) && global.SETTINGS[7] != LANGUAGE) {
	
		var pos_x = Diff(PARENT.x, (x + SIZE_X) - 110);
		var pos_y = Diff(PARENT.y, y + 10);
		var word = AutoLanguage("Select");
		var empt_text = GetEmptText(CenterStr((x + SIZE_X) - 60, word), MidleStr( y + 26, word), word, Segoe10, c_gray, #262626, PARENT.WINDOW.LAYERS[2]);
		LANGUAGE_BUTTON_SELECT = CreateEmptyButton(OSettingEmpty, pos_x, pos_y, 100, 30, #F8FAFF, #F8FAFF, PARENT.WINDOW.LAYERS[1], undefined, empt_text, PARENT.TAG + "ACCOUNT_EDIT_LANGUAGE_SELECT" + TAG, "EMPT_BUTTON", [undefined]);
		LANGUAGE_BUTTON_SELECT.REF_X = pos_x;
		LANGUAGE_BUTTON_SELECT.REF_Y = pos_y;
		LANGUAGE_BUTTON_SELECT.EXT = true;
		LANGUAGE_BUTTON_SELECT.EXT_COLOR = #EAEEF1;
		PARENT.WINDOW.list_objects = addtolist(LANGUAGE_BUTTON_SELECT, PARENT.WINDOW.list_objects);
		PARENT.SACCOUNT_OBJECT = addtolist([LANGUAGE_BUTTON_SELECT, pos_x, pos_y, 1], PARENT.SACCOUNT_OBJECT);
	} else if (LANGUAGE_BUTTON_SELECT != undefined && (!MouseInsideRound(id) || global.SETTINGS[7] == LANGUAGE)) {
		PARENT.SACCOUNT_OBJECT = remove_findlist_index(LANGUAGE_BUTTON_SELECT, PARENT.SACCOUNT_OBJECT, 0);
		PARENT.WINDOW.list_objects = remove_findlist(LANGUAGE_BUTTON_SELECT, PARENT.WINDOW.list_objects);
		DestroyEmptyButton(LANGUAGE_BUTTON_SELECT.TAG);
		LANGUAGE_BUTTON_SELECT = undefined;
	}
	
	if (LANGUAGE_BUTTON_SELECT != undefined && mouse_check_button_pressed(mb_left) && MouseInsideRound(LANGUAGE_BUTTON_SELECT))
		global.SETTINGS[7] = LANGUAGE;
	
	if (global.SETTINGS[7] == LANGUAGE && LANGUAGE_CHECKER == undefined) {
		LANGUAGE_CHECKER = CreateObjectSprite(x, y, PARENT.WINDOW.LAYERS[2], S_SAccount_Check, OJustGUI, "IMAGE", PARENT.TAG + "LANGUAGE_SELECT" + TAG, [undefined]);
		PARENT.WINDOW.list_objects = addtolist(LANGUAGE_CHECKER, PARENT.WINDOW.list_objects);
		PARENT.SACCOUNT_OBJECT = addtolist([LANGUAGE_CHECKER, Diff(PARENT.x, (x + SIZE_X) - 40), Diff(PARENT.y, (y + 10)), 1], PARENT.SACCOUNT_OBJECT);
	} else if (global.SETTINGS[7] != LANGUAGE && LANGUAGE_CHECKER != undefined) {
		PARENT.SACCOUNT_OBJECT = remove_findlist_index(LANGUAGE_CHECKER, PARENT.SACCOUNT_OBJECT, 0);
		PARENT.WINDOW.list_objects = remove_findlist(LANGUAGE_CHECKER, PARENT.WINDOW.list_objects);
		DestroyObject(LANGUAGE_CHECKER.TAG);
		LANGUAGE_CHECKER = undefined;
	}
	
} 

// CLICK
if (!MouseInsideRound(id) || !mouse_check_button_pressed(mb_left) || !ON) return;


if (PARENT != undefined && PARENT.TAG + "ACCOUNT_EDIT_PASSWORD_APPLY" == TAG) {
	if (OBJECT_LINKED.write.TEXT_OUTPUT == OBJECT_LINKED.write.INITIAL_TEXT)
		return;
	if (string_byte_length(OBJECT_LINKED.write.TEXT_OUTPUT) < 5) {  CreateNotification(Ssystem_icon, AutoLanguage("Error"), AutoLanguage("Password too short"), PARENT.TAG + "PASSWORD_EDIT_ERROR"); return; }
	if (OBJECT_LINKED.write.TEXT_OUTPUT == global.USER[5]) {  CreateNotification(Ssystem_icon, AutoLanguage("Error"), AutoLanguage("Your password must be\ndifferent from the old one"), PARENT.TAG + "PASSWORD_EDIT_ERROR=="); return; }
	global.USER[5] = OBJECT_LINKED.write.TEXT_OUTPUT;
	OBJECT_LINKED.write.TEXT = [OBJECT_LINKED.write.INITIAL_TEXT, undefined];
	OBJECT_LINKED.write.TEXT_INDEX = 1;
	OBJECT_LINKED.write.TEXT_INDEX_MAX = 1;
	CreateNotification(Ssystem_icon, AutoLanguage("Success"), AutoLanguage("Your passwords have been changed"), PARENT.TAG + "PASSWORD_EDIT_SUCCESS");
}

if (string_count("SET-ING", TAG) > 0) {
	for (var i = 0; PARENT.all_settings[i] != undefined; i++)
		PARENT.all_settings[i].SETTING_SELECT = false;
	SETTING_SELECT = true;
	PARENT.OBJECT_SELECT_INDEX = id;
	PARENT.SETTING_TITLE.TEXT = string_upper(TEXT_CONNECT.TEXT);
	PARENT.OBJECT_SELECT_RUN = true;

	DestroySSystemDisplay(PARENT);
	DestroySSystemSound(PARENT);
	DestroySSystemPersonalize(PARENT);
	DestroySSystemStorage(PARENT);
	DestroySSystemAbout(PARENT);
	DestroySSystem(PARENT);

	DestroySNetwork(PARENT);
	
	DestroySAccount(PARENT);

	if (string_count("SYSTEM", TAG) > 0 && string_count("POWER", TAG) == 0)
		CreateSSystem(PARENT);
	
	if (string_count("NETWORK", TAG) > 0)
		CreateSNetwork(PARENT);
		
	if (string_count("ACCOUNT", TAG) > 0)
		CreateSAccount(PARENT);
}

if (PARENT != undefined && PARENT.TAG + "SSDISPLAY" == TAG) {
	PARENT.SETTING_TITLE.TEXT = PARENT.SETTING_TITLE.TEXT + "/" +  AutoLanguage("DISPLAY");
	PARENT.SETTING_TITLE_FX = 20;
	DestroySSystemDisplay(PARENT);
	DestroySSystem(PARENT);
	CreateSystemDisplay(PARENT);
}

if (PARENT != undefined && PARENT.TAG + "SSSOUND" == TAG) {
	PARENT.SETTING_TITLE.TEXT = PARENT.SETTING_TITLE.TEXT + "/" + AutoLanguage("SOUND");
	PARENT.SETTING_TITLE_FX = 20;
	DestroySSystemSound(PARENT);
	DestroySSystem(PARENT);
	CreateSystemSound(PARENT);
}

if (PARENT != undefined && PARENT.TAG + "SSPERSONALIZE" == TAG) {
	PARENT.SETTING_TITLE.TEXT = PARENT.SETTING_TITLE.TEXT + "/" + AutoLanguage("PERSONALIZE");
	PARENT.SETTING_TITLE_FX = 20;
	DestroySSystemPersonalize(PARENT);
	DestroySSystem(PARENT);
	CreateSystemPersonalize(PARENT);
}

if (PARENT != undefined && PARENT.TAG + "SSSTORAGE" == TAG) {
	PARENT.SETTING_TITLE.TEXT = PARENT.SETTING_TITLE.TEXT + "/" + AutoLanguage("STORAGE");
	PARENT.SETTING_TITLE_FX = 20;
	DestroySSystemStorage(PARENT);
	DestroySSystem(PARENT);
	CreateSystemStorage(PARENT);
}

if (PARENT != undefined && PARENT.TAG + "SSABOUT" == TAG) {
	PARENT.SETTING_TITLE.TEXT = PARENT.SETTING_TITLE.TEXT + "/" + AutoLanguage("ABOUT");
	PARENT.SETTING_TITLE_FX = 20;
	DestroySSystemAbout(PARENT);
	DestroySSystem(PARENT);
	CreateSystemAbout(PARENT);
}

if (PARENT != undefined && PARENT.TAG + "SYSTEM_BACK" == TAG) {
	if (PARENT.SETTING_TITLE.TEXT == AutoLanguage("SYSTEM") + "/" + AutoLanguage("DISPLAY")) {
		PARENT.SETTING_TITLE.TEXT = AutoLanguage("SYSTEM");
		DestroySSystemDisplay(PARENT);
		DestroySSystem(PARENT);
		CreateSSystem(PARENT);
	}
	if (PARENT.SETTING_TITLE.TEXT == AutoLanguage("SYSTEM") + "/" + AutoLanguage("SOUND")) {
		PARENT.SETTING_TITLE.TEXT = AutoLanguage("SYSTEM");
		DestroySSystemSound(PARENT);
		DestroySSystem(PARENT);
		CreateSSystem(PARENT);
	}
	if (PARENT.SETTING_TITLE.TEXT == AutoLanguage("SYSTEM") + "/" + AutoLanguage("PERSONALIZE")) {
		PARENT.SETTING_TITLE.TEXT = AutoLanguage("SYSTEM");
		DestroySSystemPersonalize(PARENT);
		DestroySSystem(PARENT);
		CreateSSystem(PARENT);
	}
	if (PARENT.SETTING_TITLE.TEXT == AutoLanguage("SYSTEM") + "/" + AutoLanguage("STORAGE")) {
		PARENT.SETTING_TITLE.TEXT = AutoLanguage("SYSTEM");
		DestroySSystemStorage(PARENT);
		DestroySSystem(PARENT);
		CreateSSystem(PARENT);
	}
	if (PARENT.SETTING_TITLE.TEXT == AutoLanguage("SYSTEM") + "/" + AutoLanguage("ABOUT")) {
		PARENT.SETTING_TITLE.TEXT = AutoLanguage("SYSTEM");
		DestroySSystemAbout(PARENT);
		DestroySSystem(PARENT);
		CreateSSystem(PARENT);
	}
}

if (PARENT != undefined && PARENT.TAG + "DISPLAY_APPLY_CHANGES" == TAG) {

// "2715 x 1527"

	var res = SELECTV2_CONNECT.TEXT_CONNECT.TEXT;
	global.SETTINGS[2] = res;

	var left = "";
	for (var i = 1; string_char_at(res, i) != " "; i++)
		left = left + string_char_at(res, i);
	
	var right = "";
	i += 3;
	for (; i < string_byte_length(res) + 1 && string_char_at(res, i) != "(" && string_char_at(res, i) != " "; i++)
		right = right + string_char_at(res, i);
		
	var width = real(left);
	var height = real(right);

	var custom = GetObject(PARENT.TAG + "CUSTOM_CHECKER" + "CHECKER_SELECTOR");
	
	window_set_fullscreen(global.SETTINGS[4]);
	if (!custom.CHECKER_STATE)
		window_set_size(width, height);
	else {
		var left = GetObject(PARENT.TAG +  "CUSTOM_LEFT");
		var right = GetObject(PARENT.TAG +  "CUSTOM_RIGHT");
		
		left = left.TEXT;
		right = right.TEXT;
		global.SETTINGS[3] = [left, right, true];
		window_set_size(real(left), real(right));
	}
}

