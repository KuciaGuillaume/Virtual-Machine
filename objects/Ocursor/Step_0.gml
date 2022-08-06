/// @Project by Kucia Guillaume* ///


// BUTTON STATE
image_index = 0;

// UPDATE POSITION

if (image_index == 0)
	x = mouse_x;
else
	x = mouse_x - 1;
y = mouse_y;

if (room == RMainScene)
	ON_MAIN_SCENE.ON_GUI = false;
for (var i = 0; global.BUTTONS[i] != undefined; i++) {
	var class = global.BUTTONS[i];
	
	if ((class[1] != "BUTTON" && class[1] != "CHECKER" && class[1] != "TEXT_BUTTON" && class[1] != "EMPT_BUTTON" && class[1] != "EMPT_BUTTON-NO-HAND" && class[1] != "INFO" && class[1] != "BUTTON-NO-HAND") || class[2] != room)
		continue;
	
	if ((MouseInsideObject(class[0]) || ((class[1] == "EMPT_BUTTON-NO-HAND" || class[1] == "EMPT_BUTTON") && MouseInsideRound(class[0]))) && class[0].image_index < 2 && class[0].ON) {
		if (class[1] == "BUTTON" || class[1] == "EMPT_BUTTON" || class[1] == "CHECKER")
			image_index = 1;
		if (class[1] == "TEXT_BUTTON")
			image_index = 2;
		if ((class[1] == "BUTTON-NO-HAND" || class[1] == "EMPT_BUTTON-NO-HAND") && mouse_check_button(mb_left) && PRESS_TIME >= 0.2)
			image_index = 3;
		else if ((class[1] == "BUTTON-NO-HAND" || class[1] == "EMPT_BUTTON-NO-HAND") && mouse_check_button(mb_left))
			PRESS_TIME +=  delta_time / 1000000;
		else
			PRESS_TIME = 0;
			

		// INFO
		if (class[0].INFO) {
			if (class[4] == undefined) {
				if (room != RMainScene)
					class[4] = CreateRound(class[0].TAG, class[0].INFO_NAME, Segoe8, "Gp4", "Gp5", #282828, 5, [["FADE_IN", 0.000003], ["CENTERED"], ["PARENT" , class[0].TAG] , undefined]);
				else
					class[4] = CreateRound(class[0].TAG, class[0].INFO_NAME, Segoe8, "Notifications_Gp0", "Notifications_Gp1", #282828, 5, [["FADE_IN", 0.000003], ["CENTERED"], ["PARENT" , class[0].TAG] , undefined]);
			}
		}
		
		if (class[1] == "EMPT_BUTTON" || class[1] == "EMPT_BUTTON-NO-HAND") {
			class[0].COLOR = class[0].COLOR_2;
			class[0].TEXT_CONNECT.COLOR = class[0].TEXT_COLOR_2;
		}
		//
		var get_depth = class[0].depth;
		if (room == RMainScene && get_depth <= -100 && class[0] != self)
			ON_MAIN_SCENE.ON_GUI = true;
		if (class[0].FADE_ON == false)
			class[0].image_index = 1;
		else if (class[0].image_alpha < 1 && class[0].FADE_ON)
			class[0].image_alpha += class[0].FADE_ON_POWER * delta_time;
	} else if (((class[0].image_index == 1 && class[0].image_index != 0) || class[0].FADE_ON || class[0].INFO) ||
	((class[1] == "EMPT_BUTTON-NO-HAND" || class[1] == "EMPT_BUTTON") && !MouseInsideRound(class[0]))) {
	
		if (class[0].TYPE != "TEXT_BUTTON" || (class[0].TYPE == "TEXT_BUTTON" && !class[0].write.ON_WRITE)) {
			if (class[0].FADE_ON == false) {
				if (class[0].sprite_index == S_FILES_buton && !class[0].EXPLORER_SELECT)
					class[0].image_index = 0;
				else if (class[0].sprite_index != S_FILES_buton)
					class[0].image_index = 0;
			}
			else if (class[0].image_alpha > 0 && class[0].FADE_ON)
				class[0].image_alpha -= class[0].FADE_ON_POWER * delta_time;
		}
			
		// INFO
		if (class[0].INFO) {
			if (class[4] != undefined && instance_exists(class[4])) {
				DestroyRound(class[4].TAG);
				class[4] = undefined;
			}
		}
		//
		
		//EMPT
		if (class[1] == "EMPT_BUTTON" || class[1] == "EMPT_BUTTON-NO-HAND") {
			class[0].COLOR = class[0].COLOR_1;
			class[0].TEXT_CONNECT.COLOR = class[0].TEXT_COLOR_1;
		}
		
		if (class[0].TYPE == "CHECKER" && class[0].CHECKER_STATE)
			class[0].image_index = 1;
	}
}


for (var i = 0; global.TEXT[i] != undefined; i++) {
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
	x = mouse_x - 1;
y = mouse_y;

