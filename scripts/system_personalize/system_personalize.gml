// Les actifs du script ont changé pour v2.3.0 Voir
// https://help.yoyogames.com/hc/en-us/articles/360005277377 pour plus d’informations
function CreateSystemPersonalize(id) {

	// CREATE RETURN BUTTON
	var empt_text = GetEmptText(id.x - 100, id.y + 200, "BACK", Arial10, c_gray, c_white, id.WINDOW.LAYERS[1]);
	
	var PERSONALIZE_BACK = CreateEmptyButton(OSettingEmpty, id.x - 103, id.y + 200, 100, 30, #FBFCFE, #435D7A, id.WINDOW.LAYERS[0], undefined, empt_text, id.TAG + "SYSTEM_BACK", "EMPT_BUTTON-NO-HAND", [["CENTERED"], undefined]);
	PERSONALIZE_BACK.PARENT = id;
	PERSONALIZE_BACK.REF_X = -103;
	PERSONALIZE_BACK.REF_Y = 27;
	PERSONALIZE_BACK.EXT = true;
	PERSONALIZE_BACK.EXT_COLOR = #EAEEF1;
	id.WINDOW.list_objects = addtolist(PERSONALIZE_BACK, id.WINDOW.list_objects);
	id.SSSYSTEM_PERSONALIZE_OBJECT = addtolist([PERSONALIZE_BACK, 190, 130, 1], id.SSSYSTEM_PERSONALIZE_OBJECT);

}

function UpdateSystemPersonalize(id) {
	
	for (var i = 0; id.SSSYSTEM_PERSONALIZE_OBJECT[i] != undefined; i++) {
		var get = id.SSSYSTEM_PERSONALIZE_OBJECT[i][0];
		if (id.image_alpha < 1)
			get.ALPHA = id.image_alpha * id.SSSYSTEM_PERSONALIZE_OBJECT[i][3];
		else
			get.ALPHA = id.SSSYSTEM_PERSONALIZE_OBJECT[i][3];
		if (get.TYPE != "EMPT_BUTTON-NO-HAND") {
			get.x = id.x + id.SSSYSTEM_PERSONALIZE_OBJECT[i][1];
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
}