/// @description Insert description here
// You can write your code in this editor

if (SHADOW) {
	draw_set_color(SHADOW_COLOR);
	draw_set_alpha(SHADOW_ALPHA * image_alpha);
	draw_roundrect_ext(x - SHADOW_SIZE, y - SHADOW_SIZE, x + SIZE_X + (SHADOW_SIZE * 2), y + SIZE_Y + (SHADOW_SIZE * 2), EXT_RADIUS, EXT_RADIUS, false);
}
draw_set_color(COLOR);
draw_set_alpha(image_alpha);
draw_roundrect_ext(x, y, x + SIZE_X, y + SIZE_Y, EXT_RADIUS, EXT_RADIUS, false);
if (EXT) {
	draw_set_color(EXT_COLOR);
	draw_roundrect_ext(x, y, x + SIZE_X, y + SIZE_Y, EXT_RADIUS, EXT_RADIUS, true);
}
draw_set_alpha(1);
