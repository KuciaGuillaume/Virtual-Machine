/// @description Insert description here
// You can write your code in this editor


// EXIT GAME

if (KeyPressed(vk_escape))
	game_end();
else if (KeyPressed(vk_anykey)) {
	SWITCH_TO_CONNECT = true;
	var get = GetObject("USER_BACKGROUND");
	CreateObjectSprite(0, 0, "Gp0", Suser_connect_background, OJustGUI, "IMAGE", "USER_BACKGROUND_VAGUE", [["INDEX_IMAGE", get.image_index], ["FADE_IN", 0.0000009], "NULL"]);
}

if (SWITCH_TO_CONNECT) {
	var text = GetText("PHOTO");
	if (text != "NULL")
		text.visible = false;
	for (var i = 0; global.OBJECTS[i] != "NULL"; i++) {
		if (global.OBJECTS[i][2] != room || global.OBJECTS[i][3] == "USER_BACKGROUND_VAGUE"
		|| global.OBJECTS[i][3] == "CURSOR")
			continue;
		var copy = global.OBJECTS[i][0];
		copy.y -= 0.0008 * delta_time;
		copy.image_alpha -= 0.0000008 * delta_time;
		if (copy.y + copy.sprite_height < 0)
			DestroyObject(copy.TAG);
	}
	for (var i = 0; global.TEXT[i] != "NULL"; i++) {
		if (global.TEXT[i][2] != room)
			continue;
		var copy = global.TEXT[i][1];
		copy.y -= 0.0008 * delta_time;
		copy.image_alpha -= 0.0000008 * delta_time;
		if (copy.y + copy.TEXT_HEIGHT < 0)
			DestroyText(copy.TAG);
	}
}
