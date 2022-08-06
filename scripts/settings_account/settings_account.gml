// Les actifs du script ont changé pour v2.3.0 Voir
// https://help.yoyogames.com/hc/en-us/articles/360005277377 pour plus d’informations
function CreateSAccount(id) {


	id.SETTING_TITLE_FX = -100;
	
	
	// CREATE LOGO_CIRCLE_BACK
	var LOGO_CIRCLE_BACK = CreateEmptyCircle(id.x, id.y, 50, id.WINDOW.LAYERS[0], #E6E6E6, id.TAG + "LOGO_CIRCLE_BACK", [undefined]);
	id.WINDOW.list_objects = addtolist(LOGO_CIRCLE_BACK, id.WINDOW.list_objects);
	id.SACCOUNT_OBJECT = addtolist([LOGO_CIRCLE_BACK, -50, 120, 1], id.SACCOUNT_OBJECT);
	
	// CREATE INFORMATION_TEXT_ACCOUNT
	var text = AutoLanguage("Administrator");
	var full_text = global.USER[1] + " " + global.USER[2] + "\n" + global.USER[3] + "\n" + text;
	var TOP_INFORMATION_TEXT = AddText(id.x, id.y, full_text, Segoe10, #262626, id.WINDOW.LAYERS[0], id.TAG + "INFORMATION_TEXT_ACCOUNT", [undefined]);
	id.WINDOW.list_objects = addtolist(TOP_INFORMATION_TEXT, id.WINDOW.list_objects);
	id.SACCOUNT_OBJECT = addtolist([TOP_INFORMATION_TEXT, 20, Diff(id.y, MidleStr(id.y + 120, full_text)), 1], id.SACCOUNT_OBJECT);
	
	// CREATE LOGO OF ACOCUNT
	if (global.USER[6][0] == 0)
		var ACCOUNT_LOGO = CreateObjectSprite(x, y, id.WINDOW.LAYERS[1], Shomme, OJustGUI, "IMAGE", "ACCOUNT_LOGO" + TAG , [["INDEX_IMAGE", global.USER[6][1]], ["SLIDE", 0.0001], ["FADE_IN", 0.000005], undefined]);
	else
		var ACCOUNT_LOGO = CreateObjectSprite(x, y, id.WINDOW.LAYERS[1], Sfemme, OJustGUI, "IMAGE", "ACCOUNT_LOGO" + TAG, [["INDEX_IMAGE", global.USER[6][1]], ["SLIDE", 0.0001], ["FADE_IN", 0.000005], undefined]);
	id.WINDOW.list_objects = addtolist(ACCOUNT_LOGO, id.WINDOW.list_objects);
	id.SACCOUNT_OBJECT = addtolist([ACCOUNT_LOGO, -50, 120, 1], id.SACCOUNT_OBJECT);
	
	
	// CREATE ACCOUNT_EDIT_NAME_TITLE
	var ACCOUNT_EDIT_NAME_TITLE = AddText(id.x, id.y, AutoLanguage("Change your account information"), Segoe8, #262626, id.WINDOW.LAYERS[0], id.TAG + "ACCOUNT_EDIT_NAME_TITLE", [undefined]);
	id.WINDOW.list_objects = addtolist(ACCOUNT_EDIT_NAME_TITLE, id.WINDOW.list_objects);
	id.SACCOUNT_OBJECT = addtolist([ACCOUNT_EDIT_NAME_TITLE, -100, 195, 1], id.SACCOUNT_OBJECT);

	// BACK_ACCOUNT_EDIT_NAME
	var BACK_ACCOUNT_EDIT_NAME = CreateEmptyRound(OSettingEmpty, id.x - 100, id.y + 215, #FBFCFE, 450, 50, id.WINDOW.LAYERS[0], id.TAG + "BACK_ACCOUNT_EDIT_NAME", [undefined]);
	id.WINDOW.list_objects = addtolist(BACK_ACCOUNT_EDIT_NAME, id.WINDOW.list_objects);
	id.SACCOUNT_OBJECT = addtolist([BACK_ACCOUNT_EDIT_NAME, -100, 215, 1], id.SACCOUNT_OBJECT);
	
	// CREATE BUTTON_ACCOUNT_EDIT_NAME
	var BUTTON_ACCOUNT_EDIT_NAME = CreateTextButton(id.x, id.y, S_SAccount_Edit_password, global.USER[1] + " " + global.USER[2], id.WINDOW.LAYERS[1], id.WINDOW.LAYERS[2], c_gray, Arial10, 20, id.TAG + "BUTTON_ACCOUNT_EDIT_NAME", [undefined]);
	BUTTON_ACCOUNT_EDIT_NAME.write.BAR.image_index = 1;
	id.WINDOW.list_objects = addtolist(BUTTON_ACCOUNT_EDIT_NAME, id.WINDOW.list_objects);
	id.SACCOUNT_OBJECT = addtolist([BUTTON_ACCOUNT_EDIT_NAME, 10, 240, 1], id.SACCOUNT_OBJECT);

	// CREATE ACCOUNT_NAME_APPLY
	var empt_text = GetEmptText(id.x, id.y, AutoLanguage("Apply"), Segoe10, c_gray, #262626, id.WINDOW.LAYERS[2]);
	
	var ACCOUNT_NAME_APPLY = CreateEmptyButton(OSettingEmpty, id.x, id.y, 100, 30, #F8FAFF, #F8FAFF, id.WINDOW.LAYERS[1], undefined, empt_text, id.TAG + "ACCOUNT_NAME_APPLY", "EMPT_BUTTON", [["CENTERED"], undefined]);
	ACCOUNT_NAME_APPLY.PARENT = id;
	ACCOUNT_NAME_APPLY.REF_X = 240;
	ACCOUNT_NAME_APPLY.REF_Y = 225;
	ACCOUNT_NAME_APPLY.EXT = true;
	ACCOUNT_NAME_APPLY.EXT_COLOR = #EAEEF1;
	id.WINDOW.list_objects = addtolist(ACCOUNT_NAME_APPLY, id.WINDOW.list_objects);
	id.SACCOUNT_OBJECT = addtolist([ACCOUNT_NAME_APPLY, 240, 225, 1], id.SACCOUNT_OBJECT);
	ACCOUNT_NAME_APPLY.OBJECT_LINKED = BUTTON_ACCOUNT_EDIT_NAME;
	
	

	// BACK_ACCOUNT_EDIT_EMAIL
	var BACK_ACCOUNT_EDIT_EMAIL = CreateEmptyRound(OSettingEmpty, id.x - 100, id.y + 215, #FBFCFE, 450, 50, id.WINDOW.LAYERS[0], id.TAG + "BACK_ACCOUNT_EDIT_EMAIL", [undefined]);
	id.WINDOW.list_objects = addtolist(BACK_ACCOUNT_EDIT_EMAIL, id.WINDOW.list_objects);
	id.SACCOUNT_OBJECT = addtolist([BACK_ACCOUNT_EDIT_EMAIL, -100, 275, 1], id.SACCOUNT_OBJECT);
	
	// CREATE BUTTON_ACCOUNT_EDIT_EMAIL
	var BUTTON_ACCOUNT_EDIT_EMAIL = CreateTextButton(id.x, id.y, S_SAccount_Edit_password, global.USER[3], id.WINDOW.LAYERS[1], id.WINDOW.LAYERS[2], c_gray, Arial10, 30, id.TAG + "BUTTON_ACCOUNT_EDIT_EMAIL", [undefined]);
	BUTTON_ACCOUNT_EDIT_EMAIL.write.BAR.image_index = 1;
	id.WINDOW.list_objects = addtolist(BUTTON_ACCOUNT_EDIT_EMAIL, id.WINDOW.list_objects);
	id.SACCOUNT_OBJECT = addtolist([BUTTON_ACCOUNT_EDIT_EMAIL, 10, 300, 1], id.SACCOUNT_OBJECT);

	// CREATE ACCOUNT_EMAIL_APPLY
	var empt_text = GetEmptText(id.x, id.y, AutoLanguage("Apply"), Segoe10, c_gray, #262626, id.WINDOW.LAYERS[2]);
	
	var ACCOUNT_EMAIL_APPLY = CreateEmptyButton(OSettingEmpty, id.x, id.y, 100, 30, #F8FAFF, #F8FAFF, id.WINDOW.LAYERS[1], undefined, empt_text, id.TAG + "ACCOUNT_EMAIL_APPLY", "EMPT_BUTTON", [["CENTERED"], undefined]);
	ACCOUNT_EMAIL_APPLY.PARENT = id;
	ACCOUNT_EMAIL_APPLY.REF_X = 240;
	ACCOUNT_EMAIL_APPLY.REF_Y = 285;
	ACCOUNT_EMAIL_APPLY.EXT = true;
	ACCOUNT_EMAIL_APPLY.EXT_COLOR = #EAEEF1;
	id.WINDOW.list_objects = addtolist(ACCOUNT_EMAIL_APPLY, id.WINDOW.list_objects);
	id.SACCOUNT_OBJECT = addtolist([ACCOUNT_EMAIL_APPLY, 240, 285, 1], id.SACCOUNT_OBJECT);
	ACCOUNT_EMAIL_APPLY.OBJECT_LINKED = BUTTON_ACCOUNT_EDIT_EMAIL;
	
	

	// BACK_ACCOUNT_EDIT_PASSWORD
	var BACK_ACCOUNT_EDIT_PASSWORD = CreateEmptyRound(OSettingEmpty, id.x - 100, id.y, #FBFCFE, 450, 50, id.WINDOW.LAYERS[0], id.TAG + "BACK_ACCOUNT_EDIT_PASSWORD", [undefined]);
	id.WINDOW.list_objects = addtolist(BACK_ACCOUNT_EDIT_PASSWORD, id.WINDOW.list_objects);
	id.SACCOUNT_OBJECT = addtolist([BACK_ACCOUNT_EDIT_PASSWORD, -100, 335, 1], id.SACCOUNT_OBJECT);
	
	// CREATE TEXT BUTTON LEFT
	var ACCOUNT_EDIT_PASSWORD = CreateTextButton(id.x, id.y, S_SAccount_Edit_password, AutoLanguage("New password"), id.WINDOW.LAYERS[1], id.WINDOW.LAYERS[2], c_gray, Arial10, 20, id.TAG + "ACCOUNT_EDIT_PASSWORD", [["SECRET"], undefined]);
	ACCOUNT_EDIT_PASSWORD.write.BAR.image_index = 1;
	id.WINDOW.list_objects = addtolist(ACCOUNT_EDIT_PASSWORD, id.WINDOW.list_objects);
	id.SACCOUNT_OBJECT = addtolist([ACCOUNT_EDIT_PASSWORD, 10, 360, 1], id.SACCOUNT_OBJECT);
	
	// CREATE PASSWORD APPLY
	var empt_text = GetEmptText(id.x, id.y, AutoLanguage("Apply"), Segoe10, c_gray, #262626, id.WINDOW.LAYERS[2]);
	
	var ACCOUNT_EDIT_PASSWORD_APPLY = CreateEmptyButton(OSettingEmpty, id.x, id.y, 100, 30, #F8FAFF, #F8FAFF, id.WINDOW.LAYERS[1], undefined, empt_text, id.TAG + "ACCOUNT_EDIT_PASSWORD_APPLY", "EMPT_BUTTON", [["CENTERED"], undefined]);
	ACCOUNT_EDIT_PASSWORD_APPLY.PARENT = id;
	ACCOUNT_EDIT_PASSWORD_APPLY.REF_X = 240;
	ACCOUNT_EDIT_PASSWORD_APPLY.REF_Y = 345;
	ACCOUNT_EDIT_PASSWORD_APPLY.EXT = true;
	ACCOUNT_EDIT_PASSWORD_APPLY.EXT_COLOR = #EAEEF1;
	id.WINDOW.list_objects = addtolist(ACCOUNT_EDIT_PASSWORD_APPLY, id.WINDOW.list_objects);
	id.SACCOUNT_OBJECT = addtolist([ACCOUNT_EDIT_PASSWORD_APPLY, 240, 345, 1], id.SACCOUNT_OBJECT);
	ACCOUNT_EDIT_PASSWORD_APPLY.OBJECT_LINKED = ACCOUNT_EDIT_PASSWORD;
	
	// CREATE LANGUAGE_CHANGE
	var LANGUAGE_CHANGE = AddText(id.x, id.y, AutoLanguage("Choose your language"), Segoe8, #262626, id.WINDOW.LAYERS[0], id.TAG + "LANGUAGE_CHANGE", [undefined]);
	id.WINDOW.list_objects = addtolist(LANGUAGE_CHANGE, id.WINDOW.list_objects);
	id.SACCOUNT_OBJECT = addtolist([LANGUAGE_CHANGE, -100, 410, 1], id.SACCOUNT_OBJECT);
	
	// EDIT_LANGUAGE_CHANGE FRANCE
	var EDIT_LANGUAGE_CHANGE = CreateEmptyRound(OSettingEmpty, id.x, id.y, #FBFCFE, 450, 50, id.WINDOW.LAYERS[0], id.TAG + "EDIT_LANGUAGE_CHANGE_FRENCH", [undefined]);
	var EDIT_LANGUAGE_CHANGE_IMG = CreateObjectSprite(id.x, id.y, id.WINDOW.LAYERS[1], S_SAccount_France, OJustGUI, "IMAGE", id.TAG + "EDIT_LANGUAGE_CHANGE_FRENCH", [undefined]);
	var EDIT_LANGUAGE_CHANGE_TEXT = AddText(id.x, id.y, AutoLanguage("French"), Segoe10, #414141, id.WINDOW.LAYERS[1], id.TAG + "EDIT_LANGUAGE_CHANGE_FRENCH_TEXT", [undefined]);
	id.WINDOW.list_objects = addtolist(EDIT_LANGUAGE_CHANGE, id.WINDOW.list_objects);
	id.SACCOUNT_OBJECT = addtolist([EDIT_LANGUAGE_CHANGE, -100, 430, 1], id.SACCOUNT_OBJECT);
	id.WINDOW.list_objects = addtolist(EDIT_LANGUAGE_CHANGE_IMG, id.WINDOW.list_objects);
	id.SACCOUNT_OBJECT = addtolist([EDIT_LANGUAGE_CHANGE_IMG, -90, 440, 1], id.SACCOUNT_OBJECT);
	id.WINDOW.list_objects = addtolist(EDIT_LANGUAGE_CHANGE_TEXT, id.WINDOW.list_objects);
	id.SACCOUNT_OBJECT = addtolist([EDIT_LANGUAGE_CHANGE_TEXT, -50, MidleStr(455, AutoLanguage("French")), 1], id.SACCOUNT_OBJECT);
	EDIT_LANGUAGE_CHANGE.LANGUAGE = "FRENCH";
	EDIT_LANGUAGE_CHANGE.PARENT = id;
	EDIT_LANGUAGE_CHANGE.AUTO_PLACE = false;
	
	// EDIT_LANGUAGE_CHANGE ENGLISH
	var EDIT_LANGUAGE_CHANGE = CreateEmptyRound(OSettingEmpty, id.x, id.y, #FBFCFE, 450, 50, id.WINDOW.LAYERS[0], id.TAG + "EDIT_LANGUAGE_CHANGE_ENGLISH", [undefined]);
	var EDIT_LANGUAGE_CHANGE_IMG = CreateObjectSprite(id.x, id.y, id.WINDOW.LAYERS[1], S_SAccount_English, OJustGUI, "IMAGE", id.TAG + "EDIT_LANGUAGE_CHANGE_ENGLISH", [undefined]);
	var EDIT_LANGUAGE_CHANGE_TEXT = AddText(id.x, id.y, AutoLanguage("English"), Segoe10, #414141, id.WINDOW.LAYERS[1], id.TAG + "EDIT_LANGUAGE_CHANGE_FRENCH_TEXT", [undefined]);
	id.WINDOW.list_objects = addtolist(EDIT_LANGUAGE_CHANGE, id.WINDOW.list_objects);
	id.SACCOUNT_OBJECT = addtolist([EDIT_LANGUAGE_CHANGE, -100, 490, 1], id.SACCOUNT_OBJECT);
	id.WINDOW.list_objects = addtolist(EDIT_LANGUAGE_CHANGE_IMG, id.WINDOW.list_objects);
	id.SACCOUNT_OBJECT = addtolist([EDIT_LANGUAGE_CHANGE_IMG, -90, 500, 1], id.SACCOUNT_OBJECT);
	id.WINDOW.list_objects = addtolist(EDIT_LANGUAGE_CHANGE_TEXT, id.WINDOW.list_objects);
	id.SACCOUNT_OBJECT = addtolist([EDIT_LANGUAGE_CHANGE_TEXT, -50, MidleStr(515, AutoLanguage("English")), 1], id.SACCOUNT_OBJECT);
	EDIT_LANGUAGE_CHANGE.LANGUAGE = "ENGLISH";
	EDIT_LANGUAGE_CHANGE.PARENT = id;
	EDIT_LANGUAGE_CHANGE.AUTO_PLACE = false;
}

function UpdateSAccount(id) {

	for (var i = 0; id.SACCOUNT_OBJECT[i] != undefined; i++) {
		var get = id.SACCOUNT_OBJECT[i][0];
		get.image_alpha = id.SACCOUNT_OBJECT[i][3];
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
