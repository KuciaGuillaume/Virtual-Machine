// Les actifs du script ont changé pour v2.3.0 Voir
// https://help.yoyogames.com/hc/en-us/articles/360005277377 pour plus d’informations
function CreateSUpdate(id) {


	id.SETTING_TITLE_FX = -100;
	id.SETTING_TITLE.TEXT = "";
	
	// BACK_TITLE_UPDATE
	var BACK_TITLE_UPDATE = CreateEmptyRound(OSettingEmpty, id.x, id.y , c_white, 450, 140, id.WINDOW.LAYERS[0], id.TAG + "BACK_TITLE_UPDATE", [undefined]);
	id.WINDOW.list_objects = addtolist(BACK_TITLE_UPDATE, id.WINDOW.list_objects);
	id.SUPDATE_OBJECT = addtolist([BACK_TITLE_UPDATE, -100, 20, 1], id.SUPDATE_OBJECT);
	
	// TITLE_TEXT_UPDATE
	var text = AutoLanguage("Patch notes");
	var TITLE_TEXT_UPDATE = AddText(id.x, id.y, text, Segoe15, #262626, id.WINDOW.LAYERS[1], id.TAG + "TITLE_TEXT_UPDATE", [["CENTERED"], undefined]);
	id.WINDOW.list_objects = addtolist(TITLE_TEXT_UPDATE, id.WINDOW.list_objects);
	var x_pos = (id.x - 100) + 225;
	if (x_pos < id.x)
		x_pos = -Diff(x_pos, id.x);
	else
		x_pos = Diff(x_pos, id.x);
	id.SUPDATE_OBJECT = addtolist([TITLE_TEXT_UPDATE, x_pos, 70, 1], id.SUPDATE_OBJECT);
	
	
	
	// UPDATE_BUTTON_MOVER
	var UPDATE_BUTTON_MOVER = CreateEmptyRound(OSettingEmpty, id.x, id.y , #C8DAE8, 150, 40, id.WINDOW.LAYERS[2], id.TAG + "UPDATE_BUTTON_MOVER", [undefined]);
	id.WINDOW.list_objects = addtolist(UPDATE_BUTTON_MOVER, id.WINDOW.list_objects);
	id.SUPDATE_OBJECT = addtolist([UPDATE_BUTTON_MOVER, -100, 120, 0.5], id.SUPDATE_OBJECT);
	
	// CREATE NEWS_UPDATE_BUTTON
	var empt_text = GetEmptText(id.x, id.y, AutoLanguage("News"), Segoe10, #262626, #262626, id.WINDOW.LAYERS[4]);
	
	var NEWS_UPDATE_BUTTON = CreateEmptyButton(OSettingEmpty, id.x, id.y, 150, 40, c_white, c_white, id.WINDOW.LAYERS[1], undefined, empt_text, id.TAG + "NEWS_UPDATE_BUTTON", "EMPT_BUTTON", [["CENTERED"], undefined]);
	NEWS_UPDATE_BUTTON.PARENT = id;
	NEWS_UPDATE_BUTTON.REF_X = -100;
	NEWS_UPDATE_BUTTON.REF_Y = 120;
	NEWS_UPDATE_BUTTON.OBJECT_LINKED = UPDATE_BUTTON_MOVER;
	NEWS_UPDATE_BUTTON.PARENT = id;
	id.WINDOW.list_objects = addtolist(NEWS_UPDATE_BUTTON, id.WINDOW.list_objects);
	id.SUPDATE_OBJECT = addtolist([NEWS_UPDATE_BUTTON, -100, 120, 1], id.SUPDATE_OBJECT);
	
	// CREATE PATCH_UPDATE_BUTTON
	var empt_text = GetEmptText(id.x, id.y, AutoLanguage("Patchs"), Segoe10, c_gray, #262626, id.WINDOW.LAYERS[4]);
	
	var PATCH_UPDATE_BUTTON = CreateEmptyButton(OSettingEmpty, id.x, id.y, 150, 40, c_white, c_white, id.WINDOW.LAYERS[1], undefined, empt_text, id.TAG + "PATCH_UPDATE_BUTTON", "EMPT_BUTTON", [["CENTERED"], undefined]);
	PATCH_UPDATE_BUTTON.PARENT = id;
	PATCH_UPDATE_BUTTON.REF_X = 50;
	PATCH_UPDATE_BUTTON.REF_Y = 120;
	PATCH_UPDATE_BUTTON.OBJECT_LINKED = UPDATE_BUTTON_MOVER;
	PATCH_UPDATE_BUTTON.PARENT = id;
	id.WINDOW.list_objects = addtolist(PATCH_UPDATE_BUTTON, id.WINDOW.list_objects);
	id.SUPDATE_OBJECT = addtolist([PATCH_UPDATE_BUTTON, 50, 120, 1], id.SUPDATE_OBJECT);
	
	// CREATE OTHERS_UPDATE_BUTTON
	var empt_text = GetEmptText(id.x, id.y, AutoLanguage("Others"), Segoe10, c_gray, #262626, id.WINDOW.LAYERS[4]);
	
	var OTHERS_UPDATE_BUTTON = CreateEmptyButton(OSettingEmpty, id.x, id.y, 150, 40, c_white, c_white, id.WINDOW.LAYERS[1], undefined, empt_text, id.TAG + "OTHERS_UPDATE_BUTTON", "EMPT_BUTTON", [["CENTERED"], undefined]);
	OTHERS_UPDATE_BUTTON.PARENT = id;
	OTHERS_UPDATE_BUTTON.REF_X = 200;
	OTHERS_UPDATE_BUTTON.REF_Y = 120;
	OTHERS_UPDATE_BUTTON.OBJECT_LINKED = UPDATE_BUTTON_MOVER;
	OTHERS_UPDATE_BUTTON.PARENT = id;
	id.WINDOW.list_objects = addtolist(OTHERS_UPDATE_BUTTON, id.WINDOW.list_objects);
	id.SUPDATE_OBJECT = addtolist([OTHERS_UPDATE_BUTTON, 200, 120, 1], id.SUPDATE_OBJECT);
	
	// CREATE ARTCILE NEWS
	var NEWS = CreateObjectSprite(id.x, id.y, id.WINDOW.LAYERS[0], News_Article_Update, OJustButtonSettings, "IMAGE", id.TAG + "UPDATE_NEWS_ARTICLE", [undefined]);
	id.WINDOW.list_objects = addtolist(NEWS, id.WINDOW.list_objects);
	id.SUPDATE_OBJECT = addtolist([NEWS, -100, 180, 1], id.SUPDATE_OBJECT);
	NEWS.SET_DISPLAY_LEFT = true;
	NEWS.IMAGE_TOP = 0;
	NEWS.IMAGE_HEIGHT = 370;
	NEWS.IMAGE_LEFT = 0;
	NEWS.IMAGE_WIDTH = 450;
	NEWS.PARENT = id;
	if (global.SETTINGS[7] == "ENGLISH")
		NEWS.image_index = 0;
	else if (global.SETTINGS[7] == "FRENCH")
		NEWS.image_index = 1;
		

	// CREATE OPEN_IN_DOCUMENT_VIEWER
	
	var X = 350;
	var Y = 560;
	var empt_text = GetEmptText(id.x + X, id.y + Y, AutoLanguage("Open in document viewer"), Arial10, c_gray, c_white, id.WINDOW.LAYERS[1]);
	
	var size = string_width(empt_text.TEXT) + 20;
	
	X -= size;
	empt_text.X -= size;
	var OPEN_IN_DOCUMENT_VIEWER = CreateEmptyButton(OSettingEmpty, id.x + X, id.y + Y, size, 25, #FBFCFE, #0079FF, id.WINDOW.LAYERS[0], undefined, empt_text, id.TAG + "OPEN_IN_DOCUMENT_VIEWER", "EMPT_BUTTON", [["CENTERED"], undefined]);
	OPEN_IN_DOCUMENT_VIEWER.PARENT = id;
	OPEN_IN_DOCUMENT_VIEWER.REF_X = X;
	OPEN_IN_DOCUMENT_VIEWER.REF_Y = Y;
	OPEN_IN_DOCUMENT_VIEWER.EXT = true;
	OPEN_IN_DOCUMENT_VIEWER.EXT_COLOR = #EAEEF1;
	id.WINDOW.list_objects = addtolist(OPEN_IN_DOCUMENT_VIEWER, id.WINDOW.list_objects);
	id.SUPDATE_OBJECT = addtolist([OPEN_IN_DOCUMENT_VIEWER, X, Y, 1], id.SUPDATE_OBJECT);
	
}

function UpdateSUpdate(id) {

	for (var i = 0; id.SUPDATE_OBJECT[i] != undefined; i++) {
		var get = id.SUPDATE_OBJECT[i][0];
		get.image_alpha = id.SUPDATE_OBJECT[i][3];
		if (get.object_index == OJustButtonSettings)
			get.ALPHA = id.SUPDATE_OBJECT[i][3];
		if (get.TYPE != "EMPT_BUTTON-NO-HAND" || get.TYPE == "EMPT_BUTTON") {
			if (id.SUPDATE_OBJECT[i][1] != undefined)
				get.x = id.x + id.SUPDATE_OBJECT[i][1];
			if (id.SUPDATE_OBJECT[i][2] != undefined)
				get.y = id.y + id.SUPDATE_OBJECT[i][2];
		}
		get.ON = id.WINDOW.ON;
	}
}

function DestroySUpdate(id) {

	// DELETE ALL
	for (var i = 0; id.SUPDATE_OBJECT[i] != undefined; i++) {
		var get = id.SUPDATE_OBJECT[i][0];

		if (!id.CLOSE)
			id.WINDOW.list_objects = remove_findlist(get, id.WINDOW.list_objects);
		if (get.TYPE == "EMPT_BUTTON-NO-HAND" || get.TYPE == "EMPT_BUTTON") {
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
	id.SUPDATE_OBJECT = [undefined];
}
