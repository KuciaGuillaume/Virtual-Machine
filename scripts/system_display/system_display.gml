// Les actifs du script ont changé pour v2.3.0 Voir
// https://help.yoyogames.com/hc/en-us/articles/360005277377 pour plus d’informations
function CreateSystemDisplay(id) {
	
	// CREATE RETURN BUTTON
	var empt_text = GetEmptText(id.x - 100, id.y + 200, "BACK", Arial10, c_gray, c_white, id.WINDOW.LAYERS[1]);
	
	var DISPLAY = CreateEmptyButton(OSettingEmpty, id.x - 100, id.y + 200, 100, 30, #FBFCFE, #435D7A, id.WINDOW.LAYERS[0], undefined, empt_text, id.TAG + "SYSTEM_BACK", "EMPT_BUTTON-NO-HAND", [["CENTERED"], undefined]);
	DISPLAY.PARENT = id;
	DISPLAY.REF_X = -100;
	DISPLAY.REF_Y = 27;
	DISPLAY.EXT = true;
	DISPLAY.EXT_COLOR = #EAEEF1;
	id.WINDOW.list_objects = addtolist(DISPLAY, id.WINDOW.list_objects);
	id.SSSYSTEM_DISPLAY_OBJECT = addtolist([DISPLAY, 190, 130, 1], id.SSSYSTEM_DISPLAY_OBJECT);
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