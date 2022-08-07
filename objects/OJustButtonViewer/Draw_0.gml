/// @description Insérez la description ici
// Vous pouvez écrire votre code dans cet éditeur

if (SET_DISPLAY || SET_DISPLAY_LEFT)
	draw_set_alpha(ALPHA);
else
	draw_set_alpha(image_alpha);
if (!SET_DISPLAY && !SET_DISPLAY_LEFT)
	draw_self();
else if (!SET_DISPLAY_LEFT)
	draw_sprite_part(sprite_index, image_index, IMAGE_LEFT, IMAGE_TOP, IMAGE_WIDTH, IMAGE_HEIGHT, x - sprite_width/2, (y - sprite_height/2) + IMAGE_TOP);
else
	draw_sprite_part(sprite_index, image_index, IMAGE_LEFT, IMAGE_TOP, IMAGE_WIDTH, IMAGE_HEIGHT, x, y);
draw_set_alpha(1);