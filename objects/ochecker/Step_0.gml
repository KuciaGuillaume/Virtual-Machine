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
}
