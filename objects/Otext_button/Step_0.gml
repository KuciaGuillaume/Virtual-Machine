/// @Project by Kucia Guillaume* ///


//GET OPTIONS
for (var i = 0; OPTION[i] != "NULL"; i++) {
	if (OPTION[i][0] == "SECRET")
		SECRET = true;
	if (OPTION[i][0] == "CENTERED")
		CENTERED = true;
	if (OPTION[i][0] == "FADE_ON") {OPT_POSITIONS = true; FADE_ON_POWER = OPTION[i][1]; }
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

// GET TEXT
write = GetWrite(NAME);
if (write == "NULL")
	return;

TEXT = write.TEXT_OUTPUT;

// UPDATE BAR
Y = (y - (TEXT_HEIGHT / 2)) + 2;
write.BAR.y = y;
if (CENTERED)
	X = x - (string_width(TEXT) / 2);
else
	X = bbox_left + 10;
UpdateBar(write.BAR, TEXT_SIZE, X);

// EDIT TEXT
if (mouse_check_button_pressed(mb_left)) {
	if (mouse_x >= bbox_left && mouse_x <= bbox_right && mouse_y >= bbox_top && mouse_y <= bbox_bottom)
		write.ON_WRITE = true;
	else
		write.ON_WRITE = false;
}

