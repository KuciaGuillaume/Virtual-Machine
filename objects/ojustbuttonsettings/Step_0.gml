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


// BRGHTNESS SELECTOR
if (PARENT != undefined && PARENT.TAG + "BRIGHTNESS_SELECTOR" == TAG) {
	if (mouse_check_button(mb_left) && (MouseInsideObject(id) || SELECT)) {
		
		// CREATE ROUND
		if (ROUND == undefined) {
			ROUND = CreateRound(TAG, string(BRIGHTNESS), Segoe8, "Notifications_Gp0", "Notifications_Gp1", #282828, 5, [["CENTERED"], undefined]);
			ROUND.image_alpha = 1;
			ROUND.TEXT_CONNECT.image_alpha = 1;
		} else {
			var TEXT = ROUND.TEXT_CONNECT;
			TEXT.TEXT = string(BRIGHTNESS);
			var X = (x - (string_width(TEXT.TEXT) / 2)) - 5;
			var Y = ((y - 25 - (string_height(string(BRIGHTNESS))/2)) - (string_height(TEXT.TEXT) / 2)) - (5 / 2);
			ROUND.x = X;
			ROUND.y = Y;
			TEXT.x = x;
			TEXT.y = y - 25 - string_height(string(BRIGHTNESS))/2;
			ROUND.BBOX_X = (X + TEXT.TEXT_WIDTH) + 5;
			ROUND.BBOX_Y = (Y + TEXT.TEXT_HEIGHT) + 5;
			ROUND.COLOR = #282828;
			ROUND.MARGE = 5;
		}
			
		
		
		SELECT = true;
		for (var i = 0; PARENT.SSSYSTEM_DISPLAY_OBJECT[i] != undefined; i++) {
			if (PARENT.SSSYSTEM_DISPLAY_OBJECT[i][0] == id)
				break;
		}
			
		x = mouse_x;
		PARENT.SSSYSTEM_DISPLAY_OBJECT[i][1] = x - PARENT.x;
		if (y - mouse_y > 50 || y - mouse_y < -50 || x - mouse_x > 50 || x - mouse_x < -50) {
			if (ROUND != undefined) {
				DestroyRound(ROUND.TAG);
				ROUND = undefined;
			}
			SELECT = false;
		}
		if (x < OBJECT_LINKED.x)
			PARENT.SSSYSTEM_DISPLAY_OBJECT[i][1] = (OBJECT_LINKED.x - PARENT.x);
		else if (x > OBJECT_LINKED.x + OBJECT_LINKED.sprite_width)
			PARENT.SSSYSTEM_DISPLAY_OBJECT[i][1] = (OBJECT_LINKED.x - PARENT.x) + OBJECT_LINKED.sprite_width;
		
		BRIGHTNESS = round((x - OBJECT_LINKED.x) / 2);
		if (BRIGHTNESS > 100)
			BRIGHTNESS = 100;
		if (BRIGHTNESS < 0)
			BRIGHTNESS = 0;
		OLuminosity.image_alpha = (((BRIGHTNESS * (-1)) + 100) * 0.01) - 0.1;
		global.SETTINGS[0] = BRIGHTNESS;
	} else {
		if (ROUND != undefined) {
			DestroyRound(ROUND.TAG);
			ROUND = undefined;
		}
		SELECT = false;
	}
}

if (PARENT.TAG + "BRIGHTNESS_BAR_2" == TAG)
	IMAGE_WIDTH = OBJECT_LINKED.x - x;
	
if (string_count("EDIT", TAG) > 0) {
	if (MouseInsideObject(id) && string_count("WALLPAPER", TAG) > 0 && PARENT.WINDOW.ON) {
	
		if (SELECT_HOVER == undefined && global.USER[7] != image_index) {
			SELECT_HOVER = CreateObjectSprite(x, y + 60, PARENT.WINDOW.LAYERS[3], S_SSsystem_Personalize_Select_hover, OJustGUI, "IMAGE", PARENT.TAG + "WALLPAPER_SELECTOR_HOVER" + TAG, [undefined]);
			SELECT_HOVER.SET_DISPLAY_LEFT = true;
			SELECT_HOVER.IMAGE_TOP = 0;
			SELECT_HOVER.IMAGE_LEFT = 0;
			SELECT_HOVER.IMAGE_HEIGHT = 0;
			SELECT_HOVER.IMAGE_WIDTH = sprite_width;
			PARENT.SSSYSTEM_PERSONALIZE_OBJECT = addtolist([SELECT_HOVER, undefined, undefined, 1], PARENT.SSSYSTEM_PERSONALIZE_OBJECT);
		} else if (SELECT_HOVER != undefined){
			var diff = Diff(SELECT_HOVER.y, y - 1);
			if (SELECT_HOVER.y > y) {
				SELECT_HOVER.y -= (diff * 0.000009) * delta_time;
				SELECT_HOVER.IMAGE_HEIGHT += (diff * 0.000009) * delta_time;
			} else {
				SELECT_HOVER.IMAGE_HEIGHT = 60;
				SELECT_HOVER.y = y;
			}
			if (global.USER[7] == image_index) {
				PARENT.SSSYSTEM_PERSONALIZE_OBJECT = remove_findlist_index(SELECT_HOVER, PARENT.SSSYSTEM_PERSONALIZE_OBJECT, 0);
				DestroyObject(SELECT_HOVER.TAG);
				SELECT_HOVER = undefined;
			}
		}
	
		if (mouse_check_button_pressed(mb_left)) {
			global.USER[7] = image_index;
			var background = GetObject("MAIN_BACKGROUNDS");
			background.image_index = image_index;

			var index = FindListIndex(id, PARENT.SSSYSTEM_PERSONALIZE_OBJECT, 0);
			var target_x = PARENT.SSSYSTEM_PERSONALIZE_OBJECT[index][1];
			var target_y = PARENT.SSSYSTEM_PERSONALIZE_OBJECT[index][2];
			var index_selector = FindListIndex(GetObject(PARENT.TAG + "WALLPAPER_SELECTOR"), PARENT.SSSYSTEM_PERSONALIZE_OBJECT, 0);
			PARENT.SSSYSTEM_PERSONALIZE_OBJECT[index_selector][1] = target_x;
			PARENT.SSSYSTEM_PERSONALIZE_OBJECT[index_selector][2] = target_y + 40;
			var index_selector_text = FindListIndex(GetText(PARENT.TAG + "WALLPAPER_SELECTOR_TEXT"), PARENT.SSSYSTEM_PERSONALIZE_OBJECT, 0);
			PARENT.SSSYSTEM_PERSONALIZE_OBJECT[index_selector_text][1] = target_x + 55;
			PARENT.SSSYSTEM_PERSONALIZE_OBJECT[index_selector_text][2] = target_y + 49;
		}
	} else if (SELECT_HOVER != undefined) {
			if (SELECT_HOVER.y < y + 60) {
				var diff = Diff(SELECT_HOVER.y, y + 61);
				SELECT_HOVER.y += (diff * 0.000009) * delta_time;
				SELECT_HOVER.IMAGE_HEIGHT -= (diff * 0.000009) * delta_time;
			} else {				
				PARENT.SSSYSTEM_PERSONALIZE_OBJECT = remove_findlist_index(SELECT_HOVER, PARENT.SSSYSTEM_PERSONALIZE_OBJECT, 0);
				DestroyObject(SELECT_HOVER.TAG);
				SELECT_HOVER = undefined;
			}
	}
	if (MouseInsideObject(id) && string_count("CURSOR", TAG) > 0 && PARENT.WINDOW.ON) {
	
		if (SELECT_CURSOR_HOVER == undefined) {
			SELECT_CURSOR_HOVER = CreateObjectSprite(x, y + 60, PARENT.WINDOW.LAYERS[3], S_SSsystem_Personalize_Select_hover, OJustGUI, "IMAGE", PARENT.TAG + "CURSOR_SELECTOR_HOVER" + TAG, [undefined]);
			SELECT_CURSOR_HOVER.SET_DISPLAY_LEFT = true;
			SELECT_CURSOR_HOVER.IMAGE_TOP = 0;
			SELECT_CURSOR_HOVER.IMAGE_LEFT = 0;
			SELECT_CURSOR_HOVER.IMAGE_HEIGHT = 0;
			SELECT_CURSOR_HOVER.IMAGE_WIDTH = sprite_width;
			PARENT.SSSYSTEM_PERSONALIZE_OBJECT = addtolist([SELECT_CURSOR_HOVER, undefined, undefined, 1], PARENT.SSSYSTEM_PERSONALIZE_OBJECT);
		} else if (SELECT_CURSOR_HOVER != undefined){
			var diff = Diff(SELECT_CURSOR_HOVER.y, y - 1);
			if (SELECT_CURSOR_HOVER.y > y) {
				SELECT_CURSOR_HOVER.y -= (diff * 0.000009) * delta_time;
				SELECT_CURSOR_HOVER.IMAGE_HEIGHT += (diff * 0.000009) * delta_time;
			} else {
				SELECT_CURSOR_HOVER.IMAGE_HEIGHT = 60;
				SELECT_CURSOR_HOVER.y = y;
			}
			if (global.SETTINGS[6] == ID_CURSOR) {
				PARENT.SSSYSTEM_PERSONALIZE_OBJECT = remove_findlist_index(SELECT_CURSOR_HOVER, PARENT.SSSYSTEM_PERSONALIZE_OBJECT, 0);
				DestroyObject(SELECT_CURSOR_HOVER.TAG);
				SELECT_CURSOR_HOVER = undefined;
			}
		}

		if (mouse_check_button_pressed(mb_left)) {
			global.SETTINGS[6] = ID_CURSOR;

			var index = FindListIndex(id, PARENT.SSSYSTEM_PERSONALIZE_OBJECT, 0);
			var target_x = PARENT.SSSYSTEM_PERSONALIZE_OBJECT[index][1];
			var target_y = PARENT.SSSYSTEM_PERSONALIZE_OBJECT[index][2];
			var index_selector = FindListIndex(GetObject(PARENT.TAG + "CURSOR_SELECTOR"), PARENT.SSSYSTEM_PERSONALIZE_OBJECT, 0);
			PARENT.SSSYSTEM_PERSONALIZE_OBJECT[index_selector][1] = target_x;
			PARENT.SSSYSTEM_PERSONALIZE_OBJECT[index_selector][2] = target_y + 40;
			var index_selector_text = FindListIndex(GetText(PARENT.TAG + "CURSOR_SELECTOR_TEXT"), PARENT.SSSYSTEM_PERSONALIZE_OBJECT, 0);
			PARENT.SSSYSTEM_PERSONALIZE_OBJECT[index_selector_text][1] = target_x + 55;
			PARENT.SSSYSTEM_PERSONALIZE_OBJECT[index_selector_text][2] = target_y + 49;
			Ocursor.sprite_index = CURSOR_IMAGE;
		}

	} else if (SELECT_CURSOR_HOVER != undefined) {
			if (SELECT_CURSOR_HOVER.y < y + 60) {
				var diff = Diff(SELECT_CURSOR_HOVER.y, y + 61);
				SELECT_CURSOR_HOVER.y += (diff * 0.000009) * delta_time;
				SELECT_CURSOR_HOVER.IMAGE_HEIGHT -= (diff * 0.000009) * delta_time;
			} else {				
				PARENT.SSSYSTEM_PERSONALIZE_OBJECT = remove_findlist_index(SELECT_CURSOR_HOVER, PARENT.SSSYSTEM_PERSONALIZE_OBJECT, 0);
				DestroyObject(SELECT_CURSOR_HOVER.TAG);
				SELECT_CURSOR_HOVER = undefined;
			}
	}
}



// GENERAL_SOUND_SELECTOR
if (PARENT != undefined && PARENT.TAG + "GENERAL_SOUND_SELECTOR" == TAG) {
	if (mouse_check_button(mb_left) && (MouseInsideObject(id) || SELECT)) {
		
		// CREATE ROUND
		if (ROUND == undefined) {
			ROUND = CreateRound(TAG, string(GENERAL_SOUNDS), Segoe8, "Notifications_Gp0", "Notifications_Gp1", #282828, 5, [["CENTERED"], undefined]);
			ROUND.image_alpha = 1;
			ROUND.TEXT_CONNECT.image_alpha = 1;
		} else {
			var TEXT = ROUND.TEXT_CONNECT;
			TEXT.TEXT = string(GENERAL_SOUNDS);
			var X = (x - (string_width(TEXT.TEXT) / 2)) - 5;
			var Y = ((y - 25 - (string_height(string(GENERAL_SOUNDS))/2)) - (string_height(TEXT.TEXT) / 2)) - (5 / 2);
			ROUND.x = X;
			ROUND.y = Y;
			TEXT.x = x;
			TEXT.y = y - 25 - string_height(string(GENERAL_SOUNDS))/2;
			ROUND.BBOX_X = (X + TEXT.TEXT_WIDTH) + 5;
			ROUND.BBOX_Y = (Y + TEXT.TEXT_HEIGHT) + 5;
			ROUND.COLOR = #282828;
			ROUND.MARGE = 5;
		}
			
		
		
		SELECT = true;
		for (var i = 0; PARENT.SSSYSTEM_SOUND_OBJECT[i] != undefined; i++) {
			if (PARENT.SSSYSTEM_SOUND_OBJECT[i][0] == id)
				break;
		}
			
		x = mouse_x;
		PARENT.SSSYSTEM_SOUND_OBJECT[i][1] = x - PARENT.x;
		if (y - mouse_y > 50 || y - mouse_y < -50 || x - mouse_x > 50 || x - mouse_x < -50) {
			if (ROUND != undefined) {
				DestroyRound(ROUND.TAG);
				ROUND = undefined;
			}
			SELECT = false;
		}
		if (x < OBJECT_LINKED.x)
			PARENT.SSSYSTEM_SOUND_OBJECT[i][1] = (OBJECT_LINKED.x - PARENT.x);
		else if (x > OBJECT_LINKED.x + OBJECT_LINKED.sprite_width)
			PARENT.SSSYSTEM_SOUND_OBJECT[i][1] = (OBJECT_LINKED.x - PARENT.x) + OBJECT_LINKED.sprite_width;
		
		GENERAL_SOUNDS = round((x - OBJECT_LINKED.x) / 2);
		if (GENERAL_SOUNDS > 100)
			GENERAL_SOUNDS = 100;
		if (GENERAL_SOUNDS < 0)
			GENERAL_SOUNDS = 0;
		global.SOUNDS[0] = GENERAL_SOUNDS;
	} else {
		if (ROUND != undefined) {
			DestroyRound(ROUND.TAG);
			ROUND = undefined;
		}
		SELECT = false;
	}
}

if (PARENT.TAG + "GENERAL_SOUND_BAR_2" == TAG)
	IMAGE_WIDTH = OBJECT_LINKED.x - x;
	
	
	
// NOTIFICATION_SOUND_SELECTOR
if (PARENT != undefined && PARENT.TAG + "NOTIFICATION_SOUND_SELECTOR" == TAG) {
	if (mouse_check_button(mb_left) && (MouseInsideObject(id) || SELECT)) {
		
		// CREATE ROUND
		if (ROUND == undefined) {
			ROUND = CreateRound(TAG, string(NOTIFICATION_SOUNDS), Segoe8, "Notifications_Gp0", "Notifications_Gp1", #282828, 5, [["CENTERED"], undefined]);
			ROUND.image_alpha = 1;
			ROUND.TEXT_CONNECT.image_alpha = 1;
		} else {
			var TEXT = ROUND.TEXT_CONNECT;
			TEXT.TEXT = string(NOTIFICATION_SOUNDS);
			var X = (x - (string_width(TEXT.TEXT) / 2)) - 5;
			var Y = ((y - 25 - (string_height(string(NOTIFICATION_SOUNDS))/2)) - (string_height(TEXT.TEXT) / 2)) - (5 / 2);
			ROUND.x = X;
			ROUND.y = Y;
			TEXT.x = x;
			TEXT.y = y - 25 - string_height(string(NOTIFICATION_SOUNDS))/2;
			ROUND.BBOX_X = (X + TEXT.TEXT_WIDTH) + 5;
			ROUND.BBOX_Y = (Y + TEXT.TEXT_HEIGHT) + 5;
			ROUND.COLOR = #282828;
			ROUND.MARGE = 5;
		}
		
		
		SELECT = true;
		for (var i = 0; PARENT.SSSYSTEM_SOUND_OBJECT[i] != undefined; i++) {
			if (PARENT.SSSYSTEM_SOUND_OBJECT[i][0] == id)
				break;
		}
			
		x = mouse_x;
		PARENT.SSSYSTEM_SOUND_OBJECT[i][1] = x - PARENT.x;
		if (y - mouse_y > 50 || y - mouse_y < -50 || x - mouse_x > 50 || x - mouse_x < -50) {
			if (ROUND != undefined) {
				DestroyRound(ROUND.TAG);
				ROUND = undefined;
			}
			SELECT = false;
		}
		if (x < OBJECT_LINKED.x)
			PARENT.SSSYSTEM_SOUND_OBJECT[i][1] = (OBJECT_LINKED.x - PARENT.x);
		else if (x > OBJECT_LINKED.x + OBJECT_LINKED.sprite_width)
			PARENT.SSSYSTEM_SOUND_OBJECT[i][1] = (OBJECT_LINKED.x - PARENT.x) + OBJECT_LINKED.sprite_width;
		
		NOTIFICATION_SOUNDS = round((x - OBJECT_LINKED.x) / 2);
		if (NOTIFICATION_SOUNDS > 100)
			NOTIFICATION_SOUNDS = 100;
		if (NOTIFICATION_SOUNDS < 0)
			NOTIFICATION_SOUNDS = 0;
		global.SOUNDS[1] = NOTIFICATION_SOUNDS;
	} else {
		if (ROUND != undefined) {
			DestroyRound(ROUND.TAG);
			ROUND = undefined;
		}
		SELECT = false;
	}
}

if (PARENT.TAG + "NOTIFICATION_SOUND_BAR_2" == TAG)
	IMAGE_WIDTH = OBJECT_LINKED.x - x;
	
	
// AMBIANT_SOUND_SELECTOR
if (PARENT != undefined && PARENT.TAG + "AMBIANT_SOUND_SELECTOR" == TAG) {
	if (mouse_check_button(mb_left) && (MouseInsideObject(id) || SELECT)) {
		
		// CREATE ROUND
		if (ROUND == undefined) {
			ROUND = CreateRound(TAG, string(SOUND_AMBIANT), Segoe8, "Notifications_Gp0", "Notifications_Gp1", #282828, 5, [["CENTERED"], undefined]);
			ROUND.image_alpha = 1;
			ROUND.TEXT_CONNECT.image_alpha = 1;
		} else {
			var TEXT = ROUND.TEXT_CONNECT;
			TEXT.TEXT = string(SOUND_AMBIANT);
			var X = (x - (string_width(TEXT.TEXT) / 2)) - 5;
			var Y = ((y - 25 - (string_height(string(SOUND_AMBIANT))/2)) - (string_height(TEXT.TEXT) / 2)) - (5 / 2);
			ROUND.x = X;
			ROUND.y = Y;
			TEXT.x = x;
			TEXT.y = y - 25 - string_height(string(SOUND_AMBIANT))/2;
			ROUND.BBOX_X = (X + TEXT.TEXT_WIDTH) + 5;
			ROUND.BBOX_Y = (Y + TEXT.TEXT_HEIGHT) + 5;
			ROUND.COLOR = #282828;
			ROUND.MARGE = 5;
		}
		
		
		SELECT = true;
		for (var i = 0; PARENT.SSSYSTEM_SOUND_OBJECT[i] != undefined; i++) {
			if (PARENT.SSSYSTEM_SOUND_OBJECT[i][0] == id)
				break;
		}
			
		x = mouse_x;
		PARENT.SSSYSTEM_SOUND_OBJECT[i][1] = x - PARENT.x;
		if (y - mouse_y > 50 || y - mouse_y < -50 || x - mouse_x > 50 || x - mouse_x < -50) {
			if (ROUND != undefined) {
				DestroyRound(ROUND.TAG);
				ROUND = undefined;
			}
			SELECT = false;
		}
		if (x < OBJECT_LINKED.x)
			PARENT.SSSYSTEM_SOUND_OBJECT[i][1] = (OBJECT_LINKED.x - PARENT.x);
		else if (x > OBJECT_LINKED.x + OBJECT_LINKED.sprite_width)
			PARENT.SSSYSTEM_SOUND_OBJECT[i][1] = (OBJECT_LINKED.x - PARENT.x) + OBJECT_LINKED.sprite_width;
		
		SOUND_AMBIANT = round((x - OBJECT_LINKED.x) / 2);
		if (SOUND_AMBIANT > 100)
			SOUND_AMBIANT = 100;
		if (SOUND_AMBIANT < 0)
			SOUND_AMBIANT = 0;
		global.SOUNDS[2] = SOUND_AMBIANT;
	} else {
		if (ROUND != undefined) {
			DestroyRound(ROUND.TAG);
			ROUND = undefined;
		}
		SELECT = false;
	}
}

if (PARENT.TAG + "AMBIANT_SOUND_BAR_2" == TAG)
	IMAGE_WIDTH = OBJECT_LINKED.x - x;
	
if (string_count("ARTICLE", TAG) > 0 && PARENT.WINDOW.ON) {
	
	if (MouseInsideObject(id)) {
		if (mouse_wheel_down() && IMAGE_TOP < Diff(IMAGE_HEIGHT, sprite_height))
			IMAGE_TOP += (delta_time * 0.0008);
		else if (IMAGE_TOP > Diff(IMAGE_HEIGHT, sprite_height))
			IMAGE_TOP = Diff(IMAGE_HEIGHT, sprite_height);
		if (mouse_wheel_up() && IMAGE_TOP > 0)
			IMAGE_TOP -= (delta_time * 0.0008);
		else if (IMAGE_TOP < 0)
			IMAGE_TOP = 0;
	}
	
}












