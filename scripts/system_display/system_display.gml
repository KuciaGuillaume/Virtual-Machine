// Les actifs du script ont changé pour v2.3.0 Voir
// https://help.yoyogames.com/hc/en-us/articles/360005277377 pour plus d’informations
function CreateSystemDisplay(id) {
	
	// CREATE RETURN BUTTON
	var empt_text = GetEmptText(id.x - 100, id.y + 200, "BACK", Arial10, c_gray, c_white, id.WINDOW.LAYERS[1]);
	
	var DISPLAY = CreateEmptyButton(OSettingEmpty, id.x - 103, id.y + 200, 100, 30, #FBFCFE, #435D7A, id.WINDOW.LAYERS[0], undefined, empt_text, id.TAG + "SYSTEM_BACK", "EMPT_BUTTON-NO-HAND", [["CENTERED"], undefined]);
	DISPLAY.PARENT = id;
	DISPLAY.REF_X = -103;
	DISPLAY.REF_Y = 27;
	DISPLAY.EXT = true;
	DISPLAY.EXT_COLOR = #EAEEF1;
	id.WINDOW.list_objects = addtolist(DISPLAY, id.WINDOW.list_objects);
	id.SSSYSTEM_DISPLAY_OBJECT = addtolist([DISPLAY, 190, 130, 1], id.SSSYSTEM_DISPLAY_OBJECT);
	
	// CREATE BRIGTHNESS_TITLE
	var BRIGHTNESS_TITLE = AddText(id.x - 100, id.y + 300, "Brightness & color", Segoe8, #262626, id.WINDOW.LAYERS[0], id.TAG + "BRIGHTNESS_TITLE", [undefined]);
	id.WINDOW.list_objects = addtolist(BRIGHTNESS_TITLE, id.WINDOW.list_objects);
	id.SSSYSTEM_DISPLAY_OBJECT = addtolist([BRIGHTNESS_TITLE, -100, 80, 1], id.SSSYSTEM_DISPLAY_OBJECT);
	
	// CREATE BRIGHNESS
	var empt_linked = GetEmptLinked(id.x - 290, id.y + 200, id.WINDOW.LAYERS[1], S_SSsystem_Luminosite, OJustGUI,  "IMAGE");
	var empt_text = GetEmptText(id.x - 100, id.y + 200, "Brightness", Arial10, c_gray, c_gray, id.WINDOW.LAYERS[1]);
	
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
	var empt_text = GetEmptText(id.x - 100, id.y + 255, "Night light", Arial10, c_gray, c_gray, id.WINDOW.LAYERS[1]);
	
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
	var RESOLUTION_TITLE = AddText(id.x - 100, id.y + 300, "Resolution", Segoe8, #262626, id.WINDOW.LAYERS[0], id.TAG + "RESOLUTION_TITLE", [undefined]);
	id.WINDOW.list_objects = addtolist(RESOLUTION_TITLE, id.WINDOW.list_objects);
	id.SSSYSTEM_DISPLAY_OBJECT = addtolist([RESOLUTION_TITLE, -100, 220, 1], id.SSSYSTEM_DISPLAY_OBJECT);
	
	// CREATE RESOLUTION SELECTION
	var empt_linked = GetEmptLinked(id.x - 290, id.y + 255, id.WINDOW.LAYERS[1], S_SSsystem_Display_resolution, OJustGUI,  "IMAGE");
	var empt_text = GetEmptText(id.x - 100, id.y + 255, "Display resolution", Arial10, c_gray, c_gray, id.WINDOW.LAYERS[1]);
	
	var RESOLUTION = CreateEmptyButton(OSettingEmpty, id.x - 100, id.y + 255, 450, 50, #FBFCFE, #F8FAFF, id.WINDOW.LAYERS[0], empt_linked, empt_text, id.TAG + "RESOLUTION", "EMPT_BUTTON-NO-HAND", [["BACK", 150], undefined]);
	RESOLUTION.PARENT = id;
	RESOLUTION.REF_X = -100;
	RESOLUTION.REF_Y = 240;
	RESOLUTION.EXT = true;
	RESOLUTION.EXT_COLOR = #EAEEF1;
	id.WINDOW.list_objects = addtolist(RESOLUTION, id.WINDOW.list_objects);
	id.SSSYSTEM_DISPLAY_OBJECT = addtolist([RESOLUTION, 190, 240, 1], id.SSSYSTEM_DISPLAY_OBJECT);
	
	// CREATE RESOLUTION SELECTR V2
	var selectv2 = CreateSelectV2(id.x, id.y + 300, 200, 20, id.WINDOW.LAYERS[1], id.WINDOW.LAYERS[2], 0, ["1920 x 1080 (Recommanded)", undefined], id.TAG + "SELECT_RESOLUTION", [undefined]);
	selectv2.PARENT = id;
	selectv2.REF_X = 120;
	selectv2.REF_Y = 255;
	selectv2.EXT = true;
	selectv2.EXT_COLOR = #EAEEF1;
	id.WINDOW.list_objects = addtolist(selectv2, id.WINDOW.list_objects);
	id.SSSYSTEM_DISPLAY_OBJECT = addtolist([selectv2, 250, 255, 1], id.SSSYSTEM_DISPLAY_OBJECT);
	id.SSSYSTEM_DISPLAY_OBJECT = addtolist([selectv2, 250, 255, 1], id.SSSYSTEM_DISPLAY_OBJECT);
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
		if (get.TYPE == "EMPT_BUTTON-NO-HAND")
			DestroyEmptyButton(get.TAG);
		if (get.TYPE == "TEXT")
			DestroyText(get.TAG);
		if (get.TYPE == "IMAGE" || get.TYPE == "BUTTON" || get.TYPE == "CHECKER")
			DestroyObject(get.TAG);
	}
	id.SSSYSTEM_DISPLAY_OBJECT = [undefined];
}