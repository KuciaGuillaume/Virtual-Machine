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
	
	// CREATE BRIGHTNESS BAR
	var bar_1 = CreateObjectSprite(id.x + 110, id.y + 122, id.WINDOW.LAYERS[1], S_Brightness_bar_1, OJustGUI, "IMAGE", id.TAG + "BRIGHTNESS_BAR_1", [undefined]);
	id.WINDOW.list_objects = addtolist(bar_1, id.WINDOW.list_objects);
	id.SSSYSTEM_DISPLAY_OBJECT = addtolist([bar_1, 110, 122, 1], id.SSSYSTEM_DISPLAY_OBJECT);
	
	// CREATE BRIGHTNESS SELECTOR
	var selector = CreateObjectSprite(id.x + 310, id.y + 127, id.WINDOW.LAYERS[3], S_Brightness_selector, OJustButtonSettings, "BUTTON", id.TAG + "BRIGHTNESS_SELECTOR", [undefined]);
	id.WINDOW.list_objects = addtolist(selector, id.WINDOW.list_objects);
	id.SSSYSTEM_DISPLAY_OBJECT = addtolist([selector, 310, 127, 1], id.SSSYSTEM_DISPLAY_OBJECT);
	selector.PARENT = id;
	
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
		if (get.TYPE == "IMAGE" || get.TYPE == "BUTTON")
			DestroyObject(get.TAG);
	}
	id.SSSYSTEM_DISPLAY_OBJECT = [undefined];
}