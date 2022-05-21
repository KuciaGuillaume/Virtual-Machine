/// @Project by Kucia Guillaume* ///


//GET OPTIONS
for (var i = 0; OPTION[i] != "NULL"; i++) {
	if (OPTION[i][0] == "SECRET")
		SECRET = true;
	if (OPTION[i][0] == "CENTERED")
		CENTERED = true;
}

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

