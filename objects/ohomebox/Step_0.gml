

// DEVKIT
DevKit(id);


if (OPTION_MENU != undefined && (mouse_check_button_pressed(mb_any) && !MouseInside(OPTION_MENU.x, OPTION_MENU.x + OPTION_MENU.SIZE_X, OPTION_MENU.y, OPTION_MENU.y + OPTION_MENU.SIZE_Y))) {
	DestroyObject(OPTION_MENU.TAG); OPTION_MENU = undefined; }

if (!MouseInsideObject(id) || !mouse_check_button_pressed(mb_left)) { return; }

if (TAG == "HOME_POWER") {
	var X = x - (sprite_width/2) - 60;
	var Y = y - 140;
	var SIZE_X = (sprite_width) + 120;
	var SIZE_Y = 125;
	OPTION_MENU = CreateEmptyRound(X, Y, c_white, SIZE_X, SIZE_Y, "Home_Gp2", "HOME_OPTION_MENU", [["EXT", c_gray, 10, 2], ["FADE_IN", 0.000005], ["SLIDE", 0.00005], undefined]);
	// CREATE BUTTON MENU
	var XBUTTON = x;
	var YBUTTON = y - 50;
	//var emptOBJ = GetEmptLinked(XBUTTON - 60, YBUTTON, "Home_Gp4", S_Home_power, OJustGUI, "IMAGE");
	//var emptTEXT = GetEmptText(XBUTTON, YBUTTON, "Power off", Arial10, c_black, c_black, "Home_Gp4");
	//var power_off = CreateEmptyButton(XBUTTON, YBUTTON, 130, 30, c_white, #EEEEEE, "Home_Gp3", emptOBJ, emptTEXT, "HOME_OPTION_POWER_OFF", "EMPT_BUTTON-NO-HAND", [["CENTERED"], undefined]);
	CreateSimpleEmptyButton(XBUTTON, YBUTTON, 130, 30, c_white, c_black, "Home_Gp3", "Home_Gp4", S_home_shutdown, "Power off", "HOME_OPTION_POWER_OFF", "EMPT_BUTTON-NO-HAND",  [["CENTERED"], undefined]);
}