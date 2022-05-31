/// @Project by Kucia Guillaume* ///


// BUTTON STATE

image_index = 0;

for (var i = 0; global.OBJECTS[i] != "NULL"; i++) {
	var class = global.OBJECTS[i];
	
	if ((class[1] != "BUTTON" && class[1] != "TEXT_BUTTON" && class[1] != "INFO" && class[1] != "BUTTON-NO-HAND") || class[2] != room)
		continue;
	if (MouseInside(class[0].bbox_left, class[0].bbox_right, class[0].bbox_top, class[0].bbox_bottom) && class[0].image_index < 2) {
		if (class[1] == "BUTTON")
			image_index = 1;
		if (class[1] == "TEXT_BUTTON")
			image_index = 2;

		// INFO
		if (class[0].INFO) {
			var get_info = GetObject(class[0].INFO_NAME);
			if (get_info == "NULL") {
				if (room != RMainScene)
					CreateRound(class[0].TAG, class[0].INFO_NAME, Segoe8, "Gp4", "Gp5", #282828, 5, [["FADE_IN", 0.000003], ["CENTERED"], "NULL"]);
				else
					CreateRound(class[0].TAG, class[0].INFO_NAME, Segoe8, "Notifications_Gp0", "Notifications_Gp1", #282828, 5, [["FADE_IN", 0.000003], ["CENTERED"], "NULL"]);
			}
		}
		//

		if (class[0].FADE_ON == false)
			class[0].image_index = 1;
		else if (class[0].image_alpha < 1 && class[0].FADE_ON)
			class[0].image_alpha += class[0].FADE_ON_POWER * delta_time;
	} else if ((class[0].image_index == 1 && class[0].image_index != 0) || class[0].FADE_ON || class[0].INFO) {
		if (class[0].FADE_ON == false)
			class[0].image_index = 0;
		else if (class[0].image_alpha > 0 && class[0].FADE_ON)
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


for (var i = 0; global.TEXT[i] != "NULL"; i++) {
	if (global.TEXT[i][2] != room || global.TEXT[i][1].LINK_BTN_TEXT == false)
		continue;
	var text = global.TEXT[i][1];
	if (mouse_x >= text.x - (text.TEXT_WIDTH / 2) && mouse_x <= text.x + (text.TEXT_WIDTH/2) &&
	mouse_y >= text.y - (text.TEXT_HEIGHT/2) && mouse_y <= text.y + (text.TEXT_HEIGHT/2)) {
		image_index = 1;
		text.COLOR = text.LINK_COLOR;
	} else
		text.COLOR = text.LINK_FIRST_COLOR;
}


// UPDATE POSITION

if (image_index == 0)
	x = mouse_x;
else
	x = mouse_x - 10;
y = mouse_y;

