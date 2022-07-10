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