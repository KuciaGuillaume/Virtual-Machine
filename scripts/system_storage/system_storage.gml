// Les actifs du script ont changé pour v2.3.0 Voir
// https://help.yoyogames.com/hc/en-us/articles/360005277377 pour plus d’informations
function CreateSystemStorage(id) {

	// CREATE RETURN BUTTON
	var empt_text = GetEmptText(id.x - 100, id.y + 200, "BACK", Arial10, c_gray, c_white, id.WINDOW.LAYERS[1]);
	
	var STORAGE_BACK = CreateEmptyButton(OSettingEmpty, id.x - 103, id.y + 200, 100, 30, #FBFCFE, #435D7A, id.WINDOW.LAYERS[0], undefined, empt_text, id.TAG + "SYSTEM_BACK", "EMPT_BUTTON-NO-HAND", [["CENTERED"], undefined]);
	STORAGE_BACK.PARENT = id;
	STORAGE_BACK.REF_X = -103;
	STORAGE_BACK.REF_Y = 27;
	STORAGE_BACK.EXT = true;
	STORAGE_BACK.EXT_COLOR = #EAEEF1;
	id.WINDOW.list_objects = addtolist(STORAGE_BACK, id.WINDOW.list_objects);
	id.SSSYSTEM_STORAGE_OBJECT = addtolist([STORAGE_BACK, 190, 130, 1], id.SSSYSTEM_STORAGE_OBJECT);
	
	// CREATE STORAGE_TITLE
	var STORAGE_TITLE = AddText(id.x - 100, id.y + 80, "This is your storage space", Segoe8, #262626, id.WINDOW.LAYERS[0], id.TAG + "STORAGE_TITLE", [undefined]);
	id.WINDOW.list_objects = addtolist(STORAGE_TITLE, id.WINDOW.list_objects);
	id.SSSYSTEM_STORAGE_OBJECT = addtolist([STORAGE_TITLE, -100, 80, 1], id.SSSYSTEM_STORAGE_OBJECT);

	var GUI_BACK_STORAGE = CreateEmptyRound(OEmptyRound, id.x - 100, id.y + 100, #FBFCFE, 450, 150, id.WINDOW.LAYERS[0], id.TAG + "STORAGE_BACK", [undefined]);
	id.WINDOW.list_objects = addtolist(GUI_BACK_STORAGE, id.WINDOW.list_objects);
	id.SSSYSTEM_STORAGE_OBJECT = addtolist([GUI_BACK_STORAGE, -100, 100, 1], id.SSSYSTEM_STORAGE_OBJECT);
	
	// CREATE STORAGE BACK
	var STORAGE_BACK_BAR_1 = CreateEmptyRound(OEmptyRound, id.x - 90, id.y + 215, #E9E9E9, 430, 25, id.WINDOW.LAYERS[1], id.TAG + "STORAGE_BACK_BAR_1", [undefined]);
	id.WINDOW.list_objects = addtolist(STORAGE_BACK_BAR_1, id.WINDOW.list_objects);
	id.SSSYSTEM_STORAGE_OBJECT = addtolist([STORAGE_BACK_BAR_1, -90, 215, 1], id.SSSYSTEM_STORAGE_OBJECT);
	
	// CREATE STORAGE USER
	var STORAGE_USE_BAR = CreateEmptyRound(OEmptyRound, id.x - 90, id.y + 215, #0079FF, MathPercentOf2(global.GAME_VALUE[1], global.GAME_VALUE[0], STORAGE_BACK_BAR_1.SIZE_X), 25, id.WINDOW.LAYERS[2], id.TAG + "STORAGE_USE_BAR", [undefined]);
	id.WINDOW.list_objects = addtolist(STORAGE_USE_BAR, id.WINDOW.list_objects);
	id.SSSYSTEM_STORAGE_OBJECT = addtolist([STORAGE_USE_BAR, -90, 215, 1], id.SSSYSTEM_STORAGE_OBJECT);
	
	// CREATE TEXT_ACTUAL_USE_STORAGE
	var TEXT_ACTUAL_USE_STORAGE = AddText(id.x, id.y, string(global.GAME_VALUE[1]) + " Gb used", Segoe10, #414141, id.WINDOW.LAYERS[1], id.TAG + "TEXT_ACTUAL_USE_STORAGE", [undefined]);
	id.WINDOW.list_objects = addtolist(TEXT_ACTUAL_USE_STORAGE, id.WINDOW.list_objects);
	id.SSSYSTEM_STORAGE_OBJECT = addtolist([TEXT_ACTUAL_USE_STORAGE, -Diff(STORAGE_USE_BAR.x, id.x), Diff(STORAGE_USE_BAR.y - 20, id.y), 1], id.SSSYSTEM_STORAGE_OBJECT);
	
	// CREATE TEXT_FREE_STORAGE
	var free_storage = string(global.GAME_VALUE[0] - global.GAME_VALUE[1]) + " Gb free";
	var TEXT_FREE_STORAGE = AddText(id.x, id.y, free_storage, Segoe10, #414141, id.WINDOW.LAYERS[1], id.TAG + "TEXT_FREE_STORAGE", [undefined]);
	id.WINDOW.list_objects = addtolist(TEXT_FREE_STORAGE, id.WINDOW.list_objects);
	id.SSSYSTEM_STORAGE_OBJECT = addtolist([TEXT_FREE_STORAGE, Diff((STORAGE_BACK_BAR_1.x + STORAGE_BACK_BAR_1.SIZE_X) - string_width(free_storage), id.x), Diff(STORAGE_USE_BAR.y - 20, id.y), 1], id.SSSYSTEM_STORAGE_OBJECT);
	
	// CREATE IMAGE HARD DISK
	var HARD_DISK_IMG = CreateObjectSprite(id.x, id.y, id.WINDOW.LAYERS[1], S_SSsystem_Stockage_Hard_Disk, OJustGUI, "IMAGE", id.TAG + "STORAGE_IMAGE_HARD_DISK", [undefined]);
	id.WINDOW.list_objects = addtolist(HARD_DISK_IMG, id.WINDOW.list_objects);
	id.SSSYSTEM_STORAGE_OBJECT = addtolist([HARD_DISK_IMG, -95, 110, 1], id.SSSYSTEM_STORAGE_OBJECT);
	
	// CREATE TEXT_HARD_DISK
	var text_hard_disk = "HDD (C:) - " + string(global.GAME_VALUE[0]) + " Gb";
	var TEXT_HARD_DISK = AddText(id.x, id.y, text_hard_disk, Segoe10, #414141, id.WINDOW.LAYERS[1], id.TAG + "TEXT_HARD_DISK", [undefined]);
	id.WINDOW.list_objects = addtolist(TEXT_HARD_DISK, id.WINDOW.list_objects);
	id.SSSYSTEM_STORAGE_OBJECT = addtolist([TEXT_HARD_DISK, -35, 135 - (string_height(text_hard_disk) / 2), 1], id.SSSYSTEM_STORAGE_OBJECT);

}

function UpdateSystemStorage(id) {

	for (var i = 0; id.SSSYSTEM_STORAGE_OBJECT[i] != undefined; i++) {
		var get = id.SSSYSTEM_STORAGE_OBJECT[i][0];
		if (id.image_alpha < 1)
			get.ALPHA = id.image_alpha * id.SSSYSTEM_STORAGE_OBJECT[i][3];
		else
			get.ALPHA = id.SSSYSTEM_STORAGE_OBJECT[i][3];
		if (get.TYPE != "EMPT_BUTTON-NO-HAND") {
			if (id.SSSYSTEM_STORAGE_OBJECT[i][1] != undefined)
				get.x = id.x + id.SSSYSTEM_STORAGE_OBJECT[i][1];
			if (id.SSSYSTEM_STORAGE_OBJECT[i][2] != undefined)
				get.y = id.y + id.SSSYSTEM_STORAGE_OBJECT[i][2];
		}
		get.ON = id.WINDOW.ON;
	}
}

function DestroySSystemStorage(id) {

	// DELETE ALL
	for (var i = 0; id.SSSYSTEM_STORAGE_OBJECT[i] != undefined; i++) {
		var get = id.SSSYSTEM_STORAGE_OBJECT[i][0];

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
	id.SSSYSTEM_STORAGE_OBJECT = [undefined];
}
