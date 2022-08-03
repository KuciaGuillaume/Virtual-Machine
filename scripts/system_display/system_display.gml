// Les actifs du script ont changé pour v2.3.0 Voir
// https://help.yoyogames.com/hc/en-us/articles/360005277377 pour plus d’informations
function CreateSystemDisplay(id) {
	
	// CREATE RETURN BUTTON
	var empt_text = GetEmptText(id.x - 100, id.y + 200, AutoLanguage("BACK"), Arial10, c_gray, c_white, id.WINDOW.LAYERS[1]);
	
	var DISPLAY_BACK = CreateEmptyButton(OSettingEmpty, id.x - 103, id.y + 200, 100, 30, #FBFCFE, #435D7A, id.WINDOW.LAYERS[0], undefined, empt_text, id.TAG + "SYSTEM_BACK", "EMPT_BUTTON-NO-HAND", [["CENTERED"], undefined]);
	DISPLAY_BACK.PARENT = id;
	DISPLAY_BACK.REF_X = -103;
	DISPLAY_BACK.REF_Y = 27;
	DISPLAY_BACK.EXT = true;
	DISPLAY_BACK.EXT_COLOR = #EAEEF1;
	id.WINDOW.list_objects = addtolist(DISPLAY_BACK, id.WINDOW.list_objects);
	id.SSSYSTEM_DISPLAY_OBJECT = addtolist([DISPLAY_BACK, 190, 130, 1], id.SSSYSTEM_DISPLAY_OBJECT);
	
	// CREATE BRIGTHNESS_TITLE
	var BRIGHTNESS_TITLE = AddText(id.x - 100, id.y + 300, AutoLanguage("Brightness & color"), Segoe8, #262626, id.WINDOW.LAYERS[0], id.TAG + "BRIGHTNESS_TITLE", [undefined]);
	id.WINDOW.list_objects = addtolist(BRIGHTNESS_TITLE, id.WINDOW.list_objects);
	id.SSSYSTEM_DISPLAY_OBJECT = addtolist([BRIGHTNESS_TITLE, -100, 80, 1], id.SSSYSTEM_DISPLAY_OBJECT);
	
	// CREATE BRIGHNESS
	var empt_linked = GetEmptLinked(id.x - 290, id.y + 200, id.WINDOW.LAYERS[1], S_SSsystem_Luminosite, OJustGUI,  "IMAGE");
	var empt_text = GetEmptText(id.x - 100, id.y + 200, AutoLanguage("Brightness"), Arial10, c_gray, c_gray, id.WINDOW.LAYERS[1]);
	
	var BRIGHTNESS = CreateEmptyButton(OSettingEmpty, id.x - 100, id.y + 200, 450, 50, #FBFCFE, #F8FAFF, id.WINDOW.LAYERS[0], empt_linked, empt_text, id.TAG + "BRIGHTNESS", "EMPT_BUTTON-NO-HAND", [["BACK", 150], undefined]);
	BRIGHTNESS.PARENT = id;
	BRIGHTNESS.REF_X = -100;
	BRIGHTNESS.REF_Y = 100;
	BRIGHTNESS.EXT = true;
	BRIGHTNESS.EXT_COLOR = #EAEEF1;
	id.WINDOW.list_objects = addtolist(BRIGHTNESS, id.WINDOW.list_objects);
	id.SSSYSTEM_DISPLAY_OBJECT = addtolist([BRIGHTNESS, 190, 130, 1], id.SSSYSTEM_DISPLAY_OBJECT);
	
	// CREATE BRIGHTNESS BAR_1
	var bar_1 = CreateObjectSprite(id.x + 110, id.y + 122, id.WINDOW.LAYERS[1], S_Brightness_bar_1, OJustGUI, "IMAGE", id.TAG + "BRIGHTNESS_BAR_1", [undefined]);
	id.WINDOW.list_objects = addtolist(bar_1, id.WINDOW.list_objects);
	id.SSSYSTEM_DISPLAY_OBJECT = addtolist([bar_1, 110, 122, 1], id.SSSYSTEM_DISPLAY_OBJECT);
	
	// CREATE BRIGHTNESS SELECTOR
	var selector = CreateObjectSprite(id.x + 110 + (global.SETTINGS[0] * 2), id.y + 127, id.WINDOW.LAYERS[3], S_Brightness_selector, OJustButtonSettings, "BUTTON", id.TAG + "BRIGHTNESS_SELECTOR", [undefined]);
	id.WINDOW.list_objects = addtolist(selector, id.WINDOW.list_objects);
	id.SSSYSTEM_DISPLAY_OBJECT = addtolist([selector, 110 + (global.SETTINGS[0] * 2), 127, 1], id.SSSYSTEM_DISPLAY_OBJECT);
	selector.PARENT = id;
	selector.OBJECT_LINKED = bar_1;
	selector.BRIGHTNESS = global.SETTINGS[0];

	// CREATE BRIGHTNESS BAR_2
	var bar_2 = CreateObjectSprite(id.x + 110, id.y + 122, id.WINDOW.LAYERS[2], S_Brightness_bar_2, OJustButtonSettings, "IMAGE", id.TAG + "BRIGHTNESS_BAR_2", [undefined]);
	id.WINDOW.list_objects = addtolist(bar_2, id.WINDOW.list_objects);
	id.SSSYSTEM_DISPLAY_OBJECT = addtolist([bar_2, 110, 122, 1], id.SSSYSTEM_DISPLAY_OBJECT);
	bar_2.OBJECT_LINKED = selector;
	bar_2.PARENT = id;
	bar_2.SET_DISPLAY_LEFT = true;
	bar_2.IMAGE_HEIGHT = 10;
	bar_2.IMAGE_TOP = 0;
	bar_2.IMAGE_LEFT = 0;
	
	// CREATE NIGHT
	var empt_linked = GetEmptLinked(id.x - 290, id.y + 255, id.WINDOW.LAYERS[1], S_SSsystem_Night_light, OJustGUI,  "IMAGE");
	var empt_text = GetEmptText(id.x - 100, id.y + 255, AutoLanguage("Night light"), Arial10, c_gray, c_gray, id.WINDOW.LAYERS[1]);
	
	var NIGHT = CreateEmptyButton(OSettingEmpty, id.x - 100, id.y + 255, 450, 50, #FBFCFE, #F8FAFF, id.WINDOW.LAYERS[0], empt_linked, empt_text, id.TAG + "NIGHT_LIGHT", "EMPT_BUTTON-NO-HAND", [["BACK", 150], undefined]);
	NIGHT.PARENT = id;
	NIGHT.REF_X = -100;
	NIGHT.REF_Y = 155;
	NIGHT.EXT = true;
	NIGHT.EXT_COLOR = #EAEEF1;
	id.WINDOW.list_objects = addtolist(NIGHT, id.WINDOW.list_objects);
	id.SSSYSTEM_DISPLAY_OBJECT = addtolist([NIGHT, 190, 130, 1], id.SSSYSTEM_DISPLAY_OBJECT);
	
	// CREATE NIGHT CHECKER
	var NIGHT_CHECKER = CreateChecker((bar_1.x + bar_1.sprite_width) - 15, id.y + 182, global.SETTINGS[1], id.WINDOW.LAYERS[1], id.WINDOW.LAYERS[2], id.WINDOW.LAYERS[3], id.TAG + "NIGHT_CHECKER", [undefined]);
	id.WINDOW.list_objects = addtolist(NIGHT_CHECKER[0], id.WINDOW.list_objects);
	id.WINDOW.list_objects = addtolist(NIGHT_CHECKER[1], id.WINDOW.list_objects);
	id.WINDOW.list_objects = addtolist(NIGHT_CHECKER[2], id.WINDOW.list_objects);
	id.SSSYSTEM_DISPLAY_OBJECT = addtolist([NIGHT_CHECKER[0], Diff(id.x, NIGHT_CHECKER[0].x), Diff(id.y, NIGHT_CHECKER[0].y), 1], id.SSSYSTEM_DISPLAY_OBJECT);
	id.SSSYSTEM_DISPLAY_OBJECT = addtolist([NIGHT_CHECKER[1], Diff(id.x, NIGHT_CHECKER[1].x), Diff(id.y, NIGHT_CHECKER[1].y), 1], id.SSSYSTEM_DISPLAY_OBJECT);
	id.SSSYSTEM_DISPLAY_OBJECT = addtolist([NIGHT_CHECKER[2], Diff(id.x, NIGHT_CHECKER[2].x), Diff(id.y, NIGHT_CHECKER[2].y), 1], id.SSSYSTEM_DISPLAY_OBJECT);
	NIGHT_CHECKER[2].PARENT = id;

	// CREATE RESOLUTION_TITLE
	var RESOLUTION_TITLE = AddText(id.x - 100, id.y + 300, AutoLanguage("Resolution"), Segoe8, #262626, id.WINDOW.LAYERS[0], id.TAG + "RESOLUTION_TITLE", [undefined]);
	id.WINDOW.list_objects = addtolist(RESOLUTION_TITLE, id.WINDOW.list_objects);
	id.SSSYSTEM_DISPLAY_OBJECT = addtolist([RESOLUTION_TITLE, -100, 220, 1], id.SSSYSTEM_DISPLAY_OBJECT);
	
	// CREATE RESOLUTION SELECTION
	var empt_linked = GetEmptLinked(id.x - 290, id.y + 255, id.WINDOW.LAYERS[1], S_SSsystem_Display_resolution, OJustGUI,  "IMAGE");
	var empt_text = GetEmptText(id.x - 100, id.y + 255, AutoLanguage("Display"), Arial10, c_gray, c_gray, id.WINDOW.LAYERS[1]);
	
	var RESOLUTION = CreateEmptyButton(OSettingEmpty, id.x - 100, id.y + 255, 450, 50, #FBFCFE, #F8FAFF, id.WINDOW.LAYERS[0], empt_linked, empt_text, id.TAG + "RESOLUTION", "EMPT_BUTTON-NO-HAND", [["BACK", 150], undefined]);
	RESOLUTION.PARENT = id;
	RESOLUTION.REF_X = -100;
	RESOLUTION.REF_Y = 240;
	RESOLUTION.EXT = true;
	RESOLUTION.EXT_COLOR = #EAEEF1;
	id.WINDOW.list_objects = addtolist(RESOLUTION, id.WINDOW.list_objects);
	id.SSSYSTEM_DISPLAY_OBJECT = addtolist([RESOLUTION, 190, 240, 1], id.SSSYSTEM_DISPLAY_OBJECT);
	
	// CREATE RESOLUTION SELECTR V2
	var all_display = ["2715 x 1527", "1920 x 1080", "1680 x 1050", "1600 x 900", "1440 x 900", "1400 x 1050", "1366 x 768", "1280 x 1024", "1280 x 720", "800 x 600", undefined];
	var actual_resolution = global.SETTINGS[2];
	var index = getonlist_index(actual_resolution, all_display);
	if (index == -1) {
		all_display = addtolist(actual_resolution, all_display);
		index = getonlist_index(actual_resolution, all_display);
	}
	var selectv2 = CreateSelectV2(id.x, id.y + 300, 200, 20, id.WINDOW.LAYERS[1], id.WINDOW.LAYERS[2], index, all_display, id.TAG + "SELECT_RESOLUTION", [undefined]);
	selectv2.PARENT = id;
	selectv2.REF_X = 50;
	selectv2.REF_Y = 255;
	selectv2.EXT = true;
	selectv2.EXT_COLOR = #EAEEF1;
	id.WINDOW.list_objects = addtolist(selectv2, id.WINDOW.list_objects);
	id.SSSYSTEM_DISPLAY_OBJECT = addtolist([selectv2, 50, 255, 1], id.SSSYSTEM_DISPLAY_OBJECT);
	id.SSSYSTEM_DISPLAY_OBJECT = addtolist([selectv2, 50, 255, 1], id.SSSYSTEM_DISPLAY_OBJECT);

	// CREATE DISPLAY RESOLUTION CHECKER
	
	if (!global.SETTINGS[3][2])
		var active = true;
	else
		var active = false;
	var DISPLAY_CHECKER = CreateChecker(id.x + 295, id.y + 265, active, id.WINDOW.LAYERS[1], id.WINDOW.LAYERS[2], id.WINDOW.LAYERS[3], id.TAG + "DISPLAY_CHECKER", [undefined]);
	id.WINDOW.list_objects = addtolist(DISPLAY_CHECKER[0], id.WINDOW.list_objects);
	id.WINDOW.list_objects = addtolist(DISPLAY_CHECKER[1], id.WINDOW.list_objects);
	id.WINDOW.list_objects = addtolist(DISPLAY_CHECKER[2], id.WINDOW.list_objects);
	id.SSSYSTEM_DISPLAY_OBJECT = addtolist([DISPLAY_CHECKER[0], Diff(id.x, DISPLAY_CHECKER[0].x), Diff(id.y, DISPLAY_CHECKER[0].y), 1], id.SSSYSTEM_DISPLAY_OBJECT);
	id.SSSYSTEM_DISPLAY_OBJECT = addtolist([DISPLAY_CHECKER[1], Diff(id.x, DISPLAY_CHECKER[1].x), Diff(id.y, DISPLAY_CHECKER[1].y), 1], id.SSSYSTEM_DISPLAY_OBJECT);
	id.SSSYSTEM_DISPLAY_OBJECT = addtolist([DISPLAY_CHECKER[2], Diff(id.x, DISPLAY_CHECKER[2].x), Diff(id.y, DISPLAY_CHECKER[2].y), 1], id.SSSYSTEM_DISPLAY_OBJECT);
	DISPLAY_CHECKER[2].PARENT = id;

	// CREATE CUTSOTM RESOLUTION
	var empt_linked = GetEmptLinked(id.x - 290, id.y + 295, id.WINDOW.LAYERS[1], S_SSsystem_Custom_resolution, OJustGUI,  "IMAGE");
	var empt_text = GetEmptText(id.x - 100, id.y + 295, AutoLanguage("Custom"), Arial10, c_gray, c_gray, id.WINDOW.LAYERS[1]);
	
	var CUSTOM_RES = CreateEmptyButton(OSettingEmpty, id.x - 100, id.y + 295, 450, 50, #FBFCFE, #F8FAFF, id.WINDOW.LAYERS[0], empt_linked, empt_text, id.TAG + "CUSTOM_RES", "EMPT_BUTTON-NO-HAND", [["BACK", 150], undefined]);
	CUSTOM_RES.PARENT = id;
	CUSTOM_RES.REF_X = -100;
	CUSTOM_RES.REF_Y = 295;
	CUSTOM_RES.EXT = true;
	CUSTOM_RES.EXT_COLOR = #EAEEF1;
	id.WINDOW.list_objects = addtolist(CUSTOM_RES, id.WINDOW.list_objects);
	id.SSSYSTEM_DISPLAY_OBJECT = addtolist([CUSTOM_RES, 190, 295, 1], id.SSSYSTEM_DISPLAY_OBJECT);
	
	// CREATE TEXT BUTTON LEFT

	var CUSTOM_RES_LEFT = CreateTextButton(id.x + 100, id.y + 320, S_SSystem_text_button, global.SETTINGS[3][0], id.WINDOW.LAYERS[1], id.WINDOW.LAYERS[2], c_gray, Arial10, 4, id.TAG + "CUSTOM_LEFT", [["CENTERED"], undefined]);
	CUSTOM_RES_LEFT.write.BAR.image_index = 1;
	id.WINDOW.list_objects = addtolist(CUSTOM_RES_LEFT, id.WINDOW.list_objects);
	id.SSSYSTEM_DISPLAY_OBJECT = addtolist([CUSTOM_RES_LEFT, 100, 320, 1], id.SSSYSTEM_DISPLAY_OBJECT);

	// CREATE TEXT BUTTON RIGHT

	var CUSTOM_RES_RIGHT = CreateTextButton(id.x + 200, id.y + 320, S_SSystem_text_button, global.SETTINGS[3][1], id.WINDOW.LAYERS[1], id.WINDOW.LAYERS[2], c_gray, Arial10, 4, id.TAG + "CUSTOM_RIGHT", [["CENTERED"], undefined]);
	CUSTOM_RES_RIGHT.write.BAR.image_index = 1;
	id.WINDOW.list_objects = addtolist(CUSTOM_RES_RIGHT, id.WINDOW.list_objects);
	id.SSSYSTEM_DISPLAY_OBJECT = addtolist([CUSTOM_RES_RIGHT, 200, 320, 1], id.SSSYSTEM_DISPLAY_OBJECT);

	// CREATE CUSTOM RESOLUTION CHECKER
	if (!active)
		active = true;
	else
		active = false;
	var CUSTOM_CHECKER = CreateChecker(id.x + 295, id.y + 320, active, id.WINDOW.LAYERS[1], id.WINDOW.LAYERS[2], id.WINDOW.LAYERS[3], id.TAG + "CUSTOM_CHECKER", [undefined]);
	id.WINDOW.list_objects = addtolist(CUSTOM_CHECKER[0], id.WINDOW.list_objects);
	id.WINDOW.list_objects = addtolist(CUSTOM_CHECKER[1], id.WINDOW.list_objects);
	id.WINDOW.list_objects = addtolist(CUSTOM_CHECKER[2], id.WINDOW.list_objects);
	id.SSSYSTEM_DISPLAY_OBJECT = addtolist([CUSTOM_CHECKER[0], Diff(id.x, CUSTOM_CHECKER[0].x), Diff(id.y, CUSTOM_CHECKER[0].y), 1], id.SSSYSTEM_DISPLAY_OBJECT);
	id.SSSYSTEM_DISPLAY_OBJECT = addtolist([CUSTOM_CHECKER[1], Diff(id.x, CUSTOM_CHECKER[1].x), Diff(id.y, CUSTOM_CHECKER[1].y), 1], id.SSSYSTEM_DISPLAY_OBJECT);
	id.SSSYSTEM_DISPLAY_OBJECT = addtolist([CUSTOM_CHECKER[2], Diff(id.x, CUSTOM_CHECKER[2].x), Diff(id.y, CUSTOM_CHECKER[2].y), 1], id.SSSYSTEM_DISPLAY_OBJECT);
	CUSTOM_CHECKER[2].PARENT = id;
	
	// CREATE FULLSCREEN
	var empt_linked = GetEmptLinked(id.x - 290, id.y + 350, id.WINDOW.LAYERS[1], S_SSsystem_Fullscreen, OJustGUI,  "IMAGE");
	var empt_text = GetEmptText(id.x - 100, id.y + 350, AutoLanguage("Fullscreen"), Arial10, c_gray, c_gray, id.WINDOW.LAYERS[1]);
	
	var FULLSCREEN = CreateEmptyButton(OSettingEmpty, id.x - 100, id.y + 350, 450, 50, #FBFCFE, #F8FAFF, id.WINDOW.LAYERS[0], empt_linked, empt_text, id.TAG + "SET_FULLSCREEN", "EMPT_BUTTON-NO-HAND", [["BACK", 150], undefined]);
	FULLSCREEN.PARENT = id;
	FULLSCREEN.REF_X = -100;
	FULLSCREEN.REF_Y = 350;
	FULLSCREEN.EXT = true;
	FULLSCREEN.EXT_COLOR = #EAEEF1;
	id.WINDOW.list_objects = addtolist(FULLSCREEN, id.WINDOW.list_objects);
	id.SSSYSTEM_DISPLAY_OBJECT = addtolist([FULLSCREEN, 190, 350, 1], id.SSSYSTEM_DISPLAY_OBJECT);
	
	// CREATE FULLSCREEN CHECKER
	var FULLSCREEN_CHECKER = CreateChecker(id.x + 295, id.y + 375, global.SETTINGS[4], id.WINDOW.LAYERS[1], id.WINDOW.LAYERS[2], id.WINDOW.LAYERS[3], id.TAG + "FULLSCREEN_CHECKER", [undefined]);
	id.WINDOW.list_objects = addtolist(FULLSCREEN_CHECKER[0], id.WINDOW.list_objects);
	id.WINDOW.list_objects = addtolist(FULLSCREEN_CHECKER[1], id.WINDOW.list_objects);
	id.WINDOW.list_objects = addtolist(FULLSCREEN_CHECKER[2], id.WINDOW.list_objects);
	id.SSSYSTEM_DISPLAY_OBJECT = addtolist([FULLSCREEN_CHECKER[0], Diff(id.x, FULLSCREEN_CHECKER[0].x), Diff(id.y, FULLSCREEN_CHECKER[0].y), 1], id.SSSYSTEM_DISPLAY_OBJECT);
	id.SSSYSTEM_DISPLAY_OBJECT = addtolist([FULLSCREEN_CHECKER[1], Diff(id.x, FULLSCREEN_CHECKER[1].x), Diff(id.y, FULLSCREEN_CHECKER[1].y), 1], id.SSSYSTEM_DISPLAY_OBJECT);
	id.SSSYSTEM_DISPLAY_OBJECT = addtolist([FULLSCREEN_CHECKER[2], Diff(id.x, FULLSCREEN_CHECKER[2].x), Diff(id.y, FULLSCREEN_CHECKER[2].y), 1], id.SSSYSTEM_DISPLAY_OBJECT);
	FULLSCREEN_CHECKER[2].PARENT = id;
	
	// CREATE OPTIONS TITLE
	var OPTIONS_TITLE = AddText(id.x - 100, id.y + 415, AutoLanguage("Display options"), Segoe8, #262626, id.WINDOW.LAYERS[0], id.TAG + "OPTIONS_TITLE", [undefined]);
	id.WINDOW.list_objects = addtolist(OPTIONS_TITLE, id.WINDOW.list_objects);
	id.SSSYSTEM_DISPLAY_OBJECT = addtolist([OPTIONS_TITLE, -100, 415, 1], id.SSSYSTEM_DISPLAY_OBJECT);
	
	// CREATE OPTIONS FRAMERATE
	var empt_linked = GetEmptLinked(id.x - 290, id.y + 435, id.WINDOW.LAYERS[1], S_SSsystem_Framerate, OJustGUI,  "IMAGE");
	var empt_text = GetEmptText(id.x - 100, id.y + 435, AutoLanguage("Show frames per second"), Arial10, c_gray, c_gray, id.WINDOW.LAYERS[1]);
	
	var FRAMERATE = CreateEmptyButton(OSettingEmpty, id.x - 100, id.y + 435, 450, 50, #FBFCFE, #F8FAFF, id.WINDOW.LAYERS[0], empt_linked, empt_text, id.TAG + "FRAMERATE", "EMPT_BUTTON-NO-HAND", [["BACK", 150], undefined]);
	FRAMERATE.PARENT = id;
	FRAMERATE.REF_X = -100;
	FRAMERATE.REF_Y = 435;
	FRAMERATE.EXT = true;
	FRAMERATE.EXT_COLOR = #EAEEF1;
	id.WINDOW.list_objects = addtolist(FRAMERATE, id.WINDOW.list_objects);
	id.SSSYSTEM_DISPLAY_OBJECT = addtolist([FRAMERATE, 190, 435, 1], id.SSSYSTEM_DISPLAY_OBJECT);
	
	// CREATE FRAMERATE CHECKER
	var FRAMERATE_CHECKER = CreateChecker(id.x + 295, id.y + 460, global.SETTINGS[5], id.WINDOW.LAYERS[1], id.WINDOW.LAYERS[2], id.WINDOW.LAYERS[3], id.TAG + "FRAMERATE_CHECKER", [undefined]);
	id.WINDOW.list_objects = addtolist(FRAMERATE_CHECKER[0], id.WINDOW.list_objects);
	id.WINDOW.list_objects = addtolist(FRAMERATE_CHECKER[1], id.WINDOW.list_objects);
	id.WINDOW.list_objects = addtolist(FRAMERATE_CHECKER[2], id.WINDOW.list_objects);
	id.SSSYSTEM_DISPLAY_OBJECT = addtolist([FRAMERATE_CHECKER[0], Diff(id.x, FRAMERATE_CHECKER[0].x), Diff(id.y, FRAMERATE_CHECKER[0].y), 1], id.SSSYSTEM_DISPLAY_OBJECT);
	id.SSSYSTEM_DISPLAY_OBJECT = addtolist([FRAMERATE_CHECKER[1], Diff(id.x, FRAMERATE_CHECKER[1].x), Diff(id.y, FRAMERATE_CHECKER[1].y), 1], id.SSSYSTEM_DISPLAY_OBJECT);
	id.SSSYSTEM_DISPLAY_OBJECT = addtolist([FRAMERATE_CHECKER[2], Diff(id.x, FRAMERATE_CHECKER[2].x), Diff(id.y, FRAMERATE_CHECKER[2].y), 1], id.SSSYSTEM_DISPLAY_OBJECT);
	FRAMERATE_CHECKER[2].PARENT = id;

	// CREATE Apply changement
	
	var X = 350;
	var Y = 530;
	var empt_text = GetEmptText(id.x + X, id.y + Y, AutoLanguage("Apply Changes"), Arial10, c_gray, c_white, id.WINDOW.LAYERS[1]);
	
	var size = string_width(empt_text.TEXT) + 20;
	
	X -= size;
	empt_text.X -= size;
	var APPLY = CreateEmptyButton(OSettingEmpty, id.x + X, id.y + Y, size, 25, #FBFCFE, #0079FF, id.WINDOW.LAYERS[0], undefined, empt_text, id.TAG + "DISPLAY_APPLY_CHANGES", "EMPT_BUTTON-NO-HAND", [["CENTERED"], undefined]);
	APPLY.PARENT = id;
	APPLY.REF_X = X;
	APPLY.REF_Y = Y;
	APPLY.EXT = true;
	APPLY.EXT_COLOR = #EAEEF1;
	APPLY.SELECTV2_CONNECT = selectv2;
	id.WINDOW.list_objects = addtolist(APPLY, id.WINDOW.list_objects);
	id.SSSYSTEM_DISPLAY_OBJECT = addtolist([APPLY, X, Y, 1], id.SSSYSTEM_DISPLAY_OBJECT);
}

function UpdateSystemDisplay(id) {
	
	for (var i = 0; id.SSSYSTEM_DISPLAY_OBJECT[i] != undefined; i++) {
		var get = id.SSSYSTEM_DISPLAY_OBJECT[i][0];
		if (id.image_alpha < 1)
			get.ALPHA = id.image_alpha * id.SSSYSTEM_DISPLAY_OBJECT[i][3];
		else
			get.ALPHA = id.SSSYSTEM_DISPLAY_OBJECT[i][3];
		if (get.TYPE != "EMPT_BUTTON-NO-HAND") {
			get.x = id.x + id.SSSYSTEM_DISPLAY_OBJECT[i][1];
			get.y = id.y + id.SSSYSTEM_DISPLAY_OBJECT[i][2];
		}
		get.ON = id.WINDOW.ON;
	}
}

function DestroySSystemDisplay(id) {
	
	// DELETE ALL
	for (var i = 0; id.SSSYSTEM_DISPLAY_OBJECT[i] != undefined; i++) {
		var get = id.SSSYSTEM_DISPLAY_OBJECT[i][0];
		
		if (!id.CLOSE)
			id.WINDOW.list_objects = remove_findlist(get, id.WINDOW.list_objects);
		if (get.TYPE == "EMPT_BUTTON-NO-HAND") {
			if (string_count("SELECTV2", get.TAG) == 0)
				DestroyEmptyButton(get.TAG);
			else {
				for (var e = 0; get.SELECTS[e] != undefined; e++)
					DestroyEmptyButton(get.SELECTS[e].TAG);
				DestroyObject(get.TAG + "BOX");
				DestroyEmptyButton(get.TAG);
			}
		}
		if (get.TYPE == "TEXT")
			DestroyText(get.TAG);
		if (get.TYPE == "IMAGE" || get.TYPE == "BUTTON" || get.TYPE == "CHECKER")
			DestroyObject(get.TAG);
		if (get.TYPE == "TEXT_BUTTON")
			DestroyTextButton(get.TAG);
	}
	id.SSSYSTEM_DISPLAY_OBJECT = [undefined];
}