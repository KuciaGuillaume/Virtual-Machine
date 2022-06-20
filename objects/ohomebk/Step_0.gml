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
		SEARCH.write.TEXT = [keyboard_lastchar, "", undefined];
		SEARCH.TEXT_OUTPUT = keyboard_lastchar;
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
	if (search.TEXT_OUTPUT != search.INITIAL_TEXT && search.TEXT_OUTPUT != "" && keyboard_check_pressed(vk_anykey)) {
		var word = search.TEXT_OUTPUT;
		var X = 790;
		var Y = 550;
		var nb = 0;
		for (var i = 0; ALL_APPS_LIST[i] != undefined; i++) {
			var get = ALL_APPS_LIST[i];
			var size = string_byte_length(word);
			for (var e = 1; e != size; e++) {
				var find = "";
				for (var f = e; f != size; f++)
					find = find + string_char_at(word, f);
				if (string_count(find, get[0]) > 0 && (string_byte_length(find) > 1 || string_byte_length(word) <= 2)) {
					var button = get[1];
					if (button == undefined) {
						if (get[0] == "Terminal") {
							ALL_TERMINAL = CreateEmptyButton(OHomeEmpty, X, Y, 150, 50, #EEEEEE, #9DBBD5, "Home_Gp1", get[2], get[3], get[4], "EMPT_BUTTON-NO-HAND", [["AUTO_CLASS"], ["CENTERED"], ["SLIDE", 0.0001], ["FADE_IN", 0.000005], undefined]);
							ALL_APPS_LIST[i][1] = ALL_TERMINAL;
						}
						if (get[0] == "File_explorers") {
							ALL_EXPLORERS = CreateEmptyButton(OHomeEmpty, X, Y, 150, 50, #EEEEEE, #9DBBD5, "Home_Gp1", get[2], get[3], get[4], "EMPT_BUTTON-NO-HAND", [["AUTO_CLASS"], ["CENTERED"], ["SLIDE", 0.0001], ["FADE_IN", 0.000005], undefined]);
							ALL_APPS_LIST[i][1] = ALL_EXPLORERS;
						}
						if (nb == 3) {
							X = 790;
							Y += 60;
							nb = 0;
						} else {
							X += 175;
							nb += 1;
						}
						e = size - 1;
					} else if (instance_exists(get[1])){
						DestroyEmptyButton(get[1].TAG);
						if (get[0] == "Terminal") {
							ALL_TERMINAL = CreateEmptyButton(OHomeEmpty, X, Y, 150, 50, #EEEEEE, #9DBBD5, "Home_Gp1", get[2], get[3], get[4], "EMPT_BUTTON-NO-HAND", [["AUTO_CLASS"], ["CENTERED"], ["SLIDE", 0.0001], ["FADE_IN", 0.000005], undefined]);
							ALL_APPS_LIST[i][1] = ALL_TERMINAL;
						}
						if (get[0] == "File_explorers") {
							ALL_EXPLORERS = CreateEmptyButton(OHomeEmpty, X, Y, 150, 50, #EEEEEE, #9DBBD5, "Home_Gp1", get[2], get[3], get[4], "EMPT_BUTTON-NO-HAND", [["AUTO_CLASS"], ["CENTERED"], ["SLIDE", 0.0001], ["FADE_IN", 0.000005], undefined]);
							ALL_APPS_LIST[i][1] = ALL_EXPLORERS;
						}
						if (nb == 3) {
							X = 790;
							Y += 60;
							nb = 0;
						} else {
							X += 175;
							nb += 1;
						}
						e = size - 1;
					}
				} else if (get[1] != undefined) {
					DestroyEmptyButton(get[1].TAG);
					if (get[0] == "Terminal")
						ALL_TERMINAL = undefined;
					if (get[0] == "File_explorers")
						ALL_EXPLORERS = undefined;
					ALL_APPS_LIST[i][1] = undefined;
				}
			}
		}
	}
}

// DESTROY

if ((mouse_check_button_pressed(mb_any) && (!MouseInsideObject(id) && !MouseInsideObject(ON_MAIN_SCENE.TASKBAR)) || ctre || ctrt) && !TIMER_OUT)
	DestroyHome();
