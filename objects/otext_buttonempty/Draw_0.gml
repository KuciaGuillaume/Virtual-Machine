/// @Project by Kucia Guillaume* ///

// DRAW TEXT
draw_set_font(FONT);
draw_set_color(COLOR);
draw_set_alpha(image_alpha);
TEXT_SIZE = string_width(TEXT);
TEXT_HEIGHT = string_height(TEXT);

if (SECRET && write != undefined && write.TEXT_OUTPUT != write.INITIAL_TEXT) {
	var size = string_byte_length(TEXT);
	var char_size = string_width(TEXT) / size;
	var i = 0;
	for (; size != 0; size--) {
		draw_text(X + i, Y, "*");
		i += char_size;
	}
	return;
}
draw_text(X, Y, TEXT);

if (SHADOW) {
	draw_set_color(SHADOW_COLOR);
	draw_set_alpha(SHADOW_ALPHA * image_alpha);
	draw_roundrect_ext(x - SHADOW_SIZE, y - SHADOW_SIZE, x + SIZE_X + (SHADOW_SIZE * 2), y + SIZE_Y + (SHADOW_SIZE * 2), EXT_RADIUS, EXT_RADIUS, false);
}
if (!OTHER_DRAWING) {
	draw_set_color(COLOR);
	draw_set_alpha(image_alpha);
	draw_roundrect_ext(x, y, x + SIZE_X, y + SIZE_Y, EXT_RADIUS, EXT_RADIUS, false);
} else {
	draw_set_color(COLOR);
	draw_set_alpha(image_alpha);
	var XD = x + OTHER_DRAWING_X;
	var YD = y + OTHER_DRAWING_Y;
	draw_roundrect_ext(XD, YD, XD + SIZE_X, YD + SIZE_Y, EXT_RADIUS, EXT_RADIUS, false);
}
if (EXT) {
	draw_set_color(EXT_COLOR);
	draw_roundrect_ext(x, y, x + SIZE_X, y + SIZE_Y, EXT_RADIUS, EXT_RADIUS, true);
}
draw_set_alpha(1);

