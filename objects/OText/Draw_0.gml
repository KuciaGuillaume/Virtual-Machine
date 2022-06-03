/// @Project by Kucia Guillaume* ///

// DRAW TEXT

if (FONT != draw_get_font())
	draw_set_font(FONT);
	
if (COLOR != draw_get_color())
	draw_set_color(COLOR);
	
if (image_alpha != draw_get_alpha())
	draw_set_alpha(image_alpha);
	
TEXT_WIDTH = string_width(TEXT);
TEXT_HEIGHT = string_height(TEXT);

if (CENTERED)
	draw_text(x - (TEXT_WIDTH / 2), (y - (TEXT_HEIGHT / 2)) + 2, TEXT);
else if (BACK)
	draw_text(x - BACK_POWER, (y - (TEXT_HEIGHT / 2)) + 2, TEXT);
else
	draw_text(x, y, TEXT);
draw_set_alpha(1);
