/// @description Insert description here
// You can write your code in this editor


// EXIT GAME

TIME += delta_time / 1000000;
var get = GetObject("USER_BACKGROUND");
var photo = GetObject("ON_PHOTO");
var powers = GetObject("POWER_OPTION");

if (Y_pos == mouse_y && !KeyPressed(vk_anykey))
	MOVEMENT_TIME += delta_time / 1000000;
else
	MOVEMENT_TIME = 0;
if ((KeyPressed(vk_escape) || MOVEMENT_TIME >= 60) && MODE == 1) {
	MOVEMENT_TIME = 0;
	var image_get = GetObject("USER_BACKGROUND_VAGUE");
	image_get = image_get.image_index;
	DestroyTextButton("Password");
	DestroyObject("ICON_TURING");
	DestroyObject("IMAGE_WIFI");
	DestroyObject("POWER_OFF");
	DestroyObject("USER_ICON");
	DestroyText("NAME");
	DestroyText("FORGOT");
	DestroyObject("POWER_OPTION");
	DestroyButtonBox("SUTDOWN");
	DestroyButtonBox("RESTART");
	DestroyRound("POWER_OFF");
	DestroyNotification("REMEMBER_SENTENCE");
	DestroyText("EMAIL");
	DestroyText("WRONG_PASSWORD");
	DestroyButtonBox("OK")
	for (var i = 0; global.OBJECTS[i] != undefined; i++)
		DestroyObject(global.OBJECTS[i][3]);
	for (var i = 0; global.TEXT[i] != undefined; i++)
		DestroyText(global.TEXT[i][0]);
	for (var i = 0; global.WRITE[i] != undefined; i++)
		DestroyWrite(global.WRITE[i][0]);
	SWITCH_TO_CONNECT = false;
	TIME = 0;
	I = 0.000008;
	MODE = 0;
	TIME_PASS = 0;
	CreateObjects(960, 540, "Cursor",  Ocursor, "CURSOR", "CURSOR", [undefined]);
	var vague = CreateObjectSprite(0, 0, "Gp1", Suser_connect_background, OJustGUI, "IMAGE", "USER_BACKGROUND", [["FADE_IN", 0.0000005], undefined]);
	vague.SKIP = true;
	vague.image_index = image_get - 16;
	AddText(960, 240, "16:01", Segoe75, c_white, "Gp2", "CURRENT_TIME", [["CENTERED"],["FADE_IN", 0.0000005], undefined]);
	AddText(960, 320, "dimanche 22 mai", Arial15, c_white, "Gp2", "CURRENT_DATE", [["CENTERED"],["FADE_IN", 0.0000005], undefined]);
	CreateButtonBox(1737.5, 56.75, Sphoto, OboxText, "Do you like the displayed image ?", "Gp2", "Gp3", Arial10, c_white, "PHOTO", [["CENTERED"], ["POSITIONS", 1737.5, 90], undefined]);
	CreateObjectSprite(1866, 1041.15, "Gp2", Swifi, OJustGUI, "BUTTON-NO-HAND", "IMAGE_WIFI", [["INFO", "Wifi"], ["FADE_IN", 0.0000003], undefined]);
	return;
}

if (mouse_check_button_pressed(mb_left) && powers != undefined) {
	if (!MouseInside(powers.bbox_left, powers.bbox_right, powers.bbox_top, powers.bbox_bottom)
	&& powers.image_alpha >= 1) {
		DestroyObject("POWER_OPTION");
		DestroyButtonBox("SUTDOWN");
		DestroyButtonBox("RESTART");
	}
}

if (MODE == 1 && KeyPressed(vk_enter)) {
	var password = GetObject("Password");
	
	if (password == undefined)
		return;
	if (password.TEXT != global.USER[5]) {
		DestroyTextButton("Password");
		DestroyText("FORGOT");
		AddText(960, 650, "The password is incorrect, please try again", Segoe10, c_white, "Gp2", "WRONG_PASSWORD", [["CENTERED"], ["FADE_IN", 0.000005], undefined]);
		CreateButtonBox(960, 700, Sok, OboxText, "OK", "Gp2", "Gp3", Arial10, c_white, "OK", [["CENTERED"], ["FADE_IN", 0.000005], undefined]);
	} else {
		DestroyTextButton("Password");
		DestroyText("FORGOT");
		DestroyText("NAME");
		DestroyText("EMAIL");
		DestroyObject("ICON_TURING");
		DestroyObject("USER_ICON");
		DestroyObject("POWER_OFF");
		DestroyObject("IMAGE_WIFI");
		DestroyObject("CURSOR");
		MODE = 2;
		
		CreateObjectSprite(960, 550, "Gp2", Sstart_load, OJustGUI, "IMAGE", "SYSTEM_LOAD", [["FADE_IN", 0.0000006], undefined]);
		AddText(960, 600, "Login to your session..", Arial10, c_white, "Gp2", "CONNECTION", [["CENTERED"], ["FADE_IN", 0.0000006], undefined] )
	}
}

var get = GetObject("USER_BACKGROUND");

if (((KeyPressed(vk_anykey) || mouse_wheel_down()) || (mouse_check_button(mb_left) && photo == undefined)) && get != undefined && TIME > 1) {
	SWITCH_TO_CONNECT = true;
	CreateObjectSprite(0, 0, "Gp0", Suser_connect_background, OJustGUI, "IMAGE", "USER_BACKGROUND_VAGUE", [["INDEX_IMAGE", get.image_index + 16], ["FADE_IN", 0.0000009], undefined]);
	DestroyObject("PHOTO");
}

if (SWITCH_TO_CONNECT && TIME > 1) {
	var background = GetObject("USER_BACKGROUND");
	if (background == undefined)
		TIME_PASS += delta_time / 1000000;
	var text = GetText("PHOTO");
	if (text != undefined)
		text.visible = false;
	for (var i = 0; global.OBJECTS[i] != undefined  && TIME_PASS < 1; i++) {
		if (global.OBJECTS[i][2] != room || global.OBJECTS[i][3] == "USER_BACKGROUND_VAGUE"
		|| global.OBJECTS[i][3] == "CURSOR" || global.OBJECTS[i][3] == "USER_BLUR" || global.OBJECTS[i][3] == "IMAGE_WIFI"
		|| global.OBJECTS[i] == undefined)
			continue;
		var copy = global.OBJECTS[i][0];
		copy.y -= I * delta_time;
		copy.image_alpha -= 0.000001 * delta_time;
		if (copy.image_alpha <= 0)
			DestroyObject(copy.TAG);
	}
	for (var i = 0; global.TEXT[i] != undefined && TIME_PASS < 1; i++) {
		if (global.TEXT[i][2] != room || global.TEXT[i] == undefined)
			continue;
		var copy = global.TEXT[i][1];
		copy.y -= I * delta_time;
		copy.image_alpha -= 0.000001 * delta_time;
		if (copy.image_alpha <= 0)
			DestroyText(copy.TAG);
	}
	I *= 1.2;
	if (TIME_PASS > 0.2) {
		AddTextLink(960, 670, "I forgot my password", Arial10, c_white, #2980B9, "Gp2", "FORGOT", [["FADE_IN", 0.000001], ["CENTERED"], undefined]);
		CreateTextButton(960, 640, Senterpassword, "Password", "Gp1", "Gp2", c_white, Arial10, 20, "Password", [["FADE_IN", 0.00001], ["SECRET"], undefined]);
		var type = GetWrite("Password");
		type.ON_WRITE = true;
		CreateObjectSprite(960, 450, "Gp1", Sicon_turing, OJustGUI, "IMAGE", "ICON_TURING", [["FADE_IN", 0.00001], undefined]);
		AddText(960, 580, global.USER[1], Segoe25, c_white, "Gp2", "NAME", [["CENTERED"], ["FADE_IN", 0.00001], undefined]);
		AddText(960, 610, global.USER[3], Segoe10, c_white, "Gp2", "EMAIL", [["CENTERED"], ["FADE_IN", 0.00001], undefined]);
		if (global.USER[6][0] == 0)
			CreateObjectSprite(960, 450, "Gp2", Shomme, OJustGUI, "ICON", "USER_ICON", [["INDEX_IMAGE", global.USER[6][1]], ["FADE_IN", 0.00001], undefined]);
		else
			CreateObjectSprite(960, 450, "Gp2", Sfemme, OJustGUI, "ICON", "USER_ICON", [["INDEX_IMAGE", global.USER[6][1]], ["FADE_IN", 0.00001], undefined]);
		SWITCH_TO_CONNECT = false;
		MODE = 1;
		return;
	}
}

Y_pos = mouse_y;
