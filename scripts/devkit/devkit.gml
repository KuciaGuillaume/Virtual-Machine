// Les actifs du script ont changé pour v2.3.0 Voir
// https://help.yoyogames.com/hc/en-us/articles/360005277377 pour plus d’informations
function DevKit(ID) {

	if (!ID.FIRST_PASS && !ID.FADE_IN) { ID.FIRST_PASS = true; ID.image_alpha = 2; } 

	// FADE_IN

	if (ID.FADE_IN && ID.image_alpha < 1 && ID.ON)
		ID.image_alpha += ID.FADE_POWER * delta_time;
	else
		ID.FADE_IN = false;

	if (ID.IMAGE_WIDTH < 0) {
		ID.IMAGE_WIDTH = ID.sprite_width;
		ID.IMAGE_HEIGHT = ID.sprite_height;
	}

	if (ID.SLIDE && !ID.TIMER_STATE_END && ID.image_alpha < 1 && ID.ON) {
		ID.y -= ID.SLIDE_POWER * delta_time;
		if (ID.TEXT_CONNECT != undefined)
			ID.TEXT_CONNECT.y -= ID.SLIDE_POWER * delta_time;
	}
	
	// TIMER OUT
	if (ID.TIMER_OUT) {
	ID.TIMER_DELTA += delta_time / 1000000;
	if (ID.TIMER_DELTA >= ID.TIMER_TIME) {
		ID.TIMER_STATE_END = true;
		ID.image_alpha -= 0.00001 * delta_time;
		ID.y += 0.00001 * delta_time;
		if (ID.TEXT_CONNECT != undefined && ID.TAG != "HOME_FILE_TERMINAL" && ID.TAG != "HOME_FILE_EXPLORERS" && ID.TAG != "HOME_DATE_BACK"&& ID.TAG != "HOME_FILE_SETTINGS") {
			ID.TEXT_CONNECT.image_alpha = ID.image_alpha;
			ID.TEXT_CONNECT.y = ID.y;
		}
		if (ID.image_alpha <= 0) {
			if (ID.TEXT_CONNECT != undefined)
				DestroyText(ID.TEXT_CONNECT.TAG)
			if (ID.TYPE == "TEXT")
				DestroyText(ID.TAG);
			else
				DestroyObject(ID.TAG);
			return;
		}
	}
}

	// LOCK BUTTON
	if ((ID.LOCK[0] != undefined && !ID.LOCK[1].LOCK_STATE)) {
		ID.image_index = 2;
		return;
	} else if (ID.image_index == 2) { ID.image_index = 0; }
}

function DevStarterKit(ID) {
	//GET OPTIONS
	for (var i = 0; ID.OPTION[i] != undefined; i++) {
		if (OPTION[i][0] == "LOCK")
			ID.LOCK = ID.OPTION[i];
		if (ID.OPTION[i][0] == "IMAGE_INDEX")
			ID.OBJECT_LINKED.image_index =ID. OPTION[i][1];
		if (ID.OPTION[i][0] == "FADE_ON") {ID.FADE_ON = true; ID.FADE_ON_POWER = ID.OPTION[i][1]; }
		if (ID.OPTION[i][0] == "FADE_IN" && !ID.FADE_SATE) { 
			ID.FADE_IN = true; ID.FADE_POWER = ID.OPTION[i][1];
			ID.FADE_SATE = true; ID.image_alpha = 0;	
		}
		if (ID.OPTION[i][0] == "INFO") {ID.INFO = true; ID.INFO_NAME = ID.OPTION[i][1]; }
		if (ID.OPTION[i][0] == "SLIDE") {ID.SLIDE = true; ID.SLIDE_POWER = ID.OPTION[i][1]; }
		if (ID.OPTION[i][0] == "TIME_OUT") {ID.TIMER_OUT = true; ID.TIMER_TIME = ID.OPTION[i][1]; }
		if (ID.OPTION[i][0] == "EXT") {ID.EXT = true; ID.EXT_COLOR = ID.OPTION[i][1]; ID.EXT_RADIUS = ID.OPTION[i][2]; ID.EXT_SIZE = ID.OPTION[i][3];}
		if (ID.OPTION[i][0] == "SHADOW") {ID.SHADOW = true; ID.SHADOW_COLOR = ID.OPTION[i][1]; ID.SHADOW_SIZE = ID.OPTION[i][2]; ID.SHADOW_ALPHA = ID.OPTION[i][3];}
		if (ID.OPTION[i][0] == "EDIT") {ID.EDIT = true; ID.EDIT_X = ID.OPTION[i][1]; ID.EDIT_Y = ID.OPTION[i][2];}
		if (ID.OPTION[i][0] == "SECRET") {ID.SECRET = true; }
		if (ID.OPTION[i][0] == "CENTERED") {ID.CENTERED = true; }
		if (ID.OPTION[i][0] == "BACK") {ID.BACK = true; ID.BACK_POWER = OPTION[i][1]; }
	}
}