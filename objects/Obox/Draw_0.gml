/// @description Insérez la description ici
// Vous pouvez écrire votre code dans cet éditeur

if (!SET_DISPLAY)
	draw_self();
else
	draw_sprite_part(sprite_index, image_index, IMAGE_LEFT, IMAGE_TOP, IMAGE_WIDTH, IMAGE_HEIGHT, x - sprite_width/2, (y - sprite_height/2) + IMAGE_TOP);