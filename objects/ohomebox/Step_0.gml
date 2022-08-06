

// DEVKIT
DevKit(id);


if (OPTION_MENU != undefined && (mouse_check_button_pressed(mb_any) && !MouseInside(OPTION_MENU.x, OPTION_MENU.x + OPTION_MENU.SIZE_X, OPTION_MENU.y, OPTION_MENU.y + OPTION_MENU.SIZE_Y))) {
	for (var i = 0; ON_MAIN_SCENE.HOME.ALL_FILES_LIST[i] != undefined; i++)
		ON_MAIN_SCENE.HOME.ALL_FILES_LIST[i].ON = true;
	for (var i = 0; ON_MAIN_SCENE.HOME.ALL_APPS_LIST[i] != undefined; i++) {
		var obj = ON_MAIN_SCENE.HOME.ALL_APPS_LIST[i][1];
		if (obj == undefined || !instance_exists(obj))
			continue;
		obj.ON = true;
	}
	for (var i = 0; OPTION_MENU.BUTTONS[i]; i++) {
		var btn = OPTION_MENU.BUTTONS[i];
		DestroyText(btn.TEXT_CONNECT.TAG);
		DestroyObject(btn.OBJECT_LINKED.TAG);
		DestroyObject(btn.TAG);
	}
	DestroyObject(OPTION_MENU.TAG); OPTION_MENU = undefined;
}

if (!MouseInsideObject(id) || !mouse_check_button_pressed(mb_left)) { return; }

if (TAG == "HOME_POWER") {
	for (var i = 0; ON_MAIN_SCENE.HOME.ALL_FILES_LIST[i] != undefined; i++)
		ON_MAIN_SCENE.HOME.ALL_FILES_LIST[i].ON = false;
	for (var i = 0; ON_MAIN_SCENE.HOME.ALL_APPS_LIST[i] != undefined; i++) {
		var obj = ON_MAIN_SCENE.HOME.ALL_APPS_LIST[i][1];
		if (obj == undefined || !instance_exists(obj))
			continue;
		obj.ON = false;
	}
	var Y = y - 20;
	var SIZE_X = (sprite_width) + 120;
	var SIZE_Y = 125;
	var XBUTTON = x;
	var YBUTTON = y - 50;
	var shutdown = CreateSimpleEmptyButton(OHomeEmpty, XBUTTON, YBUTTON, 130, 30, c_white, #EEEEEE, "Home_Gp5", "Home_Gp6", S_home_shutdown, Segoe10, AutoLanguage("Turn off"), "HOME_OPTION_POWER_OFF", "EMPT_BUTTON-NO-HAND",  [["SLIDE", 0.00005], ["FADE_IN", 0.000005], ["CENTERED"], undefined]);
	var restart = CreateSimpleEmptyButton(OHomeEmpty, XBUTTON, YBUTTON, 130, 30, c_white, #EEEEEE, "Home_Gp5", "Home_Gp6", S_home_restart, Segoe10,  AutoLanguage("Restart"), "HOME_OPTION_RESTART", "EMPT_BUTTON-NO-HAND",  [["SLIDE", 0.00005], ["FADE_IN", 0.000005], ["CENTERED"], undefined]);
	var standby = CreateSimpleEmptyButton(OHomeEmpty, XBUTTON, YBUTTON, 130, 30, c_white, #EEEEEE, "Home_Gp5", "Home_Gp6", S_home_sleep, Segoe10,  AutoLanguage("Standby"), "HOME_OPTION_STANDBY", "EMPT_BUTTON-NO-HAND",  [["SLIDE", 0.00005], ["FADE_IN", 0.000005], ["CENTERED"], undefined]);
	var BUTTONS = [standby, restart, shutdown, undefined];
	OPTION_MENU = CreateEmptyRoundButton(OHomeEmpty, x, Y, c_white, BUTTONS, 5, "Home_Gp4", "HOME_OPTION_MENU", [["SLIDE", 0.00005], ["FADE_IN", 0.000005], ["EXT", c_gray, 10, 2], undefined]);
}