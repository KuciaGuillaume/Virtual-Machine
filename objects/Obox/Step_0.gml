/// @Project by Kucia Guillaume* ///

if (TAG == undefined)
	return;

if (!FIRST_PASS && !FADE_IN) { FIRST_PASS = true; image_alpha = 2; } 

// FADE_IN

if (FADE_IN && image_alpha < 1 && ON)
	image_alpha += FADE_POWER * delta_time;
else
	FADE_IN = false;

if (IMAGE_WIDTH < 0) {
	IMAGE_WIDTH = sprite_width;
	IMAGE_HEIGHT = sprite_height;
}

if (SLIDE && image_alpha < 1 && ON) {
	y -= SLIDE_POWER * delta_time;
	if (TEXT_CONNECT != undefined)
		TEXT_CONNECT.y -= SLIDE_POWER * delta_time;
}

// ICON BUTTON
if (OBJECT_LINKED != undefined) {
	if (((global.USER[6][0] == 0 && OBJECT_LINKED.sprite_index == Shomme) || (global.USER[6][0] == 1 && OBJECT_LINKED.sprite_index == Sfemme)) && global.USER[6][1] == OBJECT_LINKED.image_index) { image_index = 2; }
	else if (image_index == 2) { image_index = 0; LOCK_STATE = true; }
}

// LOCK BUTTON
if ((LOCK[0] != undefined && !LOCK[1].LOCK_STATE)) {
	image_index = 2;
	return;
} else if (image_index == 2) { image_index = 0; }

if (GET_PIN == undefined && string_count("PIN", TAG) > 0)
	GET_PIN = TAG;
if (GET_PIN == TAG) {
	if (!PARENT.PIN) {
		OBJECT_LINKED.image_index = 0;
		TEXT_CONNECT.TEXT = "Pin from taskbar";
	} else {
		OBJECT_LINKED.image_index = 1;
		TEXT_CONNECT.TEXT = "Unpin from taskbar";
	}
}

if (GET_EXPLORER == undefined && string_count("FILE_EXPLORERS", TAG) > 0)
	GET_EXPLORER = TAG;
if (GET_EXPLORER != undefined) {
	SET_DISPLAY = true;
	OBJECT_LINKED.SET_DISPLAY = true;
	if (PARENT != undefined) {
	    x = PARENT.x + PARENT_DIFF_X;
		y = PARENT.y + PARENT_DIFF_Y;
		if (TEXT_CONNECT != undefined && DOCK_TYPE_TEXT != undefined && OBJECT_LINKED != undefined) {
			TEXT_CONNECT.x = x - 220; DOCK_TYPE_TEXT.x = x + 180;
			TEXT_CONNECT.y = (y - TEXT_CONNECT.TEXT_HEIGHT/2) + 1; DOCK_TYPE_TEXT.y = (y - TEXT_CONNECT.TEXT_HEIGHT/2) + 1;
			image_alpha = PARENT.image_alpha;
			TEXT_CONNECT.image_alpha = image_alpha; DOCK_TYPE_TEXT.image_alpha = image_alpha;
			OBJECT_LINKED.x = x - 235; OBJECT_LINKED.image_alpha = image_alpha;
			OBJECT_LINKED.y = y;
		}
	}
}

if (REFRESH) {
	REFRESH_LOAD.image_angle -= 0.0007 * delta_time;
	REFRESH_LOAD.x = x;
	REFRESH_LOAD.y = y;
	REFRESH_LOAD.image_alpha = image_alpha;
	REFRESH_TIME += delta_time / 1000000;
	if (REFRESH_TIME >= 1) {
		PARENT.FOLDER_LIST = UpdateFileExplorer(PARENT.PWD, PARENT.PWD_PATH, PARENT.FOLDER_LIST, PARENT.id);
		visible = true;
		DestroyObject(REFRESH_LOAD.TAG);
		REFRESH = false;
	}
}

// FILE EXPLORER FOLDER
if (GET_FOLDER == undefined && string_count("FILE_EXPLORERS", TAG) > 0)
	GET_FOLDER = TAG;
if (GET_FOLDER != undefined) {

	// FOLDER NAME
	if (WRITE != undefined && WRITE.ON_WRITE) {
		var i = get_index_list_explorer(TEXT_CONNECT.TEXT, PARENT.FOLDER_LIST);
		TEXT_CONNECT.TEXT = WRITE.TEXT_OUTPUT;
		PARENT.FOLDER_LIST[i].NAME = TEXT_CONNECT.TEXT;
		var PWD = PARENT.PWD;
		terminal_rename(["rename", ORIGINAL_NAME, TEXT_CONNECT.TEXT, undefined], undefined, PWD, undefined);
		ORIGINAL_NAME = WRITE.TEXT_OUTPUT;
		WRITE.BAR.y = TEXT_CONNECT.y + 6;
		TEXT_CONNECT.COLOR = c_white;
		RENAME_OBJECT = CreateEmptyRound(TEXT_CONNECT.x - 5, TEXT_CONNECT.y - 5, #262626, TEXT_CONNECT.TEXT_WIDTH + 10, TEXT_CONNECT.TEXT_HEIGHT + 5, PARENT.WINDOW.LAYERS[1], TAG + "RENAME_ON_DESK", [undefined]);
		UpdateBar(WRITE.BAR, TEXT_CONNECT.TEXT_WIDTH, TEXT_CONNECT.x);
	} else if (TEXT_CONNECT != undefined && TEXT_CONNECT.COLOR == c_white) {
		if (TEXT_CONNECT.TEXT == "") {
			var i = get_index_list(TEXT_CONNECT.TEXT, ON_MAIN_SCENE.NAME_FOLDERS);
			TEXT_CONNECT.TEXT = MASTER_NAME;
			ON_MAIN_SCENE.NAME_FOLDERS[i][0] = TEXT_CONNECT.TEXT;
			var PWD = ON_MAIN_SCENE.PATH[1];
			terminal_rename(["rename", ORIGINAL_NAME, TEXT_CONNECT.TEXT, undefined], undefined, PWD, undefined);
			ORIGINAL_NAME = WRITE.TEXT_OUTPUT;
			var SAVE_LIST = [global.USER, ON_MAIN_SCENE.PATH, ON_MAIN_SCENE.NAME_FOLDERS, undefined];
			savegame_save("USER", SAVE_LIST);
		}
		if (RENAME_OBJECT != undefined) {
			DestroyObject(TAG + "RENAME_ON_DESK");
			RENAME_OBJECT = undefined;
		}
		TEXT_CONNECT.COLOR = c_black;
		WRITE.INITIAL_TEXT = TEXT_CONNECT.TEXT;
		ORIGINAL_NAME = TEXT_CONNECT.TEXT;
		MASTER_NAME = TEXT_CONNECT.TEXT;
	}
	
	if (mouse_check_button_pressed(mb_left) || mouse_check_button_pressed(mb_right)) {
		if (!MouseInsideObject(id) && WRITE.ON_WRITE == true) {
			WRITE.ON_WRITE = false;
			var SAVE_LIST = [global.USER, ON_MAIN_SCENE.PATH, ON_MAIN_SCENE.NAME_FOLDERS, undefined];
			savegame_save("USER", SAVE_LIST);
		}
	}
}

if ((mouse_check_button_pressed(mb_left) || mouse_check_button_pressed(mb_right)) && !MouseInsideObject(id))
	EXPLORER_SELECT = false;

// MOUSE
if (!MouseInsideObject(id))
	return;
if (sprite_index != S_FILES_buton) {
	if (!mouse_check_button_pressed(mb_left) || !ON)
		return;
} else {
	if ((mouse_check_button_pressed(mb_right) || mouse_check_button_pressed(mb_left)) && !EXPLORER_SELECT && ON) {
		EXPLORER_SELECT = true;
		image_index = 1
		return;
	}
	if (!mouse_check_button_pressed(mb_left) || !ON)
		return;
}

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
	if (get == undefined) {
		CreateObjectSprite(1820, 935, "Gp2", Spower_option, OJustGUI, "IMAGE", "POWER_OPTION", [["FADE_IN", 0.000001], undefined]);
		CreateButtonBox(1820, 1000, Sshutdown, OboxText, "Stop", "Gp3", "Gp4", Arial10, c_white, "SUTDOWN", [["FADE_IN", 0.000001], ["CENTERED"], undefined]);
		CreateButtonBox(1820, 960, Srestart, OboxText, "Restart", "Gp3", "Gp4", Arial10, c_white, "RESTART", [["FADE_IN", 0.000001], ["CENTERED"], undefined]);
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
	for (var i = 0; ON_MAIN_SCENE.TASKS[PARENT.WINDOW][3][i] != undefined; i++) {
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
	if (PARENT.PIN) {
		for (var i = 0; global.WINDOWS_PIN[i] != undefined && global.WINDOWS_PIN[i][2] != PARENT.WINDOW_TAG; ) { i++; }
		var class = [PARENT.PIN, PARENT.CREATE_WINDOW_IMAGE, PARENT.CREATE_WINDOW_OBJECT, PARENT.WINDOW_TAG, PARENT.CREATE_WINDOW_ICON, PARENT.CREATE_WINDOW_NAME];
		if (global.WINDOWS_PIN[i] == undefined)
			global.WINDOWS_PIN[i + 1] = undefined;
		global.WINDOWS_PIN[i] = class;
		return;
	}
	for (var i = 0; global.WINDOWS_PIN[i][3] != PARENT.WINDOW_TAG;) { i++; }
	for (; global.WINDOWS_PIN[i] != undefined; i++)
		global.WINDOWS_PIN[i] = global.WINDOWS_PIN[i + 1];
}

if (string_count("WINDOW_ME", TAG) > 0)
	CreateWindow(PARENT.CREATE_WINDOW_IMAGE, PARENT.CREATE_WINDOW_OBJECT,PARENT.CREATE_WINDOW_TAG, PARENT.CREATE_WINDOW_ICON, PARENT.CREATE_WINDOW_NAME);

if (PARENT != undefined && string_count("VISIO_BUTTON", TAG)) {
	if (!PARENT.IS_REDUCE)
		showmywindow(PARENT.id, PARENT.id, PARENT.depth, PARENT.MAIN_LAYER_ID);
	else {
		PARENT.FADE_MOVEMENT = false;
		PARENT.IS_REDUCE = false;
		PARENT.y = PARENT.Y_TARGET + 20;
		PARENT.FADE_END = false;
		PARENT.FADE_IN = true;
		PARENT.ON = false;
		PARENT.FIRST_TAKE = false;
		PARENT.CAN_TAKE = false;
	}
}
if (PARENT != undefined && string_count("VISIO_CLOSE", TAG)) {
	PARENT.FADE_END = true;
	PARENT.CLOSING = true;
	PARENT.IS_REDUCE = false;
	var visio = GetObject(VISIO_TAG);
	if (visio != undefined) {
		visio.Y_TARGET += 22.5;
		for (var i = 0; visio.COMPONENTS[i] != id;) { i++ };
		for (; visio.COMPONENTS[i] != undefined; i++) {
			var object = visio.COMPONENTS[i];
			if (object == undefined || !instance_exists(object))
				continue;
			object.y += 22.5
			if (object.OBJECT_LINKED != undefined)
				object.OBJECT_LINKED.y += 22.5;
			if (object.TEXT_CONNECT != undefined)
				object.TEXT_CONNECT.y += 22.5;
		}
		visio.y += 22.5;
		visio.SIZE_Y -= 22.5;
	}
	DestroyObject(TAG);
	DestroyButtonBox(OTHER_PARENT.TAG);
	mouse_clear(mb_left);
}

if (string_count("EXPLORER_RELOAD", TAG) > 0 && visible = true) {
	REFRESH = true;
	visible = false;
	REFRESH_LOAD = CreateObjectSprite(x, y, layer, S_File_Explorer_Load, OJustGUI, "IMAGE", TAG + "LOAD", [undefined]);
	REFRESH_TIME = 0;
}

if (EXPLORER_SELECT && string_count("FILE_EXPLORERS", TAG) > 0) {
	var get = GetObject(INFO_NAME + TAG);
	if (get != undefined) DestroyRound(get.TAG);
	PARENT.PWD_PATH = PARENT.PWD_PATH + "/" + NAME;
	PARENT.PWD = go_to_path(ON_MAIN_SCENE.PATH, PARENT.PWD_PATH);
	for (var i = 0; PARENT.FOLDER_LIST[i] != undefined; i++) {
		DestroyText(PARENT.FOLDER_LIST[i].TEXT_CONNECT.TAG);
		DestroyText(PARENT.FOLDER_LIST[i].DOCK_TYPE_TEXT.TAG);
		DestroyObject(PARENT.FOLDER_LIST[i].OBJECT_LINKED.TAG);
		DestroyObject(PARENT.FOLDER_LIST[i].TAG);
	}
	PARENT.N_ELEMENTS = 0;
	PARENT.FOLDER_LIST = [undefined];
	PARENT.FOLDER_LIST = UpdateFileExplorer(PARENT.PWD, PARENT.PWD_PATH, PARENT.FOLDER_LIST, PARENT.id);
	var refresh = PARENT.EXPLORER_RELOAD;
	refresh.REFRESH = true;
	refresh.visible = false;
	if (refresh.REFRESH_LOAD == undefined || !instance_exists(refresh.REFRESH_LOAD))
		refresh.REFRESH_LOAD = CreateObjectSprite(x, y, layer, S_File_Explorer_Load, OJustGUI, "IMAGE", refresh.TAG + "LOAD", [undefined]);
	refresh.REFRESH_TIME = 0.5;
}

if (string_count("GO_ROOT", TAG) > 0 || string_count("PATH_THIS_COMPUTER", TAG) > 0) {
	if (PARENT.PWD_PATH == "/~")
		return;
	PARENT.PWD = go_to_path(ON_MAIN_SCENE.PATH, "/~");
	PARENT.PWD_PATH = "/~";
	for (var i = 0; PARENT.FOLDER_LIST[i] != undefined; i++) {
		DestroyText(PARENT.FOLDER_LIST[i].TEXT_CONNECT.TAG);
		DestroyText(PARENT.FOLDER_LIST[i].DOCK_TYPE_TEXT.TAG);
		DestroyObject(PARENT.FOLDER_LIST[i].OBJECT_LINKED.TAG);
		DestroyObject(PARENT.FOLDER_LIST[i].TAG);
	}
	PARENT.N_ELEMENTS = 0;
	PARENT.FOLDER_LIST = [undefined];
	PARENT.FOLDER_LIST = UpdateFileExplorer(PARENT.PWD, PARENT.PWD_PATH, PARENT.FOLDER_LIST, PARENT.id);
	var refresh = PARENT.EXPLORER_RELOAD;
	refresh.REFRESH = true;
	refresh.visible = false;
	if (refresh.REFRESH_LOAD == undefined || !instance_exists(refresh.REFRESH_LOAD))
		refresh.REFRESH_LOAD = CreateObjectSprite(x, y, layer, S_File_Explorer_Load, OJustGUI, "IMAGE", refresh.TAG + "LOAD", [undefined]);
	refresh.REFRESH_TIME = 0.5;
}

if (string_count("PATH_DESK", TAG) > 0) {
	if (PARENT.PWD_PATH == "/~/Desk")
		return;
	PARENT.PWD = go_to_path(ON_MAIN_SCENE.PATH, "/~/Desk");
	PARENT.PWD_PATH = "/~/Desk";
	for (var i = 0; PARENT.FOLDER_LIST[i] != undefined; i++) {
		DestroyText(PARENT.FOLDER_LIST[i].TEXT_CONNECT.TAG);
		DestroyText(PARENT.FOLDER_LIST[i].DOCK_TYPE_TEXT.TAG);
		DestroyObject(PARENT.FOLDER_LIST[i].OBJECT_LINKED.TAG);
		DestroyObject(PARENT.FOLDER_LIST[i].TAG);
	}
	PARENT.N_ELEMENTS = 0;
	PARENT.FOLDER_LIST = [undefined];
	PARENT.FOLDER_LIST = UpdateFileExplorer(PARENT.PWD, PARENT.PWD_PATH, PARENT.FOLDER_LIST, PARENT.id);
	var refresh = PARENT.EXPLORER_RELOAD;
	refresh.REFRESH = true;
	refresh.visible = false;
	if (refresh.REFRESH_LOAD == undefined || !instance_exists(refresh.REFRESH_LOAD))
		refresh.REFRESH_LOAD = CreateObjectSprite(x, y, layer, S_File_Explorer_Load, OJustGUI, "IMAGE", refresh.TAG + "LOAD", [undefined]);
	refresh.REFRESH_TIME = 0.5;
}

if (string_count("PATH_DOWNLOADS", TAG) > 0) {
	if (PARENT.PWD_PATH == "/~/Downloads")
		return;
	PARENT.PWD = go_to_path(ON_MAIN_SCENE.PATH, "/~/Downloads");
	PARENT.PWD_PATH = "/~/Downloads";
	for (var i = 0; PARENT.FOLDER_LIST[i] != undefined; i++) {
		DestroyText(PARENT.FOLDER_LIST[i].TEXT_CONNECT.TAG);
		DestroyText(PARENT.FOLDER_LIST[i].DOCK_TYPE_TEXT.TAG);
		DestroyObject(PARENT.FOLDER_LIST[i].OBJECT_LINKED.TAG);
		DestroyObject(PARENT.FOLDER_LIST[i].TAG);
	}
	PARENT.N_ELEMENTS = 0;
	PARENT.FOLDER_LIST = [undefined];
	PARENT.FOLDER_LIST = UpdateFileExplorer(PARENT.PWD, PARENT.PWD_PATH, PARENT.FOLDER_LIST, PARENT.id);
	var refresh = PARENT.EXPLORER_RELOAD;
	refresh.REFRESH = true;
	refresh.visible = false;
	if (refresh.REFRESH_LOAD == undefined || !instance_exists(refresh.REFRESH_LOAD))
		refresh.REFRESH_LOAD = CreateObjectSprite(x, y, layer, S_File_Explorer_Load, OJustGUI, "IMAGE", refresh.TAG + "LOAD", [undefined]);
	refresh.REFRESH_TIME = 0.5;
}

if (string_count("GO_BACK", TAG) > 0) {
	if (PARENT.PWD_PATH == "/~")
		return;
	var path = "";
	var count = 0;
	var target = string_count("/", PARENT.PWD_PATH);
	for (var i = 0; count != target; i++) {
		if (string_char_at(PARENT.PWD_PATH, i + 1) == "/") count += 1
		if (count == target) break;
		path = path + string_char_at(PARENT.PWD_PATH, i + 1);
	}
	PARENT.PWD_PATH = path;
	PARENT.PWD = go_to_path(ON_MAIN_SCENE.PATH, PARENT.PWD_PATH);
	for (var i = 0; PARENT.FOLDER_LIST[i] != undefined; i++) {
		DestroyText(PARENT.FOLDER_LIST[i].TEXT_CONNECT.TAG);
		DestroyText(PARENT.FOLDER_LIST[i].DOCK_TYPE_TEXT.TAG);
		DestroyObject(PARENT.FOLDER_LIST[i].OBJECT_LINKED.TAG);
		DestroyObject(PARENT.FOLDER_LIST[i].TAG);
	}
	PARENT.N_ELEMENTS = 0;
	PARENT.FOLDER_LIST = [undefined];
	PARENT.FOLDER_LIST = UpdateFileExplorer(PARENT.PWD, PARENT.PWD_PATH, PARENT.FOLDER_LIST, PARENT.id);
	var refresh = PARENT.EXPLORER_RELOAD;
	refresh.REFRESH = true;
	refresh.visible = false;
	if (refresh.REFRESH_LOAD == undefined || !instance_exists(refresh.REFRESH_LOAD))
		refresh.REFRESH_LOAD = CreateObjectSprite(x, y, layer, S_File_Explorer_Load, OJustGUI, "IMAGE", refresh.TAG + "LOAD", [undefined]);
	refresh.REFRESH_TIME = 0.5;
}

if (string_count("FIND_ROOT", TAG) > 0) {
	PARENT.FIND_OPION_MODE = "ROOT";
}

if (string_count("FIND_FOLDER", TAG) > 0) {
	PARENT.FIND_OPION_MODE = "FOLDER";
}

if (string_count("LEFT_NEW_FOLDER_EXPLORERS", TAG) > 0) {
	var PWD = PARENT.PWD;
	var ID = 0;
	for (var i = 1; PWD[i] != undefined; i++) {
		if (is_array(PWD[i]) && string_count("Newfolder", PWD[i][0][0][0]) > 0)
			ID += 1;
	}
	if (ID <= 0)
		var mkdir = terminal_mkdir(["mkdir", "Newfolder", undefined], undefined, PWD, undefined, PARENT.PWD_PATH, undefined);
	else
		var mkdir = terminal_mkdir(["mkdir", "Newfolder_" + string(ID), undefined], undefined, PWD, undefined, PARENT.PWD_PATH, undefined);
	PARENT.FOLDER_LIST = UpdateFileExplorer(PARENT.PWD, PARENT.PWD_PATH, PARENT.FOLDER_LIST, PARENT.id);
	for (var e = 0; PARENT.FOLDER_LIST[e] != undefined; ) { e++; }
	e -= 1;
	PARENT.FOLDER_LIST[e].WRITE.ON_WRITE = true;
	PARENT.FOLDER_LIST[e].WRITE.BAR.x = PARENT.FOLDER_LIST[e].TEXT_CONNECT.x;
	var refresh = PARENT.EXPLORER_RELOAD;
	refresh.REFRESH = true;
	refresh.visible = false;
	if (refresh.REFRESH_LOAD == undefined || !instance_exists(refresh.REFRESH_LOAD))	
		refresh.REFRESH_LOAD = CreateObjectSprite(x, y, layer, S_File_Explorer_Load, OJustGUI, "IMAGE", refresh.TAG + "LOAD", [undefined]);
	refresh.REFRESH_TIME = 0.5;
	var rect = false;
	if (PARENT.FOLDER_LIST[e].y > PARENT.bbox_bottom - 70)
		rect = true;
	for (; PARENT.FOLDER_LIST[e].y > PARENT.bbox_bottom - 70;) {
		for (var i = 0; PARENT.FOLDER_LIST[i] != undefined; i++) {
			PARENT.FOLDER_LIST[i].PARENT_DIFF_Y -= 24;
			PARENT.FOLDER_LIST[i].y -= 24;
		}
	}
	if (rect)
		rectsape_folder(PARENT.id, undefined);
}
