

// DEVKIT
DevKit(id);


if (OPTION_MENU != undefined && (mouse_check_button_pressed(mb_any) && !MouseInside(OPTION_MENU.x, OPTION_MENU.x + OPTION_MENU.SIZE_X, OPTION_MENU.y, OPTION_MENU.y + OPTION_MENU.SIZE_Y))) {
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
	var Y = y - 20;
	var SIZE_X = (sprite_width) + 120;
	var SIZE_Y = 125;
	var XBUTTON = x;
	var YBUTTON = y - 50;
	var shutdown = CreateSimpleEmptyButton(OHomeEmpty, XBUTTON, YBUTTON, 130, 30, c_white, #EEEEEE, "Home_Gp2", "Home_Gp3", S_home_shutdown, Segoe10, "Turn off", "HOME_OPTION_POWER_OFF", "EMPT_BUTTON-NO-HAND",  [["SLIDE", 0.00005], ["FADE_IN", 0.000005], ["CENTERED"], undefined]);
	var restart = CreateSimpleEmptyButton(OHomeEmpty, XBUTTON, YBUTTON, 130, 30, c_white, #EEEEEE, "Home_Gp2", "Home_Gp3", S_home_restart, Segoe10,  "Restart", "HOME_OPTION_RESTART", "EMPT_BUTTON-NO-HAND",  [["SLIDE", 0.00005], ["FADE_IN", 0.000005], ["CENTERED"], undefined]);
	var standby = CreateSimpleEmptyButton(OHomeEmpty, XBUTTON, YBUTTON, 130, 30, c_white, #EEEEEE, "Home_Gp2", "Home_Gp3", S_home_sleep, Segoe10,  "Standby", "HOME_OPTION_STANDBY", "EMPT_BUTTON-NO-HAND",  [["SLIDE", 0.00005], ["FADE_IN", 0.000005], ["CENTERED"], undefined]);
	var BUTTONS = [standby, restart, shutdown, undefined];
	OPTION_MENU = CreateEmptyRoundButton(OHomeEmpty, x, Y, c_white, BUTTONS, 5, "Home_Gp1", "HOME_OPTION_MENU", [["SLIDE", 0.00005], ["FADE_IN", 0.000005], ["EXT", c_gray, 10, 2], undefined]);
}