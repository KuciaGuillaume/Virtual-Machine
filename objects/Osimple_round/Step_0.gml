/// @description Insert description here
// You can write your code in this editor


if (TAG == undefined)
	return;
BBOX_X = (x + TEXT_CONNECT.TEXT_WIDTH) + (MARGE * 2);
BBOX_Y = (y + TEXT_CONNECT.TEXT_HEIGHT) + (MARGE);

TEXT_CONNECT.x = x + ((BBOX_X - x) / 2);
TEXT_CONNECT.y = y + ((BBOX_Y - y) / 2);

if (image_alpha < 1 && ROUND_TIME >= 1)
	image_alpha += 0.000005 * delta_time;
else	
	ROUND_TIME += delta_time / 1000000;

TEXT_CONNECT.image_alpha = image_alpha;

