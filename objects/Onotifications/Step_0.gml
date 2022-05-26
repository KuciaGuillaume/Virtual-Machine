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

// NOTIFICATION ANIMATION
if (x > 1750) {
	var SPEED =  0.0009 * delta_time;
	x -= SPEED;
	ICON_CONNECT.x -= SPEED;
	TITLE_CONNECT.x -= SPEED;
	DESCRIPTION_CONNECT.x -= SPEED;
	CLOSE_CONNECT.x -= SPEED;
} else if (!MouseInside(bbox_left, bbox_right, bbox_top, bbox_bottom)) {
	NOTIF_TIME += delta_time / 1000000;
	if (NOTIF_TIME >= 5) {
		DestroyObject(ICON_CONNECT.TAG);
		DestroyText(TITLE_CONNECT.TAG);
		DestroyText(DESCRIPTION_CONNECT.TAG);
		DestroyObject(CLOSE_CONNECT.TAG);
		DestroyObject(TAG);
	}
} else
	NOTIF_TIME = 0;
	

// FADE_IN

if (FADE_IN && image_alpha < 1)
	image_alpha += FADE_POWER * delta_time;
else
	FADE_IN = false;

if (mouse_x < bbox_left || mouse_x > bbox_right)
	return;
if (mouse_y < bbox_top || mouse_y > bbox_bottom)
	return;
	
if (!mouse_check_button_pressed(mb_left))
	return;
