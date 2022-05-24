/// @description Insert description here
// You can write your code in this editor

BBOX_X = (x + TEXT_CONNECT.TEXT_WIDTH) + (MARGE * 2);
BBOX_Y = (y + TEXT_CONNECT.TEXT_HEIGHT) + (MARGE);

TEXT_CONNECT.x = x + ((BBOX_X - x) / 2);
TEXT_CONNECT.y = y + ((BBOX_Y - y) / 2);;

if (image_alpha < 1)
	image_alpha += 0.00001 * delta_time;
