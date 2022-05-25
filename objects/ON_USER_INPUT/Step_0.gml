/// @description Insert description here
// You can write your code in this editor


// EXIT GAME

TIME += delta_time / 1000000;
var get = GetObject("USER_BACKGROUND");
var photo = GetObject("ON_PHOTO");
var powers = GetObject("POWER_OPTION");

if (mouse_check_button_pressed(mb_left) && powers != "NULL") {
	if (!MouseInside(powers.bbox_left, powers.bbox_right, powers.bbox_top, powers.bbox_bottom)
	&& powers.image_alpha >= 1) {
		DestroyObject("POWER_OPTION");
		DestroyButtonBox("SUTDOWN");
		DestroyButtonBox("RESTART");
	}
}

if (KeyPressed(vk_escape))
	game_end();
else if ((KeyPressed(vk_anykey) || (mouse_check_button(mb_left) && photo == "NULL")) && get != "NULL" && TIME > 1) {
	SWITCH_TO_CONNECT = true;
	CreateObjectSprite(0, 0, "Gp0", Suser_connect_background, OJustGUI, "IMAGE", "USER_BACKGROUND_VAGUE", [["INDEX_IMAGE", get.image_index + 16], ["FADE_IN", 0.0000009], "NULL"]);
	DestroyObject("PHOTO");
}

//var is_on_connection = GetObject("USER_BACKGROUND_VAGUE");

//if (is_on_connection != "NULL") {
//	TIME_TO_RESET += delta_time / 1000000;
//	if (TIME_TO_RESET >= 60)
//		game_restart()
//}

if (SWITCH_TO_CONNECT && TIME > 1) {
	var background = GetObject("USER_BACKGROUND");
	if (background == "NULL")
		TIME_PASS += delta_time / 1000000;
	var text = GetText("PHOTO");
	if (text != "NULL")
		text.visible = false;
	for (var i = 0; global.OBJECTS[i] != "NULL"; i++) {
		if (global.OBJECTS[i][2] != room || global.OBJECTS[i][3] == "USER_BACKGROUND_VAGUE"
		|| global.OBJECTS[i][3] == "CURSOR" || global.OBJECTS[i][3] == "USER_BLUR" || global.OBJECTS[i][3] == "IMAGE_WIFI"
		|| global.OBJECTS[i] == "NULL")
			continue;
		var copy = global.OBJECTS[i][0];
		copy.y -= I * delta_time;
		copy.image_alpha -= 0.000001 * delta_time;
		if (copy.image_alpha <= 0)
			DestroyObject(copy.TAG);
	}
	for (var i = 0; global.TEXT[i] != "NULL"; i++) {
		if (global.TEXT[i][2] != room || global.TEXT[i] == "NULL")
			continue;
		var copy = global.TEXT[i][1];
		copy.y -= I * delta_time;
		copy.image_alpha -= 0.000001 * delta_time;
		if (copy.image_alpha <= 0)
			DestroyText(copy.TAG);
	}
	I *= 1.2;
	if (TIME_PASS > 1) {
		CreateTextButton(960, 640, Senterpassword, "Password", "Gp1", "Gp2", c_white, Arial10, 20, "Password", [["FADE_IN", 0.00001], ["SECRET"], "NULL"]);
		var type = GetWrite("Password");
		type.ON_WRITE = true;
		CreateObjectSprite(960, 450, "Gp1", Sicon_turing, OJustGUI, "IMAGE", "ICON_TURING", [["FADE_IN", 0.00001], "NULL"]);
		AddText(960, 600, global.USER[1], Segoe25, c_white, "Gp2", "NAME", [["CENTERED"], ["FADE_IN", 0.00001], "NULL"]);
		if (global.USER[6][0] == 0)
			CreateObjectSprite(960, 450, "Gp2", Shomme, OJustGUI, "ICON", "USER_ICON", [["INDEX_IMAGE", global.USER[6][1]], ["FADE_IN", 0.00001], "NULL"]);
		else
			CreateObjectSprite(960, 450, "Gp2", Sfemme, OJustGUI, "ICON", "USER_ICON", [["INDEX_IMAGE", global.USER[6][1]], ["FADE_IN", 0.00001], "NULL"]);
		SWITCH_TO_CONNECT = false;
		MODE = 1;
		return;
	}
}
