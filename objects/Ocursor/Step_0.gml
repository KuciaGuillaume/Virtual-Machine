/// @Project by Kucia Guillaume* ///


// BUTTON STATE

image_index = 0;

for (var i = 0; global.OBJECTS[i] != "NULL"; i++) {
	var class = global.OBJECTS[i];
	
	if ((class[1] != "BUTTON" && class[1] != "TEXT_BUTTON" && class[1] != "INFO") || class[2] != room)
		continue;
	if (MouseInside(class[0].bbox_left, class[0].bbox_right, class[0].bbox_top, class[0].bbox_bottom) && class[0].image_index < 2) {
		if (class[1] == "BUTTON")
			image_index = 1;
		if (class[1] == "TEXT_BUTTON")
			image_index = 2;

		// INFO
		if (class[0].INFO) {
			var get_info = GetObject(class[0].INFO_NAME);
			if (get_info = "NULL")
				CreateRound(class[0].TAG, class[0].INFO_NAME, Segoe8, "Gp4", "Gp5", c_white, 10, [["CENTERED"], "NULL"]);
			else {
				get_info.x = x - ((get_info.BBOX_X - get_info.x) / 2);
				get_info.y = y - 45;
			}
		}
		//

		if (class[0].FADE_ON == false)
			class[0].image_index = 1;
		else if (class[0].image_alpha < 1)
			class[0].image_alpha += class[0].FADE_ON_POWER * delta_time;
	} else if ((class[0].image_index == 1 && class[0].image_index != 0) || class[0].FADE_ON || class[0].INFO) {
		if (class[0].FADE_ON == false)
			class[0].image_index = 0;
		else if (class[0].image_alpha > 0)
			class[0].image_alpha -= class[0].FADE_ON_POWER * delta_time;
			
		// INFO
		if (class[0].INFO) {
			var get_info = GetObject(class[0].INFO_NAME);
			if (get_info != "NULL")
				DestroyRound(class[0].INFO_NAME);
		}
		//
	}
}


// UPDATE POSITION

if (image_index == 0)
	x = mouse_x;
else
	x = mouse_x - 10;
y = mouse_y;

