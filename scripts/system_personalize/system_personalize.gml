// Les actifs du script ont changé pour v2.3.0 Voir
// https://help.yoyogames.com/hc/en-us/articles/360005277377 pour plus d’informations
function CreateSystemPersonalize(id) {

	// CREATE RETURN BUTTON
	var empt_text = GetEmptText(id.x - 100, id.y + 200, AutoLanguage("BACK"), Arial10, c_gray, c_white, id.WINDOW.LAYERS[1]);

	var PERSONALIZE_BACK = CreateEmptyButton(OSettingEmpty, id.x - 103, id.y + 200, 100, 30, #FBFCFE, #435D7A, id.WINDOW.LAYERS[0], undefined, empt_text, id.TAG + "SYSTEM_BACK", "EMPT_BUTTON-NO-HAND", [["CENTERED"], undefined]);
	PERSONALIZE_BACK.PARENT = id;
	PERSONALIZE_BACK.REF_X = -103;
	PERSONALIZE_BACK.REF_Y = 27;
	PERSONALIZE_BACK.EXT = true;
	PERSONALIZE_BACK.EXT_COLOR = #EAEEF1;
	id.WINDOW.list_objects = addtolist(PERSONALIZE_BACK, id.WINDOW.list_objects);
	id.SSSYSTEM_PERSONALIZE_OBJECT = addtolist([PERSONALIZE_BACK, 190, 130, 1], id.SSSYSTEM_PERSONALIZE_OBJECT);

	// CREATE CHANGE WALPPAPER TITLE
	var EDIT_WALLPAPER_TITLE = AddText(id.x - 100, id.y + 80, AutoLanguage("Change your wallpaper"), Segoe8, #262626, id.WINDOW.LAYERS[0], id.TAG + "EDIT_WALLPAPER_TITLE", [undefined]);
	id.WINDOW.list_objects = addtolist(EDIT_WALLPAPER_TITLE, id.WINDOW.list_objects);
	id.SSSYSTEM_PERSONALIZE_OBJECT = addtolist([EDIT_WALLPAPER_TITLE, -100, 80, 1], id.SSSYSTEM_PERSONALIZE_OBJECT);

	var GUI_BACK_WALLPAPER = CreateEmptyRound(OEmptyRound, id.x - 100, id.y + 100, #FBFCFE, 450, 150, id.WINDOW.LAYERS[0], id.TAG + "GUI_BACK_WALLPAPER", [undefined]);
	id.WINDOW.list_objects = addtolist(GUI_BACK_WALLPAPER, id.WINDOW.list_objects);
	id.SSSYSTEM_PERSONALIZE_OBJECT = addtolist([GUI_BACK_WALLPAPER, -100, 100, 1], id.SSSYSTEM_PERSONALIZE_OBJECT);

	// WALLPAPER WINDOWS
	var windows_wallpaper = CreateObjectSprite(id.x - 90, id.y + 110, id.WINDOW.LAYERS[1], S_backgrounds, OJustButtonSettings, "IMAGE", id.TAG + "EDIT_WINDOWS_WALLPAPER", [undefined]);
	id.WINDOW.list_objects = addtolist(windows_wallpaper, id.WINDOW.list_objects);
	id.SSSYSTEM_PERSONALIZE_OBJECT = addtolist([windows_wallpaper, -90, 110, 1], id.SSSYSTEM_PERSONALIZE_OBJECT);
	windows_wallpaper.image_xscale = 0.05;
	windows_wallpaper.image_yscale = 0.05;
	windows_wallpaper.PARENT = id;

	// WALLPAPER MAC
	var mac_wallpaper = CreateObjectSprite(id.x + 20, id.y + 110, id.WINDOW.LAYERS[1], S_backgrounds, OJustButtonSettings, "IMAGE", id.TAG + "EDIT_MAC_WALLPAPER", [undefined]);
	id.WINDOW.list_objects = addtolist(mac_wallpaper, id.WINDOW.list_objects);
	id.SSSYSTEM_PERSONALIZE_OBJECT = addtolist([mac_wallpaper, 20, 110, 1], id.SSSYSTEM_PERSONALIZE_OBJECT);
	mac_wallpaper.image_xscale = 0.05;
	mac_wallpaper.image_yscale = 0.05;
	mac_wallpaper.image_index = 1;
	mac_wallpaper.PARENT = id;

	// WALLPAPER WINST
	var winst_wallpaper = CreateObjectSprite(id.x + 130, id.y + 110, id.WINDOW.LAYERS[1], S_backgrounds, OJustButtonSettings, "IMAGE", id.TAG + "EDIT_WINST_WALLPAPER", [undefined]);
	id.WINDOW.list_objects = addtolist(winst_wallpaper, id.WINDOW.list_objects);
	id.SSSYSTEM_PERSONALIZE_OBJECT = addtolist([winst_wallpaper, 130, 110, 1], id.SSSYSTEM_PERSONALIZE_OBJECT);
	winst_wallpaper.image_xscale = 0.05;
	winst_wallpaper.image_yscale = 0.05;
	winst_wallpaper.image_index = 2;
	winst_wallpaper.PARENT = id;

	// WALLPAPER KALI
	var kali_wallpaper = CreateObjectSprite(id.x + 240, id.y + 110, id.WINDOW.LAYERS[1], S_backgrounds, OJustButtonSettings, "IMAGE", id.TAG + "EDIT_KALI_WALLPAPER", [undefined]);
	id.WINDOW.list_objects = addtolist(kali_wallpaper, id.WINDOW.list_objects);
	id.SSSYSTEM_PERSONALIZE_OBJECT = addtolist([kali_wallpaper, 240, 110, 1], id.SSSYSTEM_PERSONALIZE_OBJECT);
	kali_wallpaper.image_xscale = 0.05;
	kali_wallpaper.image_yscale = 0.05;
	kali_wallpaper.image_index = 3;
	kali_wallpaper.PARENT = id;

	// WALLPAPER UBUNTU
	var ubuntu_wallpaper = CreateObjectSprite(id.x -90, id.y + 180, id.WINDOW.LAYERS[1], S_backgrounds, OJustButtonSettings, "IMAGE", id.TAG + "EDIT_UBUNTU_WALLPAPER", [undefined]);
	id.WINDOW.list_objects = addtolist(ubuntu_wallpaper, id.WINDOW.list_objects);
	id.SSSYSTEM_PERSONALIZE_OBJECT = addtolist([ubuntu_wallpaper, -90, 180, 1], id.SSSYSTEM_PERSONALIZE_OBJECT);
	ubuntu_wallpaper.image_xscale = 0.05;
	ubuntu_wallpaper.image_yscale = 0.05;
	ubuntu_wallpaper.image_index = 4;
	ubuntu_wallpaper.PARENT = id;

	// CREATE SELECTOR INDICATOR

	id.PERSONALIZE_ALL_BACKGROUNDS = addtolist(windows_wallpaper, id.PERSONALIZE_ALL_BACKGROUNDS);
	id.PERSONALIZE_ALL_BACKGROUNDS = addtolist(mac_wallpaper, id.PERSONALIZE_ALL_BACKGROUNDS);
	id.PERSONALIZE_ALL_BACKGROUNDS = addtolist(winst_wallpaper, id.PERSONALIZE_ALL_BACKGROUNDS);
	id.PERSONALIZE_ALL_BACKGROUNDS = addtolist(kali_wallpaper, id.PERSONALIZE_ALL_BACKGROUNDS);
	id.PERSONALIZE_ALL_BACKGROUNDS = addtolist(ubuntu_wallpaper, id.PERSONALIZE_ALL_BACKGROUNDS);


	var target = id.PERSONALIZE_ALL_BACKGROUNDS[global.USER[7]];
	var index = FindListIndex(target,id.SSSYSTEM_PERSONALIZE_OBJECT, 0);
	var target_x = id.SSSYSTEM_PERSONALIZE_OBJECT[index][1];
	var target_y = id.SSSYSTEM_PERSONALIZE_OBJECT[index][2];
	var select_text = AddText(id.x, id.y, AutoLanguage("Currently"), Arial10, c_white, id.WINDOW.LAYERS[3], id.TAG + "WALLPAPER_SELECTOR_TEXT", [["CENTERED"], undefined]);
	var wallpaper_selector = CreateObjectSprite(id.x, id.y, id.WINDOW.LAYERS[2], S_SSsystem_Personalize_Select, OJustButtonSettings, "IMAGE", id.TAG + "WALLPAPER_SELECTOR", [["CENTERED"], undefined]);
	id.WINDOW.list_objects = addtolist(wallpaper_selector, id.WINDOW.list_objects);
	id.SSSYSTEM_PERSONALIZE_OBJECT = addtolist([wallpaper_selector, target_x, (target_y + 40), 1], id.SSSYSTEM_PERSONALIZE_OBJECT);
	id.WINDOW.list_objects = addtolist(select_text, id.WINDOW.list_objects);
	id.SSSYSTEM_PERSONALIZE_OBJECT = addtolist([select_text, target_x + 55, (target_y + 49), 1], id.SSSYSTEM_PERSONALIZE_OBJECT);
	wallpaper_selector.PARENT = id;
	wallpaper_selector.TEXT_CONNECT = select_text;


	// CREATE CHANGE CURSOR TITLE
	var EDIT_CURSOR_TITLE = AddText(id.x - 100, id.y + 270, AutoLanguage("Change your cursor"), Segoe8, #262626, id.WINDOW.LAYERS[0], id.TAG + "EDIT_CURSOR_TITLE", [undefined]);
	id.WINDOW.list_objects = addtolist(EDIT_CURSOR_TITLE, id.WINDOW.list_objects);
	id.SSSYSTEM_PERSONALIZE_OBJECT = addtolist([EDIT_CURSOR_TITLE, -100, 270, 1], id.SSSYSTEM_PERSONALIZE_OBJECT);

	var GUI_BACK_CURSOR = CreateEmptyRound(OEmptyRound, id.x - 100, id.y + 290, #FBFCFE, 450, 150, id.WINDOW.LAYERS[0], id.TAG + "GUI_BACK_CURSOR", [undefined]);
	id.WINDOW.list_objects = addtolist(GUI_BACK_CURSOR, id.WINDOW.list_objects);
	id.SSSYSTEM_PERSONALIZE_OBJECT = addtolist([GUI_BACK_CURSOR, -100, 290, 1], id.SSSYSTEM_PERSONALIZE_OBJECT);

	// CURSOR MAC
	var MAC_CURSOR = CreateObjectSprite(id.x - 90, id.y + 300, id.WINDOW.LAYERS[1], S_SSsystem_Personalize_cursor_mac, OJustButtonSettings, "IMAGE", id.TAG + "EDIT_MAC_CURSOR", [undefined]);
	id.WINDOW.list_objects = addtolist(MAC_CURSOR, id.WINDOW.list_objects);
	id.SSSYSTEM_PERSONALIZE_OBJECT = addtolist([MAC_CURSOR, -90, 300, 1], id.SSSYSTEM_PERSONALIZE_OBJECT);
	MAC_CURSOR.PARENT = id;
	MAC_CURSOR.ID_CURSOR = "MAC";
	MAC_CURSOR.CURSOR_IMAGE = Scursor;

	// CURSOR WIN11
	var WIN11_CURSOR = CreateObjectSprite(id.x + 20, id.y + 300, id.WINDOW.LAYERS[1], S_SSsystem_Personalize_cursor_Win11, OJustButtonSettings, "IMAGE", id.TAG + "EDIT_WIN11_CURSOR", [undefined]);
	id.WINDOW.list_objects = addtolist(WIN11_CURSOR, id.WINDOW.list_objects);
	id.SSSYSTEM_PERSONALIZE_OBJECT = addtolist([WIN11_CURSOR, 20, 300, 1], id.SSSYSTEM_PERSONALIZE_OBJECT);
	WIN11_CURSOR.PARENT = id;
	WIN11_CURSOR.ID_CURSOR = "WIN11";
	WIN11_CURSOR.CURSOR_IMAGE = S_Win11_cursor;

	// CURSOR WIN11_LIGHT
	var WIN11_LIGHT_CURSOR = CreateObjectSprite(id.x + 130, id.y + 300, id.WINDOW.LAYERS[1], S_SSsystem_Personalize_cursor_Win11_Light, OJustButtonSettings, "IMAGE", id.TAG + "EDIT_WIN11_LIGHT_CURSOR", [undefined]);
	id.WINDOW.list_objects = addtolist(WIN11_LIGHT_CURSOR, id.WINDOW.list_objects);
	id.SSSYSTEM_PERSONALIZE_OBJECT = addtolist([WIN11_LIGHT_CURSOR, 130, 300, 1], id.SSSYSTEM_PERSONALIZE_OBJECT);
	WIN11_LIGHT_CURSOR.PARENT = id;
	WIN11_LIGHT_CURSOR.ID_CURSOR = "WIN11_LIGHT";
	WIN11_LIGHT_CURSOR.CURSOR_IMAGE = S_Win11_light_cursor;
	
	id.PERSONALIZE_ALL_CURSOR = addtolist(MAC_CURSOR, id.PERSONALIZE_ALL_CURSOR);
	id.PERSONALIZE_ALL_CURSOR = addtolist(WIN11_CURSOR, id.PERSONALIZE_ALL_CURSOR);
	id.PERSONALIZE_ALL_CURSOR = addtolist(WIN11_LIGHT_CURSOR, id.PERSONALIZE_ALL_CURSOR);
	
	for (var i = 0; id.PERSONALIZE_ALL_CURSOR[i].ID_CURSOR != global.SETTINGS[6]; ) { i++; }
	
	var target = id.PERSONALIZE_ALL_CURSOR[i];
	var index = FindListIndex(target,id.SSSYSTEM_PERSONALIZE_OBJECT, 0);
	var target_x = id.SSSYSTEM_PERSONALIZE_OBJECT[index][1];
	var target_y = id.SSSYSTEM_PERSONALIZE_OBJECT[index][2];
	var select_text_cursor = AddText(id.x, id.y, AutoLanguage("Currently"), Arial10, c_white, id.WINDOW.LAYERS[3], id.TAG + "CURSOR_SELECTOR_TEXT", [["CENTERED"], undefined]);
	var cursor_selector = CreateObjectSprite(id.x, id.y, id.WINDOW.LAYERS[2], S_SSsystem_Personalize_Select, OJustButtonSettings, "IMAGE", id.TAG + "CURSOR_SELECTOR", [["CENTERED"], undefined]);
	id.WINDOW.list_objects = addtolist(cursor_selector, id.WINDOW.list_objects);
	id.SSSYSTEM_PERSONALIZE_OBJECT = addtolist([cursor_selector, target_x, (target_y + 40), 1], id.SSSYSTEM_PERSONALIZE_OBJECT);
	id.WINDOW.list_objects = addtolist(select_text_cursor, id.WINDOW.list_objects);
	id.SSSYSTEM_PERSONALIZE_OBJECT = addtolist([select_text_cursor, target_x + 55, (target_y + 49), 1], id.SSSYSTEM_PERSONALIZE_OBJECT);
	cursor_selector.PARENT = id;
	cursor_selector.TEXT_CONNECT = select_text_cursor;



}

function UpdateSystemPersonalize(id) {

	for (var i = 0; id.SSSYSTEM_PERSONALIZE_OBJECT[i] != undefined; i++) {
		var get = id.SSSYSTEM_PERSONALIZE_OBJECT[i][0];
		if (id.image_alpha < 1)
			get.ALPHA = id.image_alpha * id.SSSYSTEM_PERSONALIZE_OBJECT[i][3];
		else
			get.ALPHA = id.SSSYSTEM_PERSONALIZE_OBJECT[i][3];
		if (get.TYPE != "EMPT_BUTTON-NO-HAND") {
			if (id.SSSYSTEM_PERSONALIZE_OBJECT[i][1] != undefined)
				get.x = id.x + id.SSSYSTEM_PERSONALIZE_OBJECT[i][1];
			if (id.SSSYSTEM_PERSONALIZE_OBJECT[i][2] != undefined)
				get.y = id.y + id.SSSYSTEM_PERSONALIZE_OBJECT[i][2];
		}
		get.ON = id.WINDOW.ON;
	}
}

function DestroySSystemPersonalize(id) {

	// DELETE ALL
	for (var i = 0; id.SSSYSTEM_PERSONALIZE_OBJECT[i] != undefined; i++) {
		var get = id.SSSYSTEM_PERSONALIZE_OBJECT[i][0];

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
	id.SSSYSTEM_PERSONALIZE_OBJECT = [undefined];
	id.PERSONALIZE_ALL_BACKGROUNDS = [undefined];
	id.PERSONALIZE_ALL_CURSOR = [undefined];
}
