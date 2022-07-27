/// @Project by Kucia Guillaume* ///

IMAGE_WIDTH = SIZE_X;
IMAGE_HEIGHT = SIZE_Y;
DevKit(id);


if (PARENT != undefined) {
	x = PARENT.x + REF_X;
	y = PARENT.y + REF_Y;
	if (TEXT_CONNECT != undefined) {
		TEXT_CONNECT.x = x + TEXT_REF_X; TEXT_CONNECT.y = y + TEXT_REF_Y; }
	if (OBJECT_LINKED != undefined) {
		OBJECT_LINKED.x = x + OBJ_REF_X;OBJECT_LINKED.y = y + OBJ_REF_Y; }
	image_alpha = PARENT.image_alpha;
	if (OBJECT_LINKED != undefined)
		OBJECT_LINKED.image_alpha = PARENT.image_alpha;
	if (TEXT_CONNECT != undefined)
		TEXT_CONNECT.image_alpha = PARENT.image_alpha;
}

// CLICK
if (!MouseInsideRound(id) || !mouse_check_button_pressed(mb_left) || !ON) return;

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
	DestroySSystem(PARENT);
	if (string_count("SYSTEM", TAG) > 0 && string_count("POWER", TAG) == 0)
		CreateSSystem(PARENT);
}

if (PARENT.TAG + "SSDISPLAY" == TAG) {
	PARENT.SETTING_TITLE.TEXT = PARENT.SETTING_TITLE.TEXT + "/DISPLAY";
	PARENT.SETTING_TITLE_FX = 20;
	DestroySSystemDisplay(PARENT);
	DestroySSystem(PARENT);
	CreateSystemDisplay(PARENT);
}

if (PARENT.TAG + "SSSOUND" == TAG) {
	PARENT.SETTING_TITLE.TEXT = PARENT.SETTING_TITLE.TEXT + "/SOUND";
	PARENT.SETTING_TITLE_FX = 20;
	DestroySSystemSound(PARENT);
	DestroySSystem(PARENT);
	CreateSystemSound(PARENT);
}

if (PARENT.TAG + "SSPERSONALIZE" == TAG) {
	PARENT.SETTING_TITLE.TEXT = PARENT.SETTING_TITLE.TEXT + "/PERSONALIZE";
	PARENT.SETTING_TITLE_FX = 20;
	DestroySSystemPersonalize(PARENT);
	DestroySSystem(PARENT);
	CreateSystemPersonalize(PARENT);
}

if (PARENT.TAG + "SYSTEM_BACK" == TAG) {
	if (PARENT.SETTING_TITLE.TEXT == "SYSTEM/DISPLAY") {
		PARENT.SETTING_TITLE.TEXT = "SYSTEM";
		DestroySSystemDisplay(PARENT);
		DestroySSystem(PARENT);
		CreateSSystem(PARENT);
	}
	if (PARENT.SETTING_TITLE.TEXT == "SYSTEM/SOUND") {
		PARENT.SETTING_TITLE.TEXT = "SYSTEM";
		DestroySSystemSound(PARENT);
		DestroySSystem(PARENT);
		CreateSSystem(PARENT);
	}
	if (PARENT.SETTING_TITLE.TEXT == "SYSTEM/PERSONALIZE") {
		PARENT.SETTING_TITLE.TEXT = "SYSTEM";
		DestroySSystemPersonalize(PARENT);
		DestroySSystem(PARENT);
		CreateSSystem(PARENT);
	}
}

if (PARENT.TAG + "DISPLAY_APPLY_CHANGES" == TAG) {

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

