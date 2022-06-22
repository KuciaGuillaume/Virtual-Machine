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

if (KeyPressed(ord("E")) && KeyPress(vk_control)) var ctre = true;
else var ctre = false;
if (KeyPressed(ord("T")) && KeyPress(vk_control)) var ctrt = true;
else var ctrt = false;

	

if (TIMER_OUT) {
	TIMER_DELTA += delta_time / 1000000;
	if (TIMER_DELTA >= TIMER_TIME) {
		TIMER_STATE_END = true;
		image_alpha -= 0.00001 * delta_time;
		y += 0.00001 * delta_time;
		if (image_alpha <= 0) {
			ON_MAIN_SCENE.HOME = undefined;
			DestroyObject(TAG);
		}
	}
}

if (SLIDE && image_alpha < 1 && ON) {
	y -= SLIDE_POWER * delta_time;
	if (TEXT_CONNECT != undefined)
		TEXT_CONNECT.y -= SLIDE_POWER * delta_time;
} else if (image_alpha >= 1 && SLIDE)
	SLIDE_OUT = true;
	

// SEARCH
if (SEARCH != undefined && !CLOSE) {
	if (!SEARCH.write.ON_WRITE && keyboard_check_pressed(vk_anykey) && !keyboard_check_pressed(vk_enter)) {
		SEARCH.write.ON_WRITE = true;
		if (SEARCH.write.TEXT_OUTPUT != SEARCH.write.INITIAL_TEXT) {
			SEARCH.write.TEXT = addtolistnum(keyboard_lastchar, SEARCH.write.TEXT,SEARCH.write.TEXT_INDEX_MAX);
			SEARCH.write.TEXT_INDEX_MAX += 1;
			SEARCH.write.TEXT = addtolistnum("", SEARCH.write.TEXT,SEARCH.write.TEXT_INDEX_MAX);
			SEARCH.write.TEXT_INDEX += 1;
		} else {
			SEARCH.write.TEXT = [keyboard_lastchar, "", undefined];
			SEARCH.write.TEXT_INDEX += 1;
			SEARCH.write.TEXT_INDEX_MAX += 1;
		}
	}
	if (SEARCH.write.TEXT_OUTPUT != SEARCH.write.INITIAL_TEXT && ALL_APPS != undefined && instance_exists(ALL_APPS) && ALL_APPS.TEXT != "Search results" && SEARCH.write.TEXT_OUTPUT != "") {
		ALL_APPS.TEXT = "Search results";
		DestroyHomeApps();
	} else if (ALL_APPS != undefined && instance_exists(ALL_APPS) && ALL_APPS.TEXT == "Search results" && ((!SEARCH.write.ON_WRITE && SEARCH.write.TEXT_OUTPUT == SEARCH.write.INITIAL_TEXT) || (SEARCH.write.ON_WRITE && SEARCH.write.TEXT_OUTPUT == ""))) {
		DestroyHomeApps();
		RECOMMANDED = AddText(715, 790, "Recommanded", Segoe10, c_black, "Home_Gp1", "HOME_TEXT_ALL_RECOMMANDED", [["SLIDE", 0.0001], ["FADE_IN", 0.000005], undefined]);
		ALL_APPS.TEXT = "All Apps";
		CreateHomeApps();
	}
	var search = SEARCH.write;
	if (search.TEXT_OUTPUT != search.INITIAL_TEXT && search.TEXT_OUTPUT != "" && keyboard_check_pressed(vk_anykey))
		Home_search_apps(id, search);
	
	if (MouseInsideObject(id) && (mouse_wheel_down() || mouse_wheel_up()) && SEARCH.write.TEXT_OUTPUT != "" && SEARCH.write.TEXT_OUTPUT != SEARCH.write.INITIAL_TEXT) {
		if (mouse_wheel_down())
			var SPEED = 0.001 * delta_time;
		else
			var SPEED = -0.001 * delta_time;


		var size = array_size(ALL_FILES_LIST) - 1;
		if (size >= 0) var last = ALL_FILES_LIST[size];
		else var last = undefined;
		if (ALL_FILES_LIST[0] != undefined) var start = ALL_FILES_LIST[0];
		else var start = undefined;
		
		var minimum_v = 1500, maximum_v = 0;
		var minimum = undefined, maximum = undefined;
		for (var i = 0; ALL_APPS_LIST[i] != undefined; i++) {
			var get = ALL_APPS_LIST[i];
			if (ALL_APPS_LIST[i][1] == undefined || !instance_exists(ALL_APPS_LIST[i][1]))
				continue;
			var obj = ALL_APPS_LIST[i][1];
			if (obj.y < minimum_v)
				minimum = obj;
			if (obj.y > maximum_v)
				maximum = obj;
		}
		
		if (maximum != undefined) {
			if (last == undefined)
				last = maximum;
			else if (maximum.y > last.y)
				last = maximum;
		}

		if (minimum != undefined) {
			if (start == undefined)
				start = minimum;
			else if (minimum.y < start.y)
				start = minimum;
		}

		if (last != undefined && last.y + 25 < 888 && mouse_wheel_down())
			return;
		if (start != undefined && start.y + 25 > 522 && mouse_wheel_up())
			return;


		for (var i = 0; ALL_FILES_LIST[i] != undefined; i++) {
			var object = ALL_FILES_LIST[i];
			object.y -= SPEED;
			object.TEXT_CONNECT.y -= SPEED;
			object.OBJECT_LINKED.y -= SPEED;
		}
		for (var i = 0; ALL_APPS_LIST[i] != undefined; i++) {
			var get = ALL_APPS_LIST[i];
			if (ALL_APPS_LIST[i][1] == undefined || !instance_exists(ALL_APPS_LIST[i][1]))
				continue;
			var object = ALL_APPS_LIST[i][1];
			object.y -= SPEED;
			object.TEXT_CONNECT.y -= SPEED;
			object.OBJECT_LINKED.y -= SPEED;
		}
		Update_home_files(id);
	}
}

// DESTROY

if ((mouse_check_button_pressed(mb_any) && (!MouseInsideObject(id) && !MouseInsideObject(ON_MAIN_SCENE.TASKBAR)) || ctre || ctrt) && !TIMER_OUT)
	DestroyHome();
