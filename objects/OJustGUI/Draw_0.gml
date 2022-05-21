/// @Project by Kucia Guillaume* ///

draw_self();

if (B_INSIDE) {
	var scroll_bar = GetObject("SCROLL_IMAGE_BAR");
	draw_set_alpha(scroll_bar.image_alpha);
	draw_rectangle(x, y, x + sprite_width, y + sprite_height, true);
}
