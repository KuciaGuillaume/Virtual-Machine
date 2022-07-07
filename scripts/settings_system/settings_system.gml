// Les actifs du script ont changé pour v2.3.0 Voir
// https://help.yoyogames.com/hc/en-us/articles/360005277377 pour plus d’informations
function CreateSSystem(id) {
	
	
	// DESTROY BASE
	id.SETTING_TITLE_FX = -100;

	// DELETE EmptyButton
	var get = GetObject(id.TAG + "SYSTEM_BACK");
	if (get != undefined) {
		id.SSSYSTEM_DISPLAY_OBJECT = remove_findlist_index(get, id.SSSYSTEM_DISPLAY_OBJECT, 0);
		if (!id.CLOSE)
			id.WINDOW.list_objects = remove_findlist(get, id.WINDOW.list_objects);
		DestroyEmptyButton(get.TAG);
	}
	
	
	// ADD image
	var image = CreateObjectSprite(id.x - 100, id.y + 80, id.WINDOW.LAYERS[1], S_backgrounds, OJustGUI, "IMAGE", id.TAG + "SSSIMAGE", [undefined]);
	image.image_xscale = 0.064;
	image.image_yscale = 0.065;
	id.WINDOW.list_objects = addtolist(image, id.WINDOW.list_objects);
	id.SSYSTEM_OBJECT = addtolist([image, -100, 80, 1], id.SSYSTEM_OBJECT);
	
	// CREATE SCREEN
	var screen = CreateObjectSprite(id.x - 100, id.y + 70, id.WINDOW.LAYERS[0], S_SSystem_screen, OJustGUI, "IMAGE", id.TAG + "SSSCREEN", [undefined]);
	id.WINDOW.list_objects = addtolist(screen, id.WINDOW.list_objects);
	id.SSYSTEM_OBJECT = addtolist([screen, -100, 70, 1], id.SSYSTEM_OBJECT);
	
	// CREATE OTHER TITLE
	var subtitle = AddText(id.x + 190, id.y + 130, "      Welcome to system settings.\nCustomize your experience to the best!", Segoe10, c_black, id.WINDOW.LAYERS[0], id.TAG + "SSS_SUBTITLE_TEXT", [["CENTERED"], undefined]);
	id.WINDOW.list_objects = addtolist(subtitle, id.WINDOW.list_objects);
	id.SSYSTEM_OBJECT = addtolist([subtitle, 190, 130, 1], id.SSYSTEM_OBJECT);
	
	// CREATE DISPLAY BUTTON
	var empt_linked = GetEmptLinked(id.x - 290, id.y + 400, id.WINDOW.LAYERS[1], S_SSsystem_display, OJustGUI,  "IMAGE");
	var empt_text = GetEmptText(id.x - 100, id.y + 400, "DISPLAY\nMonitors, brightness, night light, display profile", Arial10, c_gray, c_white, id.WINDOW.LAYERS[1]);
	
	var DISPLAY = CreateEmptyButton(OSettingEmpty, id.x - 100, id.y + 400, 450, 50, #FBFCFE, #435D7A, id.WINDOW.LAYERS[0], empt_linked, empt_text, id.TAG + "SSDISPLAY", "EMPT_BUTTON-NO-HAND", [["BACK", 150], undefined]);
	DISPLAY.PARENT = id;
	DISPLAY.REF_X = -100;
	DISPLAY.REF_Y = 200;
	DISPLAY.EXT = true;
	DISPLAY.EXT_COLOR = #EAEEF1;
	id.WINDOW.list_objects = addtolist(DISPLAY, id.WINDOW.list_objects);
	id.SSYSTEM_OBJECT = addtolist([DISPLAY, 190, 130, 1], id.SSYSTEM_OBJECT);

	// CREATE SOUND BUTTON
	var empt_linked = GetEmptLinked(id.x - 290, id.y + 400, id.WINDOW.LAYERS[1], S_SSsystem_Sound, OJustGUI,  "IMAGE");
	var empt_text = GetEmptText(id.x - 100, id.y + 400, "SOUND\nVolume levels, output, input, sound devices", Arial10, c_gray, c_white, id.WINDOW.LAYERS[1]);
	
	var SOUND = CreateEmptyButton(OSettingEmpty, id.x - 100, id.y + 400, 450, 50, #FBFCFE, #435D7A, id.WINDOW.LAYERS[0], empt_linked, empt_text, id.TAG + "SSSOUND", "EMPT_BUTTON-NO-HAND", [["BACK", 150], undefined]);
	SOUND.PARENT = id;
	SOUND.REF_X = -100;
	SOUND.REF_Y = 260;
	SOUND.EXT = true;
	SOUND.EXT_COLOR = #EAEEF1;
	id.WINDOW.list_objects = addtolist(SOUND, id.WINDOW.list_objects);
	id.SSYSTEM_OBJECT = addtolist([SOUND, 190, 130, 1], id.SSYSTEM_OBJECT);

	// CREATE NOTIFICATIONS
	var empt_linked = GetEmptLinked(id.x - 290, id.y + 400, id.WINDOW.LAYERS[1], S_SSsystem_Notifications, OJustGUI,  "IMAGE");
	var empt_text = GetEmptText(id.x - 100, id.y + 400, "Notifications\nAlerts from apps and system", Arial10, c_gray, c_white, id.WINDOW.LAYERS[1]);
	
	var SOUND = CreateEmptyButton(OSettingEmpty, id.x - 100, id.y + 400, 450, 50, #FBFCFE, #435D7A, id.WINDOW.LAYERS[0], empt_linked, empt_text, id.TAG + "SSNOTIFICATIONS", "EMPT_BUTTON-NO-HAND", [["BACK", 150], undefined]);
	SOUND.PARENT = id;
	SOUND.REF_X = -100;
	SOUND.REF_Y = 320;
	SOUND.EXT = true;
	SOUND.EXT_COLOR = #EAEEF1;
	id.WINDOW.list_objects = addtolist(SOUND, id.WINDOW.list_objects);
	id.SSYSTEM_OBJECT = addtolist([SOUND, 190, 130, 1], id.SSYSTEM_OBJECT);

	// CREATE STOCKAGE
	var empt_linked = GetEmptLinked(id.x - 290, id.y + 400, id.WINDOW.LAYERS[1], S_SSsystem_Stockage, OJustGUI,  "IMAGE");
	var empt_text = GetEmptText(id.x - 100, id.y + 400, "STORAGE\nStorage space, drivers, configuration rules", Arial10, c_gray, c_white, id.WINDOW.LAYERS[1]);
	
	var SOUND = CreateEmptyButton(OSettingEmpty, id.x - 100, id.y + 400, 450, 50, #FBFCFE, #435D7A, id.WINDOW.LAYERS[0], empt_linked, empt_text, id.TAG + "SSSTOCKAGE", "EMPT_BUTTON-NO-HAND", [["BACK", 150], undefined]);
	SOUND.PARENT = id;
	SOUND.REF_X = -100;
	SOUND.REF_Y = 380;
	SOUND.EXT = true;
	SOUND.EXT_COLOR = #EAEEF1;
	id.WINDOW.list_objects = addtolist(SOUND, id.WINDOW.list_objects);
	id.SSYSTEM_OBJECT = addtolist([SOUND, 190, 130, 1], id.SSYSTEM_OBJECT);

	// CREATE INFOS
	var empt_linked = GetEmptLinked(id.x - 290, id.y + 400, id.WINDOW.LAYERS[1], S_SSsystem_infos, OJustGUI,  "IMAGE");
	var empt_text = GetEmptText(id.x - 100, id.y + 400, "ABOUT\nDevice specifications, rename PC", Arial10, c_gray, c_white, id.WINDOW.LAYERS[1]);
	
	var SOUND = CreateEmptyButton(OSettingEmpty, id.x - 100, id.y + 400, 450, 50, #FBFCFE, #435D7A, id.WINDOW.LAYERS[0], empt_linked, empt_text, id.TAG + "SSINFOS", "EMPT_BUTTON-NO-HAND", [["BACK", 150], undefined]);
	SOUND.PARENT = id;
	SOUND.REF_X = -100;
	SOUND.REF_Y = 440;
	SOUND.EXT = true;
	SOUND.EXT_COLOR = #EAEEF1;
	id.WINDOW.list_objects = addtolist(SOUND, id.WINDOW.list_objects);
	id.SSYSTEM_OBJECT = addtolist([SOUND, 190, 130, 1], id.SSYSTEM_OBJECT);
}

function DestroySSystem(id) {
	
	// DELETE IMAGE
	var image = GetObject(id.TAG + "SSSIMAGE");
	if (image != undefined) {
		id.SSYSTEM_OBJECT = remove_findlist_index(image, id.SSYSTEM_OBJECT, 0);
		if (!id.CLOSE)
			id.WINDOW.list_objects = remove_findlist(image, id.WINDOW.list_objects);
		DestroyObject(image.TAG);
	}

	// DELETE SCREEN
	var screen = GetObject(id.TAG + "SSSCREEN");
	if (screen != undefined) {
		id.SSYSTEM_OBJECT = remove_findlist_index(screen, id.SSYSTEM_OBJECT, 0);
		if (!id.CLOSE)
			id.WINDOW.list_objects = remove_findlist(screen, id.WINDOW.list_objects);
		DestroyObject(screen.TAG);
	}

	// DELETE TITLE
	var screen = GetText(id.TAG + "SSS_SUBTITLE_TEXT");
	if (screen != undefined) {
		id.SSYSTEM_OBJECT = remove_findlist_index(screen, id.SSYSTEM_OBJECT, 0);
		if (!id.CLOSE)
			id.WINDOW.list_objects = remove_findlist(screen, id.WINDOW.list_objects);
		DestroyText(screen.TAG);
	}


	// DELETE EmptyButton
	var screen = GetObject(id.TAG + "SSDISPLAY");
	if (screen != undefined) {
		id.SSYSTEM_OBJECT = remove_findlist_index(screen, id.SSYSTEM_OBJECT, 0);
		if (!id.CLOSE)
			id.WINDOW.list_objects = remove_findlist(screen, id.WINDOW.list_objects);
		DestroyEmptyButton(screen.TAG);
	}

	// DELETE EmptyButton SOUND
	var screen = GetObject(id.TAG + "SSSOUND");
	if (screen != undefined) {
		id.SSYSTEM_OBJECT = remove_findlist_index(screen, id.SSYSTEM_OBJECT, 0);
		if (!id.CLOSE)
			id.WINDOW.list_objects = remove_findlist(screen, id.WINDOW.list_objects);
		DestroyEmptyButton(screen.TAG);
	}

	// DELETE EmptyButton NOTIFICATIONS
	var screen = GetObject(id.TAG + "SSNOTIFICATIONS");
	if (screen != undefined) {
		id.SSYSTEM_OBJECT = remove_findlist_index(screen, id.SSYSTEM_OBJECT, 0);
		if (!id.CLOSE)
			id.WINDOW.list_objects = remove_findlist(screen, id.WINDOW.list_objects);
		DestroyEmptyButton(screen.TAG);
	}

	// DELETE EmptyButton STORAGE
	var screen = GetObject(id.TAG + "SSSTOCKAGE");
	if (screen != undefined) {
		id.SSYSTEM_OBJECT = remove_findlist_index(screen, id.SSYSTEM_OBJECT, 0);
		if (!id.CLOSE)
			id.WINDOW.list_objects = remove_findlist(screen, id.WINDOW.list_objects);
		DestroyEmptyButton(screen.TAG);
	}
	// DELETE EmptyButton ABOUT
	var screen = GetObject(id.TAG + "SSINFOS");
	if (screen != undefined) {
		id.SSYSTEM_OBJECT = remove_findlist_index(screen, id.SSYSTEM_OBJECT, 0);
		if (!id.CLOSE)
			id.WINDOW.list_objects = remove_findlist(screen, id.WINDOW.list_objects);
		DestroyEmptyButton(screen.TAG);
	}
}

function UpdateSSystem(id) {
	
	for (var i = 0; id.SSYSTEM_OBJECT[i] != undefined; i++) {
		var get = id.SSYSTEM_OBJECT[i][0];
		if (id.image_alpha < 1)
			get.ALPHA = id.image_alpha * id.SSYSTEM_OBJECT[i][3];
		else
			get.ALPHA = id.SSYSTEM_OBJECT[i][3];
		if (get.TYPE != "EMPT_BUTTON-NO-HAND") {
			get.x = id.x + id.SSYSTEM_OBJECT[i][1];
			get.y = id.y + id.SSYSTEM_OBJECT[i][2];
		}
		get.ON = id.WINDOW.ON;
	}
}