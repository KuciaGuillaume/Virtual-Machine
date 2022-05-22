/// @Project by Kucia Guillaume* ///


// BUTTON STATE

image_index = 0;

for (var i = 0; global.OBJECTS[i] != "NULL"; i++) {
	var class = global.OBJECTS[i];
	
	if ((class[1] != "BUTTON" && class[1] != "TEXT_BUTTON") || class[2] != room)
		continue;
	if (MouseInside(class[0].bbox_left, class[0].bbox_right, class[0].bbox_top, class[0].bbox_bottom) && class[0].image_index < 2) {
		if (class[1] == "BUTTON")
			image_index = 1;
		if (class[1] == "TEXT_BUTTON")
			image_index = 2;
		if (class[0].FADE_ON == false)
			class[0].image_index = 1;
		else if (class[0].image_alpha < 1)
			class[0].image_alpha += class[0].FADE_ON_POWER * delta_time;
	} else if ((class[0].image_index == 1 && class[0].image_index != 0) || class[0].FADE_ON) {
		if (class[0].FADE_ON == false)
			class[0].image_index = 0;
		else if (class[0].image_alpha > 0)
			class[0].image_alpha -= class[0].FADE_ON_POWER * delta_time;
	}
}


// UPDATE POSITION

if (image_index == 0)
	x = mouse_x;
else
	x = mouse_x - 10;
y = mouse_y;

