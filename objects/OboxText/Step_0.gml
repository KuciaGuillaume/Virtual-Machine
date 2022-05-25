/// @Project by Kucia Guillaume* ///

if (TAG == "NULL")
	return;
//GET OPTIONS
for (var i = 0; OPTION[i] != "NULL"; i++) {
	if (OPTION[i][0] == "LOCK")
		LOCK = OPTION[i];
	if (OPTION[i][0] == "POSITIONS") {OPT_POSITIONS = true; OPT_X = OPTION[i][1]; OPT_Y = OPTION[i][2]; }
	if (OPTION[i][0] == "FADE_ON") { FADE_ON = true; FADE_ON_POWER = OPTION[i][1]; }
	if (OPTION[i][0] == "FADE_IN" && !FADE_SATE) { 
		FADE_IN = true; FADE_POWER = OPTION[i][1];
		FADE_SATE = true; image_alpha = 0;
	}
}

if (!FIRST_PASS && !FADE_IN) { FIRST_PASS = true; image_alpha = 2; } 

// FADE_IN

if (FADE_IN && image_alpha < 1)
	image_alpha += FADE_POWER * delta_time;
else
	FADE_IN = false;
	
	
if (TAG == "SUTDOWN") { if (y > 990) { y -= 0.0001 * delta_time; TEXT_CONNECT.y = y; } }
if (TAG == "RESTART") { if (y > 965) { y -= 0.0001 * delta_time; TEXT_CONNECT.y = y; } }


// POSITIONS
if (OPT_POSITIONS && TEXT_CONNECT != "NULL") {TEXT_CONNECT.x = OPT_X; TEXT_CONNECT.y = OPT_Y; }

// REGISTER BUTTON
if (LOCK[0] != "NULL" && !LOCK[1].LOCK_STATE || (WALLPAPER && global.USER[7] == WALLPAPER_INDEX)) {
	image_index = 2;
	TEXT_CONNECT.image_alpha = 0.5;
	if (WALLPAPER) { TEXT_CONNECT.TEXT = "Currently select"; }
	return;
} else if (image_index == 2) {
	image_index = 0;
	TEXT_CONNECT.image_alpha = 1;
	if (WALLPAPER) { TEXT_CONNECT.COLOR = c_white; TEXT_CONNECT.TEXT = "Select this one"; }
}

if (TAG == "PHOTO") {
	var get = GetObject("ON_PHOTO");
	
	if (get == "NULL")
		IN = MouseInside(bbox_left, bbox_right, bbox_top, bbox_bottom);
	else if (get.TAG == "ON_PHOTO")
		IN = MouseInside(get.bbox_left, get.bbox_right, get.bbox_top, get.bbox_bottom);
	if (IN) {
		if (get == "NULL") {
			CreateObjectSprite(x, y, "Gp3", SphotoOn, OJustGUI, "IMAGE", "ON_PHOTO", [["FADE_IN", 0.000003], "NULL"]);
			CreateButtonBox(x, y + 180, Sdislike, OboxText, "I do not like", "Gp4", "Gp5", Arial10, c_white, "DISLIKE", [["CENTERED"], ["FADE_IN", 0.000003], ["FADE_ON", 0.000003], "NULL"]);
			CreateButtonBox(x, y + 130, Slike, OboxText, "I love it", "Gp4", "Gp5", Arial10, c_white, "LIKE", [["CENTERED"], ["FADE_IN", 0.000003], ["FADE_ON", 0.000003], "NULL"]);
		} else if (get.image_alpha < 1) { get.image_alpha += 0.000003 * delta_time; }
	} else {
		if (get != "NULL")  {
			var dislike = GetObject("DISLIKE");
			var like = GetObject("LIKE");
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
	if (get != "NULL")
			image_alpha = 1 - get.image_alpha;
}

// DISLIKE
if (DISLIKE) {
	var get = GetObject("USER_BACKGROUND");
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
		SAVE_LIST = [global.USER, "NULL"];
		savegame_save("USER", SAVE_LIST);
		var like = GetObject("LIKE");
		like.image_index = 0;
		image_index = 0;
		get.image_alpha = 2;
	}
}

//LIKE
if (TAG == "LIKE") {
	var get = GetObject("USER_BACKGROUND");
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
	
	global.USER[0] = true;
	global.USER[1] = name;
	global.USER[2] = last;
	global.USER[3] = email;
	global.USER[4] = age;
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
	AddText(960, 400, "Perfect " + name + ", we will now personalize your profile", Arial25, c_white, "Gp2", "TEXT_P_PROFILE", [["CENTERED"], "NULL"]);
	var load = CreateObjects(960, 540, "Gp2", Oregister_load, "IMAGE", "LOAD_P_PROFILE", ["NULL"]);
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

	CreateObjects(960, 540, "Gp1", Oregister_background, "IMAGE", "REGISTER_BACKGROUND", ["NULL"]);
	var load = CreateObjects(960, 540, "Gp2", Oregister_load, "IMAGE", "REGISTER_LOAD", ["NULL"]);
	load.STATE = 0;
	load.TIMER = global.TIMER / 3;
	// CREATE TEXT
	AddText(960, 300, "We create your registration environment...", Arial35, c_white, "Gp2", "LAUNCH_REGISTER", [["CENTERED"], "NULL"]);
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
	AddText(960, 400, "Please wait...", Arial25, c_white, "Gp2", "WAIT", [["CENTERED"], "NULL"]);
	var load = CreateObjects(960, 540, "Gp2", Oregister_load, "IMAGE", "FINISH_LOAD", ["NULL"]);
	load.STATE = 2;
	load.TIMER = global.TIMER / 2;
	SAVE_LIST = [global.USER, "NULL"];
	savegame_save("USER", SAVE_LIST);
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
	SAVE_LIST = [global.USER, "NULL"];
	savegame_save("USER", SAVE_LIST);
}
if (TAG == "DISLIKE" && image_index == 0) {
	image_index = 1
	DISLIKE_TIME = 0;
	DISLIKE = true;
}
if (TAG == "SUTDOWN") Machine("END");
if (TAG == "RESTART") Machine("RESTART");
