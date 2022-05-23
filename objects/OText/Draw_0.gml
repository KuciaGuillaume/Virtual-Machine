/// @Project by Kucia Guillaume* ///

// DRAW TEXT
draw_set_font(FONT);
draw_set_color(COLOR);
draw_set_alpha(image_alpha);
TEXT_WIDTH = string_width(TEXT);
TEXT_HEIGHT = string_height(TEXT);
if (CENTERED) {
	draw_text(x - (string_width(TEXT) / 2), (y - string_height(TEXT) / 2) + 2, TEXT);
	return;
}
draw_text(x, y, TEXT);
