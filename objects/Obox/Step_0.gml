/// @Project by Kucia Guillaume* ///

if (TAG == "NULL")
	return;
//GET OPTIONS
for (var i = 0; OPTION[i] != "NULL"; i++) {
	if (OPTION[i][0] == "LOCK")
		LOCK = OPTION[i];
	if (OPTION[i][0] == "IMAGE_INDEX")
		OBJECT_LINKED.image_index = OPTION[i][1];
	if (OPTION[i][0] == "FADE_ON") {FADE_ON = true; FADE_ON_POWER = OPTION[i][1]; }
	if (OPTION[i][0] == "FADE_IN" && !FADE_SATE) { 
		FADE_IN = true; FADE_POWER = OPTION[i][1];
		FADE_SATE = true; image_alpha = 0;	
	}
	if (OPTION[i][0] == "INFO") {INFO = true; INFO_NAME = OPTION[i][1]; }
}

if (!FIRST_PASS && !FADE_IN) { FIRST_PASS = true; image_alpha = 2; } 

// FADE_IN

if (FADE_IN && image_alpha < 1)
	image_alpha += FADE_POWER * delta_time;
else
	FADE_IN = false;

// ICON BUTTON
if (OBJECT_LINKED != "NULL") {
	if (((global.USER[6][0] == 0 && OBJECT_LINKED.sprite_index == Shomme) || (global.USER[6][0] == 1 && OBJECT_LINKED.sprite_index == Sfemme)) && global.USER[6][1] == OBJECT_LINKED.image_index) { image_index = 2; }
	else if (image_index == 2) { image_index = 0; LOCK_STATE = true; }
}

// LOCK BUTTON
if ((LOCK[0] != "NULL" && !LOCK[1].LOCK_STATE)) {
	image_index = 2;
	return;
} else if (image_index == 2) { image_index = 0; }

if (string_count("PIN", TAG) > 0) {
	if (!PARENT.PIN) {
		OBJECT_LINKED.image_index = 0;
		TEXT_CONNECT.TEXT = "Pin from taskbar";
	} else {
		OBJECT_LINKED.image_index = 1;
		TEXT_CONNECT.TEXT = "Unpin from taskbar";
	}
}


if (mouse_x < bbox_left || mouse_x > bbox_right)
	return;
if (mouse_y < bbox_top || mouse_y > bbox_bottom)
	return;
	
if (!mouse_check_button_pressed(mb_left))
	return;

if (TAG == "EDIT_ICON_1" || TAG == "EDIT_ICON_2" || TAG == "EDIT_ICON_3" || TAG == "EDIT_ICON_4" ||
	 TAG == "EDIT_ICON_5" || TAG == "EDIT_ICON_6" || TAG == "EDIT_ICON_7" || TAG == "EDIT_ICON_8")
{
	LOCK[0] = "LOCK";
	LOCK[1] = SELF;
	LOCK_STATE = false;
	if (OBJECT_LINKED.sprite_index == Shomme)
		global.USER[6][0] = 0;
	else
		global.USER[6][0] = 1;
	global.USER[6][1] = OBJECT_LINKED.image_index;
}

if (TAG == "POWER_OFF") {
	var get = GetObject("POWER_OPTION")
	if (get == "NULL") {
		CreateObjectSprite(1820, 935, "Gp2", Spower_option, OJustGUI, "IMAGE", "POWER_OPTION", [["FADE_IN", 0.000001], "NULL"]);
		CreateButtonBox(1820, 1000, Sshutdown, OboxText, "Stop", "Gp3", "Gp4", Arial10, c_white, "SUTDOWN", [["FADE_IN", 0.000001], ["CENTERED"], "NULL"]);
		CreateButtonBox(1820, 960, Srestart, OboxText, "Restart", "Gp3", "Gp4", Arial10, c_white, "RESTART", [["FADE_IN", 0.000001], ["CENTERED"], "NULL"]);
	} else {
		DestroyObject("POWER_OPTION");
		DestroyButtonBox("SUTDOWN");
		DestroyButtonBox("RESTART");
	}
}

if (TAG == "CLOSE_NOTIF") {
	DestroyObject(OBJECT_LINKED.ICON_CONNECT.TAG);
	DestroyText(OBJECT_LINKED.TITLE_CONNECT.TAG);
	DestroyText(OBJECT_LINKED.DESCRIPTION_CONNECT.TAG);
	DestroyObject(OBJECT_LINKED.TAG);
	DestroyObject(TAG);
}

if (string_count("CLOSE_ALL_WINDOW", TAG) > 0) {
	if (!PARENT.PIN)
		PARENT.OPT_CLOSING = true;
	for (var i = 0; ON_MAIN_SCENE.TASKS[PARENT.WINDOW][3][i] != "NULL"; i++) {
		var obj = ON_MAIN_SCENE.TASKS[PARENT.WINDOW][3][i];
		if (obj.IS_REDUCE) {
			obj.IS_REDUCE = false;
			obj.image_alpha = 5;
		}
		obj.FADE_END = true;
		obj.CLOSING = true;
	}
	DestroyButtonBox(PARENT.TAG + "CLOSE_ALL_WINDOW");
	var opt = GetObject(PARENT.TAG + "RIGHT_OPT");
	opt.y += 22.5;
	opt.Y_TARGET += 22.5;
	opt.SIZE_Y -= 22.5
}

if (string_count("PIN", TAG) > 0) {
	if (!PARENT.PIN)
		PARENT.PIN = true;
	else
		PARENT.PIN = false;
}

if (string_count("WINDOW_ME", TAG) > 0)
	CreateWindow(PARENT.CREATE_WINDOW_IMAGE, PARENT.CREATE_WINDOW_TAG, PARENT.CREATE_WINDOW_ICON, PARENT.CREATE_WINDOW_NAME);

if (PARENT != "NULL" && string_count("VISIO_BUTTON", TAG))
	showmywindow(PARENT.id, PARENT.id, PARENT.depth, PARENT.MAIN_LAYER_ID);

