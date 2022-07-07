/// @Project by Kucia Guillaume* ///

IMAGE_WIDTH = SIZE_X;
IMAGE_HEIGHT = SIZE_Y;
DevKit(id);


x = PARENT.x + REF_X;
y = PARENT.y + REF_Y;
TEXT_CONNECT.x = x + TEXT_REF_X; TEXT_CONNECT.y = y + TEXT_REF_Y;
if (OBJECT_LINKED != undefined) {
	OBJECT_LINKED.x = x + OBJ_REF_X;OBJECT_LINKED.y = y + OBJ_REF_Y; }
image_alpha = PARENT.image_alpha;
if (OBJECT_LINKED != undefined)
	OBJECT_LINKED.image_alpha = PARENT.image_alpha;
TEXT_CONNECT.image_alpha = PARENT.image_alpha;

// CLICK
if (!MouseInsideRound(id) || !mouse_check_button_pressed(mb_left) || !ON) return;

if (string_count("SET-ING", TAG) > 0) {
	for (var i = 0; PARENT.all_settings[i] != undefined; i++)
		PARENT.all_settings[i].SETTING_SELECT = false;
	SETTING_SELECT = true;
	PARENT.OBJECT_SELECT_INDEX = id;
	PARENT.SETTING_TITLE.TEXT = string_upper(TEXT_CONNECT.TEXT);
	PARENT.OBJECT_SELECT_RUN = true;
	
	DestroySSystem(PARENT);
	if (string_count("SYSTEM", TAG) > 0 && string_count("POWER", TAG) == 0)
		CreateSSystem(PARENT);
}

if (PARENT.TAG + "SSDISPLAY" == TAG) {
	PARENT.SETTING_TITLE.TEXT = PARENT.SETTING_TITLE.TEXT + "/DISPLAY";
	PARENT.SETTING_TITLE_FX = 20;
	DestroySSystem(PARENT);
	CreateSystemDisplay(PARENT);
}

