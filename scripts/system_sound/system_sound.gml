// Les actifs du script ont changé pour v2.3.0 Voir
// https://help.yoyogames.com/hc/en-us/articles/360005277377 pour plus d’informations
function CreateSystemSound(id) {

	// CREATE RETURN BUTTON
	var empt_text = GetEmptText(id.x - 100, id.y + 200, AutoLanguage("BACK"), Arial10, c_gray, c_white, id.WINDOW.LAYERS[1]);
	
	var SOUND_BACK = CreateEmptyButton(OSettingEmpty, id.x - 103, id.y + 200, 100, 30, #FBFCFE, #435D7A, id.WINDOW.LAYERS[0], undefined, empt_text, id.TAG + "SYSTEM_BACK", "EMPT_BUTTON-NO-HAND", [["CENTERED"], undefined]);
	SOUND_BACK.PARENT = id;
	SOUND_BACK.REF_X = -103;
	SOUND_BACK.REF_Y = 27;
	SOUND_BACK.EXT = true;
	SOUND_BACK.EXT_COLOR = #EAEEF1;
	id.WINDOW.list_objects = addtolist(SOUND_BACK, id.WINDOW.list_objects);
	id.SSSYSTEM_SOUND_OBJECT = addtolist([SOUND_BACK, 190, 130, 1], id.SSSYSTEM_SOUND_OBJECT);

	// CREATE GENERAL_TITLE
	var SOUND_GENERAL_TITLE = AddText(id.x - 100, id.y + 300, AutoLanguage("Sounds"), Segoe8, #262626, id.WINDOW.LAYERS[0], id.TAG + "SOUND_GENERAL_TITLE", [undefined]);
	id.WINDOW.list_objects = addtolist(SOUND_GENERAL_TITLE, id.WINDOW.list_objects);
	id.SSSYSTEM_SOUND_OBJECT = addtolist([SOUND_GENERAL_TITLE, -100, 80, 1], id.SSSYSTEM_SOUND_OBJECT);
	
	// CREATE GENRAL VOLUME
	var empt_linked = GetEmptLinked(id.x - 290, id.y + 200, id.WINDOW.LAYERS[1], S_SSsystem_General_sound, OJustGUI,  "IMAGE");
	var empt_text = GetEmptText(id.x - 100, id.y + 200, AutoLanguage("General volume"), Arial10, c_gray, c_gray, id.WINDOW.LAYERS[1]);
	
	var SOUND_GENERAL = CreateEmptyButton(OSettingEmpty, id.x - 100, id.y + 200, 450, 50, #FBFCFE, #F8FAFF, id.WINDOW.LAYERS[0], empt_linked, empt_text, id.TAG + "SOUND_GENERAL", "EMPT_BUTTON-NO-HAND", [["BACK", 150], undefined]);
	SOUND_GENERAL.PARENT = id;
	SOUND_GENERAL.REF_X = -100;
	SOUND_GENERAL.REF_Y = 100;
	SOUND_GENERAL.EXT = true;
	SOUND_GENERAL.EXT_COLOR = #EAEEF1;
	id.WINDOW.list_objects = addtolist(SOUND_GENERAL, id.WINDOW.list_objects);
	id.SSSYSTEM_SOUND_OBJECT = addtolist([SOUND_GENERAL, 190, 130, 1], id.SSSYSTEM_SOUND_OBJECT);
	
	// CREATE GENERAL SOUND BAR_1
	var bar_1 = CreateObjectSprite(id.x + 110, id.y + 122, id.WINDOW.LAYERS[1], S_Brightness_bar_1, OJustGUI, "IMAGE", id.TAG + "GENERAL_SOUND_BAR_1", [undefined]);
	id.WINDOW.list_objects = addtolist(bar_1, id.WINDOW.list_objects);
	id.SSSYSTEM_SOUND_OBJECT = addtolist([bar_1, 110, 122, 1], id.SSSYSTEM_SOUND_OBJECT);
	
	// CREATE GENERAL SOUND SELECTOR
	var selector = CreateObjectSprite(id.x + 110 + 200, id.y + 127, id.WINDOW.LAYERS[3], S_Brightness_selector, OJustButtonSettings, "BUTTON", id.TAG + "GENERAL_SOUND_SELECTOR", [undefined]);
	id.WINDOW.list_objects = addtolist(selector, id.WINDOW.list_objects);
	id.SSSYSTEM_SOUND_OBJECT = addtolist([selector, 110 + (global.SOUNDS[0] * 2), 127, 1], id.SSSYSTEM_SOUND_OBJECT);
	selector.PARENT = id;
	selector.OBJECT_LINKED = bar_1;

	// CREATE GENERAL SOUND BAR_2
	var bar_2 = CreateObjectSprite(id.x + 110, id.y + 122, id.WINDOW.LAYERS[2], S_Brightness_bar_2, OJustButtonSettings, "IMAGE", id.TAG + "GENERAL_SOUND_BAR_2", [undefined]);
	id.WINDOW.list_objects = addtolist(bar_2, id.WINDOW.list_objects);
	id.SSSYSTEM_SOUND_OBJECT = addtolist([bar_2, 110, 122, 1], id.SSSYSTEM_SOUND_OBJECT);
	bar_2.OBJECT_LINKED = selector;
	bar_2.PARENT = id;
	bar_2.SET_DISPLAY_LEFT = true;
	bar_2.IMAGE_HEIGHT = 10;
	bar_2.IMAGE_TOP = 0;
	bar_2.IMAGE_LEFT = 0;
	
	
	
	// CREATE NOTIFICATION VOLUME
	var empt_linked = GetEmptLinked(id.x - 290, id.y + 160, id.WINDOW.LAYERS[1], S_SSsystem_Notifications_sound, OJustGUI,  "IMAGE");
	var empt_text = GetEmptText(id.x - 100, id.y + 160, AutoLanguage("Notification volumes"), Arial10, c_gray, c_gray, id.WINDOW.LAYERS[1]);
	
	var SOUND_NOTIFICATIONS = CreateEmptyButton(OSettingEmpty, id.x - 100, id.y + 160, 450, 50, #FBFCFE, #F8FAFF, id.WINDOW.LAYERS[0], empt_linked, empt_text, id.TAG + "SOUND_NOTIFICATIONS", "EMPT_BUTTON-NO-HAND", [["BACK", 150], undefined]);
	SOUND_NOTIFICATIONS.PARENT = id;
	SOUND_NOTIFICATIONS.REF_X = -100;
	SOUND_NOTIFICATIONS.REF_Y = 160;
	SOUND_NOTIFICATIONS.EXT = true;
	SOUND_NOTIFICATIONS.EXT_COLOR = #EAEEF1;
	id.WINDOW.list_objects = addtolist(SOUND_NOTIFICATIONS, id.WINDOW.list_objects);
	id.SSSYSTEM_SOUND_OBJECT = addtolist([SOUND_NOTIFICATIONS, 190, 160, 1], id.SSSYSTEM_SOUND_OBJECT);

	// CREATE NOTIFICATION SOUND BAR_1
	var bar_1 = CreateObjectSprite(id.x + 110, id.y + 182, id.WINDOW.LAYERS[1], S_Brightness_bar_1, OJustGUI, "IMAGE", id.TAG + "NOTIFICATION_SOUND_BAR_1", [undefined]);
	id.WINDOW.list_objects = addtolist(bar_1, id.WINDOW.list_objects);
	id.SSSYSTEM_SOUND_OBJECT = addtolist([bar_1, 110, 182, 1], id.SSSYSTEM_SOUND_OBJECT);
	
	// CREATE NOTIFICATION SOUND SELECTOR
	var selector = CreateObjectSprite(id.x + 110 + 200, id.y + 187, id.WINDOW.LAYERS[3], S_Brightness_selector, OJustButtonSettings, "BUTTON", id.TAG + "NOTIFICATION_SOUND_SELECTOR", [undefined]);
	id.WINDOW.list_objects = addtolist(selector, id.WINDOW.list_objects);
	id.SSSYSTEM_SOUND_OBJECT = addtolist([selector, 110 + (global.SOUNDS[1] * 2), 187, 1], id.SSSYSTEM_SOUND_OBJECT);
	selector.PARENT = id;
	selector.OBJECT_LINKED = bar_1;

	// CREATE NOTIFICATION SOUND BAR_2
	var bar_2 = CreateObjectSprite(id.x + 110, id.y + 182, id.WINDOW.LAYERS[2], S_Brightness_bar_2, OJustButtonSettings, "IMAGE", id.TAG + "NOTIFICATION_SOUND_BAR_2", [undefined]);
	id.WINDOW.list_objects = addtolist(bar_2, id.WINDOW.list_objects);
	id.SSSYSTEM_SOUND_OBJECT = addtolist([bar_2, 110, 182, 1], id.SSSYSTEM_SOUND_OBJECT);
	bar_2.OBJECT_LINKED = selector;
	bar_2.PARENT = id;
	bar_2.SET_DISPLAY_LEFT = true;
	bar_2.IMAGE_HEIGHT = 10;
	bar_2.IMAGE_TOP = 0;
	bar_2.IMAGE_LEFT = 0;
}

function UpdateSystemSound(id) {
	
	for (var i = 0; id.SSSYSTEM_SOUND_OBJECT[i] != undefined; i++) {
		var get = id.SSSYSTEM_SOUND_OBJECT[i][0];
		if (id.image_alpha < 1)
			get.ALPHA = id.image_alpha * id.SSSYSTEM_SOUND_OBJECT[i][3];
		else
			get.ALPHA = id.SSSYSTEM_SOUND_OBJECT[i][3];
		if (get.TYPE != "EMPT_BUTTON-NO-HAND") {
			get.x = id.x + id.SSSYSTEM_SOUND_OBJECT[i][1];
			get.y = id.y + id.SSSYSTEM_SOUND_OBJECT[i][2];
		}
		get.ON = id.WINDOW.ON;
	}
}

function DestroySSystemSound(id) {
	
	// DELETE ALL
	for (var i = 0; id.SSSYSTEM_SOUND_OBJECT[i] != undefined; i++) {
		var get = id.SSSYSTEM_SOUND_OBJECT[i][0];
		
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
	id.SSSYSTEM_SOUND_OBJECT = [undefined];
}