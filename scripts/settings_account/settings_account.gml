// Les actifs du script ont changé pour v2.3.0 Voir
// https://help.yoyogames.com/hc/en-us/articles/360005277377 pour plus d’informations
function CreateSAccount(id) {


	id.SETTING_TITLE_FX = -100;
	
	// CREATE ACCOUNT_EDIT_PASSWORD_TITLE
	var ACCOUNT_EDIT_PASSWORD_TITLE = AddText(id.x - 100, id.y + 80, "Change your passwords", Segoe8, #262626, id.WINDOW.LAYERS[0], id.TAG + "ACCOUNT_EDIT_PASSWORD_TITLE", [undefined]);
	id.WINDOW.list_objects = addtolist(ACCOUNT_EDIT_PASSWORD_TITLE, id.WINDOW.list_objects);
	id.SACCOUNT_OBJECT = addtolist([ACCOUNT_EDIT_PASSWORD_TITLE, -100, 80, 1], id.SACCOUNT_OBJECT);

	// BACK_ACCOUNT_EDIT_PASSWORD
	var BACK_ACCOUNT_EDIT_PASSWORD = CreateEmptyRound(OSettingEmpty, id.x - 100, id.y + 100, #FBFCFE, 450, 50, id.WINDOW.LAYERS[0], id.TAG + "BACK_ACCOUNT_EDIT_PASSWORD", [undefined]);
	id.WINDOW.list_objects = addtolist(BACK_ACCOUNT_EDIT_PASSWORD, id.WINDOW.list_objects);
	id.SACCOUNT_OBJECT = addtolist([BACK_ACCOUNT_EDIT_PASSWORD, -100, 100, 1], id.SACCOUNT_OBJECT);
	
	// CREATE TEXT BUTTON LEFT

	var ACCOUNT_EDIT_PASSWORD = CreateTextButton(id.x, id.y, S_SAccount_Edit_password, "New password", id.WINDOW.LAYERS[1], id.WINDOW.LAYERS[2], c_gray, Arial10, 20, id.TAG + "ACCOUNT_EDIT_PASSWORD", [["CENTERED"], ["SECRET"], undefined]);
	ACCOUNT_EDIT_PASSWORD.write.BAR.image_index = 1;
	id.WINDOW.list_objects = addtolist(ACCOUNT_EDIT_PASSWORD, id.WINDOW.list_objects);
	id.SACCOUNT_OBJECT = addtolist([ACCOUNT_EDIT_PASSWORD, 10, 125, 1], id.SACCOUNT_OBJECT);
	
	// CREATE PASSWORD APPLY
	var empt_text = GetEmptText(id.x, id.y, AutoLanguage("Apply"), Segoe10, c_gray, #262626, id.WINDOW.LAYERS[2]);
	
	var ACCOUNT_EDIT_PASSWORD_APPLY = CreateEmptyButton(OSettingEmpty, id.x, id.y, 100, 30, #F8FAFF, #F8FAFF, id.WINDOW.LAYERS[1], undefined, empt_text, id.TAG + "ACCOUNT_EDIT_PASSWORD_APPLY", "EMPT_BUTTON", [["CENTERED"], undefined]);
	ACCOUNT_EDIT_PASSWORD_APPLY.PARENT = id;
	ACCOUNT_EDIT_PASSWORD_APPLY.REF_X = 240;
	ACCOUNT_EDIT_PASSWORD_APPLY.REF_Y = 110;
	ACCOUNT_EDIT_PASSWORD_APPLY.EXT = true;
	ACCOUNT_EDIT_PASSWORD_APPLY.EXT_COLOR = #EAEEF1;
	id.WINDOW.list_objects = addtolist(ACCOUNT_EDIT_PASSWORD_APPLY, id.WINDOW.list_objects);
	id.SACCOUNT_OBJECT = addtolist([ACCOUNT_EDIT_PASSWORD_APPLY, 240, 110, 1], id.SACCOUNT_OBJECT);
	ACCOUNT_EDIT_PASSWORD_APPLY.OBJECT_LINKED = ACCOUNT_EDIT_PASSWORD;
	
	// CREATE LANGUAGE_CHANGE
	var LANGUAGE_CHANGE = AddText(id.x, id.y, "Choose your language", Segoe8, #262626, id.WINDOW.LAYERS[0], id.TAG + "LANGUAGE_CHANGE", [undefined]);
	id.WINDOW.list_objects = addtolist(LANGUAGE_CHANGE, id.WINDOW.list_objects);
	id.SACCOUNT_OBJECT = addtolist([LANGUAGE_CHANGE, -100, 180, 1], id.SACCOUNT_OBJECT);
	
	// EDIT_LANGUAGE_CHANGE FRANCE
	var EDIT_LANGUAGE_CHANGE = CreateEmptyRound(OSettingEmpty, id.x, id.y, #FBFCFE, 450, 50, id.WINDOW.LAYERS[0], id.TAG + "EDIT_LANGUAGE_CHANGE_FRENCH", [undefined]);
	var EDIT_LANGUAGE_CHANGE_IMG = CreateObjectSprite(id.x, id.y, id.WINDOW.LAYERS[1], S_SAccount_France, OJustGUI, "IMAGE", id.TAG + "EDIT_LANGUAGE_CHANGE_FRENCH", [undefined]);
	var EDIT_LANGUAGE_CHANGE_TEXT = AddText(id.x, id.y, "French", Segoe10, #414141, id.WINDOW.LAYERS[1], id.TAG + "EDIT_LANGUAGE_CHANGE_FRENCH_TEXT", [undefined]);
	id.WINDOW.list_objects = addtolist(EDIT_LANGUAGE_CHANGE, id.WINDOW.list_objects);
	id.SACCOUNT_OBJECT = addtolist([EDIT_LANGUAGE_CHANGE, -100, 200, 1], id.SACCOUNT_OBJECT);
	id.WINDOW.list_objects = addtolist(EDIT_LANGUAGE_CHANGE_IMG, id.WINDOW.list_objects);
	id.SACCOUNT_OBJECT = addtolist([EDIT_LANGUAGE_CHANGE_IMG, -90, 210, 1], id.SACCOUNT_OBJECT);
	id.WINDOW.list_objects = addtolist(EDIT_LANGUAGE_CHANGE_TEXT, id.WINDOW.list_objects);
	id.SACCOUNT_OBJECT = addtolist([EDIT_LANGUAGE_CHANGE_TEXT, -50, MidleStr(225, "French"), 1], id.SACCOUNT_OBJECT);
	EDIT_LANGUAGE_CHANGE.LANGUAGE = "FRENCH";
	EDIT_LANGUAGE_CHANGE.PARENT = id;
	EDIT_LANGUAGE_CHANGE.AUTO_PLACE = false;
	
	// EDIT_LANGUAGE_CHANGE ENGLISH
	var EDIT_LANGUAGE_CHANGE = CreateEmptyRound(OSettingEmpty, id.x, id.y, #FBFCFE, 450, 50, id.WINDOW.LAYERS[0], id.TAG + "EDIT_LANGUAGE_CHANGE_ENGLISH", [undefined]);
	var EDIT_LANGUAGE_CHANGE_IMG = CreateObjectSprite(id.x, id.y, id.WINDOW.LAYERS[1], S_SAccount_English, OJustGUI, "IMAGE", id.TAG + "EDIT_LANGUAGE_CHANGE_ENGLISH", [undefined]);
	var EDIT_LANGUAGE_CHANGE_TEXT = AddText(id.x, id.y, "English", Segoe10, #414141, id.WINDOW.LAYERS[1], id.TAG + "EDIT_LANGUAGE_CHANGE_FRENCH_TEXT", [undefined]);
	id.WINDOW.list_objects = addtolist(EDIT_LANGUAGE_CHANGE, id.WINDOW.list_objects);
	id.SACCOUNT_OBJECT = addtolist([EDIT_LANGUAGE_CHANGE, -100, 260, 1], id.SACCOUNT_OBJECT);
	id.WINDOW.list_objects = addtolist(EDIT_LANGUAGE_CHANGE_IMG, id.WINDOW.list_objects);
	id.SACCOUNT_OBJECT = addtolist([EDIT_LANGUAGE_CHANGE_IMG, -90, 270, 1], id.SACCOUNT_OBJECT);
	id.WINDOW.list_objects = addtolist(EDIT_LANGUAGE_CHANGE_TEXT, id.WINDOW.list_objects);
	id.SACCOUNT_OBJECT = addtolist([EDIT_LANGUAGE_CHANGE_TEXT, -50, MidleStr(285, "English"), 1], id.SACCOUNT_OBJECT);
	EDIT_LANGUAGE_CHANGE.LANGUAGE = "ENGLISH";
	EDIT_LANGUAGE_CHANGE.PARENT = id;
	EDIT_LANGUAGE_CHANGE.AUTO_PLACE = false;
}

function UpdateSAccount(id) {

	for (var i = 0; id.SACCOUNT_OBJECT[i] != undefined; i++) {
		var get = id.SACCOUNT_OBJECT[i][0];
		if (id.image_alpha < 1)
			get.ALPHA = id.image_alpha * id.SACCOUNT_OBJECT[i][3];
		else
			get.ALPHA = id.SACCOUNT_OBJECT[i][3];
		if (get.TYPE != "EMPT_BUTTON-NO-HAND" || get.TYPE == "EMPT_BUTTON") {
			if (id.SACCOUNT_OBJECT[i][1] != undefined)
				get.x = id.x + id.SACCOUNT_OBJECT[i][1];
			if (id.SACCOUNT_OBJECT[i][2] != undefined)
				get.y = id.y + id.SACCOUNT_OBJECT[i][2];
		}
		get.ON = id.WINDOW.ON;
	}
}

function DestroySAccount(id) {

	// DELETE ALL
	for (var i = 0; id.SACCOUNT_OBJECT[i] != undefined; i++) {
		var get = id.SACCOUNT_OBJECT[i][0];

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
	id.SACCOUNT_OBJECT = [undefined];
}
