/// @Project by Kucia Guillaume* ///

if (TAG == undefined)
	return;
if (!FIRST_PASS && !FADE_IN) {image_alpha = 2; FIRST_PASS = true; } 


// FADE_IN

if (FADE_IN && image_alpha < 1)
	image_alpha += FADE_POWER * delta_time;
else
	FADE_IN = false;

if (IMAGE_WIDTH < 0) {
	IMAGE_WIDTH = sprite_width;
	IMAGE_HEIGHT = sprite_height;
}

if (TIMER_OUT) {
	TIMER_DELTA += delta_time / 1000000;
	if (TIMER_DELTA >= TIMER_TIME) {
		TIMER_STATE_END = true;
		image_alpha -= 0.00001 * delta_time;
		y += 0.00001 * delta_time;
		if (TEXT_CONNECT != undefined) {
			TEXT_CONNECT.image_alpha = image_alpha;
			TEXT_CONNECT.y = y;
		}
		if (image_alpha <= 0) {
			if (PARENT != undefined) {
				if (string_count("WARNING", TAG)) {
					PARENT.WINDOW.list_objects = remove_findlist(PARENT.WARNING_GUI, PARENT.WINDOW.list_objects);
					PARENT.WARNING_GUI = undefined;
				}
			}
			if (TEXT_CONNECT != undefined)
				DestroyText(TEXT_CONNECT.TAG);
			DestroyObject(TAG);
			return;
		}
	}
}

if (SLIDE && !TIMER_STATE_END && image_alpha < 1 && ON) {
	y -= SLIDE_POWER * delta_time;
	if (TEXT_CONNECT != undefined)
		TEXT_CONNECT.y -= SLIDE_POWER * delta_time;
} else if (image_alpha >= 1 && SLIDE)
	SLIDE_OUT = true;
	
if ((mouse_check_button_pressed(mb_left) && MouseInsideObject(id)) || CHECKER_MOVEMENT) {
	var SPEED = 0.0005 * delta_time;
	
	
	if (mouse_check_button_pressed(mb_left) && !CHECKER_MOVEMENT) {
		CHECKER_MOVEMENT = true;
		if (CHECKER_STATE) {
			CHECKER_STATE = false;
			image_index = 0;
		} else {
			CHECKER_STATE = true;
			image_index = 1;
		}
		
		if (string_count("NIGHT_CHECKER", TAG))
			global.SETTINGS[1] = CHECKER_STATE;
		
		if (PARENT != undefined && string_count("DISPLAY_CHECKER", TAG) > 0) {
			var custom = GetObject(PARENT.TAG + "CUSTOM_CHECKER" + "CHECKER_SELECTOR");
			if ( custom.CHECKER_STATE && CHECKER_STATE) {
				custom.CHECKER_STATE = false;
				custom.CHECKER_MOVEMENT = true;
				global.SETTINGS[3][2] = false;
			} else if ( !custom.CHECKER_STATE && !CHECKER_STATE) {
				custom.CHECKER_STATE = true;
				custom.CHECKER_MOVEMENT = true;
				global.SETTINGS[3][2] = true;
			}
		} else if (PARENT != undefined && string_count("CUSTOM_CHECKER", TAG) > 0) {
			var display = GetObject(PARENT.TAG + "DISPLAY_CHECKER" + "CHECKER_SELECTOR");
			if ( display.CHECKER_STATE && CHECKER_STATE) {
				display.CHECKER_STATE = false;
				display.CHECKER_MOVEMENT = true;
				global.SETTINGS[3][2] = true;
			} else if ( !display.CHECKER_STATE && !CHECKER_STATE) {
				display.CHECKER_STATE = true;
				display.CHECKER_MOVEMENT = true;
				global.SETTINGS[3][2] = false;
			}
		}
		
		if (string_count("FRAMERATE_CHECKER", TAG) > 0) {
			if (CHECKER_STATE) {
				CreateObjectSprite(30, 30, "Notifications_Gp0", S_SSsystem_Display_Framerate, OJustGUI, "IMAGE", "BACK_FRAMERATE", [undefined]);
				AddText(100, 42.5, string(fps), Arial10, c_white, "Notifications_Gp1", "FRAMERATE_TEXT", [["CENTERED"], undefined]);
				global.SETTINGS[5] = true;
			} else {
				DestroyObject("BACK_FRAMERATE");
				DestroyText("FRAMERATE_TEXT");
				global.SETTINGS[5] = false;
			}
		}
		
		if (string_count("FULLSCREEN_CHECKER", TAG) > 0)
			global.SETTINGS[4] = CHECKER_STATE;
			
	}
	
	if (CHECKER_MOVEMENT) {
		for (var i = 0; PARENT.SSSYSTEM_DISPLAY_OBJECT[i][0] != id;) {i++;}
		CHECKER_INDEX = i;
	}
	
	if (CHECKER_STATE) {
		if (x >= OBJECT_LINKED.x + (OBJECT_LINKED.sprite_width/2))
			CHECKER_MOVEMENT = false;
		else
			PARENT.SSSYSTEM_DISPLAY_OBJECT[CHECKER_INDEX][1] += SPEED;
	} else {
		if (x <= OBJECT_LINKED.x - (OBJECT_LINKED.sprite_width/2))
			CHECKER_MOVEMENT = false;
		else
			PARENT.SSSYSTEM_DISPLAY_OBJECT[CHECKER_INDEX][1] -= SPEED;
	}
	
	if (PARENT.x + PARENT.SSSYSTEM_DISPLAY_OBJECT[CHECKER_INDEX][1] > OBJECT_LINKED.x + (OBJECT_LINKED.sprite_width/2))
		PARENT.SSSYSTEM_DISPLAY_OBJECT[CHECKER_INDEX][1] = Diff(OBJECT_LINKED.x + (OBJECT_LINKED.sprite_width/2), PARENT.x);
	if (PARENT.x + PARENT.SSSYSTEM_DISPLAY_OBJECT[CHECKER_INDEX][1] < OBJECT_LINKED.x - (OBJECT_LINKED.sprite_width/2))
		PARENT.SSSYSTEM_DISPLAY_OBJECT[CHECKER_INDEX][1] = Diff(OBJECT_LINKED.x - (OBJECT_LINKED.sprite_width/2), PARENT.x);
}
