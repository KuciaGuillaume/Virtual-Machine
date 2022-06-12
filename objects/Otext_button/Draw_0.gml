/// @Project by Kucia Guillaume* ///

draw_self();

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
draw_set_alpha(1);
