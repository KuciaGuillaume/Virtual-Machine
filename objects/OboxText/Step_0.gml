/// @Project by Kucia Guillaume* ///

if (TAG == undefined)
	return;

if (!FIRST_PASS && !FADE_IN) { FIRST_PASS = true; image_alpha = 2; } 

// FADE_IN

if (FADE_IN && image_alpha < 1)
	image_alpha += FADE_POWER * delta_time;
else
	FADE_IN = false;
	

if (SLIDE && image_alpha < 1) {
	if (TEXT_CONNECT != undefined)
		TEXT_CONNECT.y -= SLIDE_POWER * delta_time;
	y -= SLIDE_POWER * delta_time;
}

if (TAG == "SUTDOWN") { if (y > 980) { y -= 0.0001 * delta_time; TEXT_CONNECT.y = y; } }
if (TAG == "RESTART") { if (y > 940) { y -= 0.0001 * delta_time; TEXT_CONNECT.y = y; } }

// POSITIONS
if (OPT_POSITIONS && TEXT_CONNECT != undefined) {TEXT_CONNECT.x = OPT_X; TEXT_CONNECT.y = OPT_Y; }

// REGISTER BUTTON
if (LOCK[0] != undefined && !LOCK[1].LOCK_STATE || (WALLPAPER && global.USER[7] == WALLPAPER_INDEX)) {
	image_index = 2;
	TEXT_CONNECT.image_alpha = 0.5;
	if (WALLPAPER) { TEXT_CONNECT.TEXT = AutoLanguage("Currently select"); }
	return;
} else if (image_index == 2) {
	image_index = 0;
	TEXT_CONNECT.image_alpha = 1;
	if (WALLPAPER) { TEXT_CONNECT.COLOR = c_white; TEXT_CONNECT.TEXT = AutoLanguage("Select this one"); }
}

if (TAG == "PHOTO") {
	var get = GetObject("ON_PHOTO");
	
	if (get == undefined)
		IN = MouseInside(bbox_left, bbox_right, bbox_top, bbox_bottom);
	else if (get.TAG == "ON_PHOTO")
		IN = MouseInside(get.bbox_left, get.bbox_right, get.bbox_top, get.bbox_bottom);
	if (IN) {
		if (get == undefined) {
			CreateObjectSprite(x, y, "Gp3", SphotoOn, OJustGUI, "IMAGE", "ON_PHOTO", [["FADE_IN", 0.000003], undefined]);
			CreateButtonBox(x, y + 180, Sdislike, OboxText, AutoLanguage("I do not like"), "Gp4", "Gp5", Arial10, c_white, "DISLIKE", [["CENTERED"], ["FADE_IN", 0.000003], ["FADE_ON", 0.000003], undefined]);
			CreateButtonBox(x, y + 130, Slike, OboxText, AutoLanguage("I love it"), "Gp4", "Gp5", Arial10, c_white, "LIKE", [["CENTERED"], ["FADE_IN", 0.000003], ["FADE_ON", 0.000003], undefined]);
		} else if (get.image_alpha < 1) { get.image_alpha += 0.000003 * delta_time; }
	} else {
		if (get != undefined)  {
			var dislike = GetObject("DISLIKE");
			var like = GetObject("LIKE");
			if (dislike == undefined || like == undefined)
				return;
			get.image_alpha -= 0.000003 * delta_time;
			dislike.TEXT_CONNECT.image_alpha -= 0.000005 * delta_time;
			like.TEXT_CONNECT.image_alpha -= 0.000005 * delta_time;
			if (get.image_alpha <= 0) {
				DestroyObject("ON_PHOTO");
				DestroyButtonBox("DISLIKE");
				DestroyButtonBox("LIKE");
			}
		}
	}
	if (get != undefined)
			image_alpha = 1 - get.image_alpha;
}

// DISLIKE
if (DISLIKE) {
	var get = GetObject("USER_BACKGROUND");
	if (get == undefined)
		return;
	get.image_alpha -= 0.000002 * delta_time;
	if (get.image_alpha <= 0) {
		DISLIKE = false;
		get.USER_TIME = 0;
		global.USER[9][get.image_index] = -1;
		randomize();
		var i = random_range(0, 15);
		var all_negative = true;
		for (; i == get.image_index || global.USER[9][i] < 0;) {
			i = random_range(0, 15);
			for (var e = 0; e != 15; e++)
				if (global.USER[9][e] >= 0) { all_negative = false; }
			if (all_negative) {
				i = 0;
				break;
			}
				
		}
		get.image_index = i;
		var like = GetObject("LIKE");
		like.image_index = 0;
		image_index = 0;
		get.image_alpha = 2;
	}
}

//LIKE
if (TAG == "LIKE") {
	var get = GetObject("USER_BACKGROUND");
	if (get == undefined)
		return;
	if (global.USER[9][get.image_index] > 0)
		image_index = 1;
}

if (mouse_x < bbox_left || mouse_x > bbox_right)
	return;
if (mouse_y < bbox_top || mouse_y > bbox_bottom)
	return;
	
if (!mouse_check_button_pressed(mb_left))
	return;

if (TAG == "TURN OFF") Machine("END");
if (TAG == "RESTART MACHINE") Machine("RESTART");
if (TAG == "REGISTER") {
	var g_name = GetWrite("FULL_NAME"); name = g_name.TEXT_OUTPUT;
	var g_last = GetWrite("LAST_NAME"); last = g_last.TEXT_OUTPUT;
	var g_email = GetWrite("EMAIL"); email = g_email.TEXT_OUTPUT;
	var g_age = GetWrite("AGE"); age = g_age.TEXT_OUTPUT;
	var g_password = GetWrite("Password 1"); password = g_password.TEXT_OUTPUT;
	
	global.USER[0]= true;
	global.USER[1] = name;
	global.USER[2] = last;
	global.USER[3] = email;
	global.USER[4]= age;
	global.USER[5] = password;
	
	DestroyText("REGISTER ERROR");
	DestroyTextButton("FULL_NAME");
	DestroyTextButton("LAST_NAME");
	DestroyTextButton("EMAIL");
	DestroyTextButton("AGE");
	DestroyTextButton("Password 1");
	DestroyTextButton("Password 2");
	DestroyText("FILL");
	DestroyText("FILL_DESCRIPTION");
	DestroyButtonBox("TURN OFF");
	DestroyButtonBox("RESTART MACHINE");
	DestroyButtonBox("REGISTER");
	DestroyTextButton("HELP TEXT");
	AddText(960, 400, AutoLanguage("Perfect") + " " + name + ", " + AutoLanguage("we will now personalize your profile"), Arial25, c_white, "Gp2", "TEXT_P_PROFILE", [["CENTERED"], undefined]);
	var load = CreateObjects(960, 540, "Gp2", Oregister_load, "IMAGE", "LOAD_P_PROFILE", [undefined]);
	load.STATE = 1;
	ON_REGISTER_UPDATE.LOCK_STATE = false;
}

if (TAG == "EDIT PREVIOUS") {
	DestroyObject("GUI_ICON_BOX");
	DestroyObject("GUI_BACKGROUND_BOX");
	DestroyText("EDIT_EXPERIENCE");
	DestroyText("EDIT_EXPERIENCE_DESCRIPTION");
	DestroyButtonBox("TURN OFF");
	DestroyButtonBox("RESTART MACHINE");
	DestroyButtonBox("EDIT PREVIOUS");
	DestroyButtonImage("EDIT_ICON_1");DestroyButtonImage("EDIT_ICON_2");
	DestroyButtonImage("EDIT_ICON_3");DestroyButtonImage("EDIT_ICON_4");
	DestroyButtonImage("EDIT_ICON_5");DestroyButtonImage("EDIT_ICON_6");
	DestroyButtonImage("EDIT_ICON_7");DestroyButtonImage("EDIT_ICON_8");
	DestroyObject("GUI_SELECT_BACKGROUNDS");
	DestroyObject("SCROLL_IMAGE_BAR");
	DestroyText("BACKGROUND_TITLE");
	DestroyText("BACKGROUND_DESCRIPTION");
	DestroyButtonBox("BACKGROUND_SELECTOR");
	// CREATE OBJECTS

	CreateObjects(960, 540, "Gp1", Oregister_background, "IMAGE", "REGISTER_BACKGROUND", [undefined]);
	var load = CreateObjects(960, 540, "Gp2", Oregister_load, "IMAGE", "REGISTER_LOAD", [undefined]);
	load.STATE = 0;
	load.TIMER = global.TIMER / 3;
	// CREATE TEXT
	AddText(960, 300, AutoLanguage("We create your registration environment..."), Arial35, c_white, "Gp2", "LAUNCH_REGISTER", [["CENTERED"], undefined]);
	DestroyButtonBox("EDIT_FINISH");
}

if (TAG == "EDIT_FINISH") {
	DestroyObject("GUI_ICON_BOX");
	DestroyObject("GUI_BACKGROUND_BOX");
	DestroyText("EDIT_EXPERIENCE");
	DestroyText("EDIT_EXPERIENCE_DESCRIPTION");
	DestroyButtonBox("TURN OFF");
	DestroyButtonBox("RESTART MACHINE");
	DestroyButtonBox("EDIT PREVIOUS");
	DestroyButtonImage("EDIT_ICON_1");DestroyButtonImage("EDIT_ICON_2");
	DestroyButtonImage("EDIT_ICON_3");DestroyButtonImage("EDIT_ICON_4");
	DestroyButtonImage("EDIT_ICON_5");DestroyButtonImage("EDIT_ICON_6");
	DestroyButtonImage("EDIT_ICON_7");DestroyButtonImage("EDIT_ICON_8");
	DestroyObject("GUI_SELECT_BACKGROUNDS");
	DestroyText("BACKGROUND_TITLE");DestroyText("BACKGROUND_DESCRIPTION");
	DestroyButtonBox("BACKGROUND_SELECTOR");
	DestroyButtonBox("EDIT_FINISH");
	DestroyObject("ON_BACKGROUNDS");
	AddText(960, 400, AutoLanguage("Please wait..."), Arial25, c_white, "Gp2", "WAIT", [["CENTERED"], undefined]);
	var load = CreateObjects(960, 540, "Gp2", Oregister_load, "IMAGE", "FINISH_LOAD", [undefined]);
	load.STATE = 2;
	load.TIMER = global.TIMER / 2;
	DestroyObject("REGISTER_CURSOR");
}

if (TAG == "BACKGROUND_SELECTOR") {
	global.USER[7] = WALLPAPER_INDEX;
	WALLPAPER = true;
}

if (TAG == "LIKE") {
	var get = GetObject("USER_BACKGROUND");
	image_index = 1;
	global.USER[9][get.image_index] = 1;
}
if (TAG == "DISLIKE" && image_index == 0) {
	image_index = 1
	DISLIKE_TIME = 0;
	DISLIKE = true;
}
if (TAG == "SUTDOWN") Machine("END");
if (TAG == "RESTART") Machine("RESTART");

if (TAG == "OK") {
	DestroyText("WRONG_PASSWORD");
	AddTextLink(960, 670, AutoLanguage("I forgot my password"), Arial10, c_white, #2980B9, "Gp2", "FORGOT", [["FADE_IN", 0.000001], ["CENTERED"], undefined]);
	CreateTextButton(960, 640, Senterpassword, "Password", "Gp1", "Gp2", c_white, Arial10, 20, "Password", [["FADE_IN", 0.00001], ["SECRET"], undefined]);
	var type = GetWrite("Password");
	type.ON_WRITE = true;
	type.ON_WRITE = true;
	DestroyButtonBox("OK");
}

if (TAG == "RENAME_FOLDER_SLIDERS") {
	mouse_clear(mb_right);
	mouse_clear(mb_left);
	ON_MAIN_SCENE.FOLDERS[NUM_LINKED].WRITE.ON_WRITE = true;
	ON_MAIN_SCENE.FOLDERS[NUM_LINKED].WRITE.BAR.x = ON_MAIN_SCENE.FOLDERS[NUM_LINKED].TEXT_CONNECT.x;
	DestroyObject(PARENT.TAG);
	DestroyButtonBox("DELETE_FOLDER_SLIDERS");
	DestroyButtonBox("RENAME_FOLDER_SLIDERS");
	ON_MAIN_SCENE.DESK_SLIDER_OBJECT = undefined;
}

if (TAG == "DESK_OPEN_IN_FILE_EXPLORER") {
	var window = CreateWindow(S_File_explorer_Bk, OJustGUI_File_explorer, "FILE_EXPLORER", S_File_explorer_icon, AutoLanguage("File_explorer"));
	if (window != undefined) {
		window.WINDOW_BK.PWD = ON_MAIN_SCENE.PATH[1];
		window.WINDOW_BK.PWD_PATH = "/~/" + AutoLanguage("Desk");
	}
	DestroyObject(PARENT.TAG);
	DestroyButtonBox("NEW_FOLDER_SLIDERS");
	DestroyObject(TAG);
}

if (string_count("RENAME_EXPLORERS_FOLDERS", TAG) > 0) {
	mouse_clear(mb_right);
	mouse_clear(mb_left);
	for (var i = 1; PARENT.PARENT.PWD[i][0][0][0] != PARENT.PARENT.FOLDER_LIST[NUM_LINKED].NAME; ) { i++; }
	if (string_char_at(PARENT.PARENT.PWD[i][0][0][4], 3) == ".") {
		var parent = PARENT.PARENT;
		if (parent.WARNING_GUI == undefined) {
			parent.WARNING_GUI = CreateObjectSprite(parent.x + 120, parent.y + 560, parent.WINDOW.LAYERS[2], S_FIles_Explorer_warning, OJustGUI, "IMAGE", parent.TAG + "WARNING", [["TIME_OUT", 2], ["FADE_IN", 0.00001], ["SLIDE", 0.0001], undefined]);
			parent.WARNING_GUI.TEXT_CONNECT = AddText(parent.x + 120, parent.y + 560, AutoLanguage("You do not have permission to modify this file/folder"), Arial10, c_black, parent.WINDOW.LAYERS[3], parent.TAG + "TEXT_WARNING", [["CENTERED"], undefined]);
			parent.WINDOW.list_objects = addtolist(parent.WARNING_GUI, parent.WINDOW.list_objects);
			parent.WARNING_GUI.PARENT = parent;
		}
		DestroyObject(PARENT.TAG);
		DestroyButtonBox(PARENT.PARENT.TAG + "EXPLORERS_OPEN_IN_ANOTHER");
		DestroyButtonBox(parent.TAG + "DELETE_EXPLORERS_FOLDERS");
		DestroyButtonBox(parent.TAG + "RENAME_EXPLORERS_FOLDERS");
		PARENT.PARENT.EXPLORER_SLIDER = undefined;
		return;
	}
	PARENT.PARENT.FOLDER_LIST[NUM_LINKED].WRITE.ON_WRITE = true;
	PARENT.PARENT.FOLDER_LIST[NUM_LINKED].WRITE.BAR.x = PARENT.PARENT.FOLDER_LIST[NUM_LINKED].TEXT_CONNECT.x;
	PARENT.PARENT.EXPLORER_SLIDER = undefined;
	var refresh = PARENT.PARENT.EXPLORER_RELOAD;
	refresh.REFRESH = true;
	refresh.visible = false;
	if (refresh.REFRESH_LOAD == undefined || !instance_exists(refresh.REFRESH_LOAD))	
		refresh.REFRESH_LOAD = CreateObjectSprite(x, y, layer, S_File_Explorer_Load, OJustGUI, "IMAGE", PARENT.PARENT.EXPLORER_RELOAD.TAG + "LOAD", [undefined]);
	refresh.REFRESH_TIME = 0.5;
	DestroyObject(PARENT.TAG);
	DestroyButtonBox(PARENT.PARENT.TAG + "DELETE_EXPLORERS_FOLDERS");
	DestroyButtonBox(PARENT.PARENT.TAG + "EXPLORERS_OPEN_IN_ANOTHER");	
	DestroyButtonBox(PARENT.PARENT.TAG + "RENAME_EXPLORERS_FOLDERS");
}

if (string_count("EXPLORERS_OPEN_IN_ANOTHER", TAG) > 0) {
	mouse_clear(mb_right);
	mouse_clear(mb_left);
	var window = CreateWindow(S_File_explorer_Bk, OJustGUI_File_explorer, "FILE_EXPLORER", S_File_explorer_icon, AutoLanguage("File_explorer"));
	window.WINDOW_BK.PWD = go_to_path(ON_MAIN_SCENE.PATH, PARENT.PARENT.PWD_PATH + "/" + PARENT.PARENT.FOLDER_LIST[NUM_LINKED].NAME);
	window.WINDOW_BK.PWD_PATH = PARENT.PARENT.PWD_PATH + "/" + PARENT.PARENT.FOLDER_LIST[NUM_LINKED].NAME;
	PARENT.PARENT.EXPLORER_SLIDER = undefined;
	var refresh = PARENT.PARENT.EXPLORER_RELOAD;
	refresh.REFRESH = true;
	refresh.visible = false;
	if (refresh.REFRESH_LOAD == undefined || !instance_exists(refresh.REFRESH_LOAD))	
		refresh.REFRESH_LOAD = CreateObjectSprite(x, y, layer, S_File_Explorer_Load, OJustGUI, "IMAGE", PARENT.PARENT.EXPLORER_RELOAD.TAG + "LOAD", [undefined]);
	refresh.REFRESH_TIME = 0.5;
	DestroyObject(PARENT.TAG);
	DestroyButtonBox(PARENT.PARENT.TAG + "DELETE_EXPLORERS_FOLDERS");
	DestroyButtonBox(PARENT.PARENT.TAG + "RENAME_EXPLORERS_FOLDERS");
	DestroyButtonBox(PARENT.PARENT.TAG + "EXPLORERS_OPEN_IN_ANOTHER");	
}

if (TAG == "NEW_FOLDER_SLIDERS") {
	var new_folder = AutoLanguage("Newfolder");
	var PWD = ON_MAIN_SCENE.PATH[1];
	var ID = 0;
	for (var i = 1; PWD[i] != undefined; i++) {
		if (is_array(PWD[i]) && string_count(new_folder, PWD[i][0][0][0]) > 0)
			ID += 1;
	}
	if (ID <= 0)
		var mkdir = terminal_mkdir(["mkdir", new_folder, undefined], undefined, PWD, undefined, "/~/" + AutoLanguage("Desk"), undefined, "xxx");
	else
		var mkdir = terminal_mkdir(["mkdir", new_folder + "_" + string(ID), undefined], undefined, PWD, undefined, "/~/" + AutoLanguage("Desk"), undefined, "xxx");
	var folder = mkdir[2];
	folder.WRITE.ON_WRITE = true;
	DestroyObject(PARENT.TAG);
	DestroyButtonBox("NEW_FOLDER_SLIDERS");
	DestroyButtonBox("DESK_OPEN_IN_FILE_EXPLORER");
	ON_MAIN_SCENE.DESK_SLIDER_OBJECT = undefined;
}

if (string_count("NEW_EXPLORERS_FOLDERS", TAG) > 0) {
	var new_folder = AutoLanguage("Newfolder");
	var PWD = PARENT.PARENT.PWD;
	var ID = 0;
	for (var i = 1; PWD[i] != undefined; i++) {
		if (is_array(PWD[i]) && string_count(new_folder, PWD[i][0][0][0]) > 0)
			ID += 1;
	}
	if (ID <= 0)
		var mkdir = terminal_mkdir(["mkdir", new_folder, undefined], undefined, PWD, undefined, PARENT.PARENT.PWD_PATH, undefined, "xxx");
	else
		var mkdir = terminal_mkdir(["mkdir", new_folder + "_" + string(ID), undefined], undefined, PWD, undefined, PARENT.PARENT.PWD_PATH, undefined, "xxx");
	PARENT.PARENT.FOLDER_LIST = UpdateFileExplorer(PARENT.PARENT.PWD, PARENT.PARENT.PWD_PATH, PARENT.PARENT.FOLDER_LIST, PARENT.PARENT.id);
	for (var e = 0; PARENT.PARENT.FOLDER_LIST[e] != undefined; ) { e++; }
	e -= 1;
	PARENT.PARENT.FOLDER_LIST[e].WRITE.ON_WRITE = true;
	PARENT.PARENT.FOLDER_LIST[e].WRITE.BAR.x = PARENT.PARENT.FOLDER_LIST[e].TEXT_CONNECT.x;
	PARENT.PARENT.FOLDER_LIST[e].MASTER_NAME = PARENT.PARENT.FOLDER_LIST[e].NAME;
	PARENT.PARENT.EXPLORER_SLIDER = undefined;
	var refresh = PARENT.PARENT.EXPLORER_RELOAD;
	refresh.REFRESH = true;
	refresh.visible = false;
	if (refresh.REFRESH_LOAD == undefined || !instance_exists(refresh.REFRESH_LOAD))	
		refresh.REFRESH_LOAD = CreateObjectSprite(x, y, layer, S_File_Explorer_Load, OJustGUI, "IMAGE", PARENT.PARENT.EXPLORER_RELOAD.TAG + "LOAD", [undefined]);
	refresh.REFRESH_TIME = 0.5;
	DestroyObject(PARENT.TAG);
	DestroyButtonBox(PARENT.PARENT.TAG + "NEW_EXPLORERS_FOLDERS");
}

if (TAG == "DELETE_FOLDER_SLIDERS") {
	var PWD = ON_MAIN_SCENE.PATH[1];
	terminal_rm(["rm", ON_MAIN_SCENE.FOLDERS[NUM_LINKED].TEXT_CONNECT.TEXT, undefined], undefined, PWD, undefined, "/~/" + AutoLanguage("Desk"), undefined);
	DestroyObject(PARENT.TAG);
	DestroyButtonBox("RENAME_FOLDER_SLIDERS");
	DestroyButtonBox("DELETE_FOLDER_SLIDERS");
	ON_MAIN_SCENE.DESK_SLIDER_OBJECT = undefined;
}

if (string_count("DELETE_EXPLORERS_FOLDERS", TAG) > 0) {
	var PWD = PARENT.PARENT.PWD;
	for (var i = 1; PARENT.PARENT.PWD[i][0][0][0] != PARENT.PARENT.FOLDER_LIST[NUM_LINKED].NAME; ) { i++; }
	
	if (string_char_at(PARENT.PARENT.PWD[i][0][0][4], 3) == ".") {
		var parent = PARENT.PARENT;
		if (parent.WARNING_GUI == undefined) {
			parent.WARNING_GUI = CreateObjectSprite(parent.x + 120, parent.y + 560, parent.WINDOW.LAYERS[2], S_FIles_Explorer_warning, OJustGUI, "IMAGE", parent.TAG + "WARNING", [["TIME_OUT", 2], ["FADE_IN", 0.00001], ["SLIDE", 0.0001], undefined]);
			parent.WARNING_GUI.TEXT_CONNECT = AddText(parent.x + 120, parent.y + 560, AutoLanguage("You do not have permission to modify this file/folder"), Arial10, c_black, parent.WINDOW.LAYERS[3], parent.TAG + "TEXT_WARNING", [["CENTERED"], undefined]);
			parent.WINDOW.list_objects = addtolist(parent.WARNING_GUI, parent.WINDOW.list_objects);
			parent.WARNING_GUI.PARENT = parent;
		}
		DestroyObject(PARENT.TAG);
		DestroyButtonBox(PARENT.PARENT.TAG + "EXPLORERS_OPEN_IN_ANOTHER");
		DestroyButtonBox(parent.TAG + "DELETE_EXPLORERS_FOLDERS");
		DestroyButtonBox(parent.TAG + "RENAME_EXPLORERS_FOLDERS");
		PARENT.PARENT.EXPLORER_SLIDER = undefined;
		return;
	}
	if (PARENT.PARENT.FOLDER_LIST[0] == PARENT.PARENT.FOLDER_LIST[NUM_LINKED]) {
		for (var i = 0; PARENT.PARENT.FOLDER_LIST[i] != undefined; i++) {
			PARENT.PARENT.FOLDER_LIST[i].y -= 24;
			PARENT.PARENT.FOLDER_LIST[i].PARENT_DIFF_Y -= 24;
		}
	}
	terminal_rm(["rm", PARENT.PARENT.FOLDER_LIST[NUM_LINKED].TEXT_CONNECT.TEXT, undefined], undefined, PWD, undefined, PARENT.PARENT.PWD_PATH, undefined);
	PARENT.PARENT.FOLDER_LIST = UpdateFileExplorer(PARENT.PARENT.PWD, PARENT.PARENT.PWD_PATH, PARENT.PARENT.FOLDER_LIST, PARENT.PARENT.id);
	PARENT.PARENT.EXPLORER_SLIDER = undefined;
	var refresh = PARENT.PARENT.EXPLORER_RELOAD;
	refresh.REFRESH = true;
	refresh.visible = false;
	if (refresh.REFRESH_LOAD == undefined || !instance_exists(refresh.REFRESH_LOAD))	
		refresh.REFRESH_LOAD = CreateObjectSprite(x, y, layer, S_File_Explorer_Load, OJustGUI, "IMAGE", PARENT.PARENT.EXPLORER_RELOAD.TAG + "LOAD", [undefined]);
	refresh.REFRESH_TIME = 0.5;
	DestroyObject(PARENT.TAG);
	DestroyButtonBox(PARENT.PARENT.TAG + "RENAME_EXPLORERS_FOLDERS");
	DestroyButtonBox(PARENT.PARENT.TAG + "EXPLORERS_OPEN_IN_ANOTHER");
	DestroyButtonBox(PARENT.PARENT.TAG + "DELETE_EXPLORERS_FOLDERS");
}