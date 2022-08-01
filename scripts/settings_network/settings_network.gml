// Les actifs du script ont changé pour v2.3.0 Voir
// https://help.yoyogames.com/hc/en-us/articles/360005277377 pour plus d’informations
function CreateSNetwork(id) {


	id.SETTING_TITLE_FX = -100;

	// CREATE IMG_NETWORK_GUI_ETHERNET_TITLE
	var IMG_NETWORK_GUI_ETHERNET_TITLE = AddText(id.x - 100, id.y + 80, "Your current connection", Segoe8, #262626, id.WINDOW.LAYERS[0], id.TAG + "IMG_NETWORK_GUI_ETHERNET_TITLE", [undefined]);
	id.WINDOW.list_objects = addtolist(IMG_NETWORK_GUI_ETHERNET_TITLE, id.WINDOW.list_objects);
	id.SNETWORK_OBJECT = addtolist([IMG_NETWORK_GUI_ETHERNET_TITLE, -100, 80, 1], id.SNETWORK_OBJECT);

	// BACK_IMG_NETWORK_GUI_ETHERNET
	var BACK_IMG_NETWORK_GUI_ETHERNET = CreateEmptyRound(OSettingEmpty, id.x - 100, id.y + 100, #FBFCFE, 450, 70, id.WINDOW.LAYERS[0], id.TAG + "BACK_IMG_NETWORK_GUI_ETHERNET", [undefined]);
	id.WINDOW.list_objects = addtolist(BACK_IMG_NETWORK_GUI_ETHERNET, id.WINDOW.list_objects);
	id.SNETWORK_OBJECT = addtolist([BACK_IMG_NETWORK_GUI_ETHERNET, -100, 100, 1], id.SNETWORK_OBJECT);
	BACK_IMG_NETWORK_GUI_ETHERNET.AUTO_PLACE = false;

	// IMG_NETWORK_GUI_ETHERNET
	var IMG_NETWORK_GUI_ETHERNET = CreateObjectSprite(id.x, id.y, id.WINDOW.LAYERS[1], S_Settings_Network_Ethernet, OJustGUI, "IMAGE", id.TAG + "IMG_NETWORK_GUI_ETHERNET", [undefined]);
	id.WINDOW.list_objects = addtolist(IMG_NETWORK_GUI_ETHERNET, id.WINDOW.list_objects);
	id.SNETWORK_OBJECT = addtolist([IMG_NETWORK_GUI_ETHERNET, -90, 110, 1], id.SNETWORK_OBJECT);
	
	// BACK_NETWORK_SPEED
	var BACK_NETWORK_SPEED = CreateEmptyRound(OSettingEmpty, id.x - 30, id.y + 140, #E9E9E9, 370, 20, id.WINDOW.LAYERS[1], id.TAG + "BACK_NETWORK_SPEED", [undefined]);
	id.WINDOW.list_objects = addtolist(BACK_NETWORK_SPEED, id.WINDOW.list_objects);
	id.SNETWORK_OBJECT = addtolist([BACK_NETWORK_SPEED, -30, 140, 1], id.SNETWORK_OBJECT);
	BACK_NETWORK_SPEED.AUTO_PLACE = false;
		
	
	// BAR_CURRENT_NETWORK_SPEED
	var BAR_CURRENT_NETWORK_SPEED = CreateEmptyRound(OSettingEmpty, id.x - 30, id.y + 140, #0079FF, MathPercentOf2(0, global.GAME_VALUE[6][1], 370), 20, id.WINDOW.LAYERS[2], id.TAG + "BAR_CURRENT_NETWORK_SPEED", [undefined]);
	id.WINDOW.list_objects = addtolist(BAR_CURRENT_NETWORK_SPEED, id.WINDOW.list_objects);
	id.SNETWORK_OBJECT = addtolist([BAR_CURRENT_NETWORK_SPEED, -30, 140, 1], id.SNETWORK_OBJECT);
	BAR_CURRENT_NETWORK_SPEED.PARENT = id;
	BAR_CURRENT_NETWORK_SPEED.AUTO_PLACE = false;
	
	
	// CURRENT_SPEED_TEXT
	var CURRENT_SPEED_TEXT = string(global.GAME_VALUE[6][0]) + " Mb/s"; 
	var CURRENT_NETWORK_SPEED = AddText(id.x, id.y, CURRENT_SPEED_TEXT, Arial10, #FFFFFF, id.WINDOW.LAYERS[3], id.TAG + "CURRENT_NETWORK_SPEED", [undefined]);
	id.WINDOW.list_objects = addtolist(CURRENT_NETWORK_SPEED, id.WINDOW.list_objects);
	id.SNETWORK_OBJECT = addtolist([CURRENT_NETWORK_SPEED, Diff(id.x, BAR_CURRENT_NETWORK_SPEED.x + BAR_CURRENT_NETWORK_SPEED.SIZE_X - string_width(CURRENT_SPEED_TEXT) - 10), Diff(id.y, MidleStr((BAR_CURRENT_NETWORK_SPEED.y + 13), CURRENT_SPEED_TEXT)), 1], id.SNETWORK_OBJECT);	
	BAR_CURRENT_NETWORK_SPEED.OBJECT_LINKED = array_size( id.SNETWORK_OBJECT ) - 1;
	BAR_CURRENT_NETWORK_SPEED.TEXT_CONNECT = CURRENT_NETWORK_SPEED;
	
	// MAX_NETWORK_SPEED
	var MAX_SPEED_TEXT = string(global.GAME_VALUE[6][1]) + " Mb/s"; 
	var MAX_NETWORK_SPEED = AddText(id.x, id.y, MAX_SPEED_TEXT, Segoe10, #262626, id.WINDOW.LAYERS[1], id.TAG + "MAX_NETWORK_SPEED", [undefined]);
	id.WINDOW.list_objects = addtolist(MAX_NETWORK_SPEED, id.WINDOW.list_objects);
	id.SNETWORK_OBJECT = addtolist([MAX_NETWORK_SPEED, Diff(id.x, BACK_NETWORK_SPEED.x + BACK_NETWORK_SPEED.SIZE_X - string_width(MAX_SPEED_TEXT)), Diff(id.y, MidleStr((BACK_NETWORK_SPEED.y - 10), MAX_SPEED_TEXT)), 1], id.SNETWORK_OBJECT);
}

function UpdateSNetwork(id) {

	for (var i = 0; id.SNETWORK_OBJECT[i] != undefined; i++) {
		var get = id.SNETWORK_OBJECT[i][0];
		if (id.image_alpha < 1)
			get.ALPHA = id.image_alpha * id.SNETWORK_OBJECT[i][3];
		else
			get.ALPHA = id.SNETWORK_OBJECT[i][3];
		if (get.TYPE != "EMPT_BUTTON-NO-HAND") {
			if (id.SNETWORK_OBJECT[i][1] != undefined)
				get.x = id.x + id.SNETWORK_OBJECT[i][1];
			if (id.SNETWORK_OBJECT[i][2] != undefined)
				get.y = id.y + id.SNETWORK_OBJECT[i][2];
		}
		get.ON = id.WINDOW.ON;
	}
}

function DestroySNetwork(id) {

	// DELETE ALL
	for (var i = 0; id.SNETWORK_OBJECT[i] != undefined; i++) {
		var get = id.SNETWORK_OBJECT[i][0];

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
	id.SNETWORK_OBJECT = [undefined];
}
