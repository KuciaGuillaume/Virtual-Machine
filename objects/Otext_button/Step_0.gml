/// @Project by Kucia Guillaume* ///

if (TAG == undefined)
	return;

if (!FIRST_PASS && !FADE_IN) { FIRST_PASS = true; image_alpha = 2; } 

// FADE_IN

if (FADE_IN && image_alpha < 1)
	image_alpha += FADE_POWER * delta_time;
else
	FADE_IN = false;

// GET TEXT
if (write == undefined)
	return;

TEXT = write.TEXT_OUTPUT;

// UPDATE BAR
Y = (y - (TEXT_HEIGHT / 2)) + 2 + MORE_Y;
write.BAR.y = y;
if (CENTERED)
	X = x - (string_width(TEXT) / 2);
else
	X = bbox_left + MORE_X;
UpdateBar(write.BAR, TEXT_SIZE, X);

// EDIT TEXT
if (mouse_check_button_pressed(mb_left)) {
	if (mouse_x >= bbox_left && mouse_x <= bbox_right && mouse_y >= bbox_top && mouse_y <= bbox_bottom)
		write.ON_WRITE = true;
	else {
		if (PARENT == undefined || PARENT.FIND_OPTION_FOLDER == undefined)
			write.ON_WRITE = false;
		else if (!MouseInsideObject(PARENT.FIND_OPTION_FOLDER) && !MouseInsideObject(PARENT.FIND_OPTION_ROOT))
			write.ON_WRITE = false;
	}
}

if (write.ON_WRITE)
	image_index = 1;

