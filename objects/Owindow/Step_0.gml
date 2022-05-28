/// @Project by Kucia Guillaume* ///

if (TAG == "NULL")
	return;
//GET OPTIONS
for (var i = 0; OPTION[i] != "NULL"; i++) {
	if (OPTION[i][0] == "LOCK")
		LOCK = OPTION[i];
	if (OPTION[i][0] == "IMAGE_INDEX")
		OBJECT_LINKED.image_index = OPTION[i][1];
	if (OPTION[i][0] == "FADE_ON") {FADE_ON = true; FADE_ON_POWER = OPTION[i][1]; }
	if (OPTION[i][0] == "FADE_IN" && !FADE_SATE) { 
		FADE_IN = true; FADE_POWER = OPTION[i][1];
		FADE_SATE = true; image_alpha = 0;	
	}
	if (OPTION[i][0] == "INFO") {INFO = true; INFO_NAME = OPTION[i][1]; }
}

if (!FIRST_PASS && !FADE_IN) { FIRST_PASS = true; image_alpha = 2; } 

// FADE_IN

if (FADE_IN && image_alpha < 1)
	image_alpha += FADE_POWER * delta_time;
else
	FADE_IN = false;


// MOVE WINDOW
if ((MouseInside(bbox_left, bbox_right, bbox_top, bbox_bottom) || SELECT) && mouse_check_button(mb_left)) {
	if (!MouseInsideObject(CLOSE) && !MouseInsideObject(REDUCE) && !SELECT) {
		SELECT = true;
		X = mouse_x;
		Y = mouse_y;
		BASE_X = x;
		BASE_Y = y;
	} else if (SELECT && !MouseInsideObject(CLOSE) && !MouseInsideObject(REDUCE)) {
		if (mouse_x > X)
			x = BASE_X + (mouse_x - X);
		else if (mouse_x < X)
			x = BASE_X - (X - mouse_x);
		if (mouse_y > Y)
			y = BASE_Y + (mouse_y - Y);
		else if (mouse_y < Y)
			y = BASE_Y - (Y - mouse_y);
	}
} else
	SELECT = false;

WINDOW_BK.x = x;
WINDOW_BK.y = y + (sprite_height/2);
CLOSE.x = bbox_left + 17.5;
CLOSE.y = y;
REDUCE.x = bbox_left + 42.5;
REDUCE.y = y;

