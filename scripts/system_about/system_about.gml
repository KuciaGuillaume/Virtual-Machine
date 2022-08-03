// Les actifs du script ont changé pour v2.3.0 Voir
// https://help.yoyogames.com/hc/en-us/articles/360005277377 pour plus d’informations
function CreateSystemAbout(id) {

	// CREATE RETURN BUTTON
	var empt_text = GetEmptText(id.x - 100, id.y + 200, AutoLanguage("BACK"), Arial10, c_gray, c_white, id.WINDOW.LAYERS[1]);
	
	var STORAGE_BACK = CreateEmptyButton(OSettingEmpty, id.x - 103, id.y + 200, 100, 30, #FBFCFE, #435D7A, id.WINDOW.LAYERS[0], undefined, empt_text, id.TAG + "SYSTEM_BACK", "EMPT_BUTTON-NO-HAND", [["CENTERED"], undefined]);
	STORAGE_BACK.PARENT = id;
	STORAGE_BACK.REF_X = -103;
	STORAGE_BACK.REF_Y = 27;
	STORAGE_BACK.EXT = true;
	STORAGE_BACK.EXT_COLOR = #EAEEF1;
	id.WINDOW.list_objects = addtolist(STORAGE_BACK, id.WINDOW.list_objects);
	id.SSSYSTEM_ABOUT_OBJECT = addtolist([STORAGE_BACK, 190, 130, 1], id.SSSYSTEM_ABOUT_OBJECT);
	
	
	
	// CREATE PROCESSOR_TITLE
	var PROCESSOR_TITLE = AddText(id.x - 100, id.y + 80, AutoLanguage("Processor"), Segoe8, #262626, id.WINDOW.LAYERS[0], id.TAG + "PROCESSOR_TITLE", [undefined]);
	id.WINDOW.list_objects = addtolist(PROCESSOR_TITLE, id.WINDOW.list_objects);
	id.SSSYSTEM_ABOUT_OBJECT = addtolist([PROCESSOR_TITLE, -100, 80, 1], id.SSSYSTEM_ABOUT_OBJECT);

	// BACK PROCESSOR
	var GUI_BACK_PROCESSOR = CreateEmptyRound(OEmptyRound, id.x - 100, id.y + 100, #FBFCFE, 450, 50, id.WINDOW.LAYERS[0], id.TAG + "GUI_BACK_PROCESSOR", [undefined]);
	id.WINDOW.list_objects = addtolist(GUI_BACK_PROCESSOR, id.WINDOW.list_objects);
	id.SSSYSTEM_ABOUT_OBJECT = addtolist([GUI_BACK_PROCESSOR, -100, 100, 1], id.SSSYSTEM_ABOUT_OBJECT);
	
	// IMG_PROCESSOR
	var IMG_PROCESSOR = CreateObjectSprite(id.x, id.y, id.WINDOW.LAYERS[1], S_SSsystem_About_Processor, OJustGUI, "IMAGE", id.TAG + "IMG_PROCESSOR", [undefined]);
	id.WINDOW.list_objects = addtolist(IMG_PROCESSOR, id.WINDOW.list_objects);
	id.SSSYSTEM_ABOUT_OBJECT = addtolist([IMG_PROCESSOR, -90, 110, 1], id.SSSYSTEM_ABOUT_OBJECT);

	// PROCESSOR_NAME
	var processor_name_txt = global.GAME_VALUE[2][0] + string(global.GAME_VALUE[2][1]) + " Ghz";
	var PROCESSOR_NAME = AddText(id.x, id.y, processor_name_txt, Segoe10, #414141, id.WINDOW.LAYERS[1], id.TAG + "PROCESSOR_NAME", [undefined]);
	id.WINDOW.list_objects = addtolist(PROCESSOR_NAME, id.WINDOW.list_objects);
	id.SSSYSTEM_ABOUT_OBJECT = addtolist([PROCESSOR_NAME, -50, MidleStr(125, processor_name_txt), 1], id.SSSYSTEM_ABOUT_OBJECT);
	
	
	// CREATE RAM_TITLE
	var RAM_TITLE = AddText(id.x, id.y, AutoLanguage("Installed Ram"), Segoe8, #262626, id.WINDOW.LAYERS[0], id.TAG + "RAM_TITLE", [undefined]);
	id.WINDOW.list_objects = addtolist(RAM_TITLE, id.WINDOW.list_objects);
	id.SSSYSTEM_ABOUT_OBJECT = addtolist([RAM_TITLE, -100, 160, 1], id.SSSYSTEM_ABOUT_OBJECT);

	// BACK RAM
	var GUI_BACK_RAM = CreateEmptyRound(OEmptyRound, id.x, id.y, #FBFCFE, 450, 50, id.WINDOW.LAYERS[0], id.TAG + "GUI_BACK_RAM", [undefined]);
	id.WINDOW.list_objects = addtolist(GUI_BACK_RAM, id.WINDOW.list_objects);
	id.SSSYSTEM_ABOUT_OBJECT = addtolist([GUI_BACK_RAM, -100, 180, 1], id.SSSYSTEM_ABOUT_OBJECT);
	
	// IMG_RAM
	var IMG_RAM = CreateObjectSprite(id.x, id.y, id.WINDOW.LAYERS[1], S_SSsystem_About_Ram, OJustGUI, "IMAGE", id.TAG + "IMG_RAM", [undefined]);
	id.WINDOW.list_objects = addtolist(IMG_RAM, id.WINDOW.list_objects);
	id.SSSYSTEM_ABOUT_OBJECT = addtolist([IMG_RAM, -90, 190, 1], id.SSSYSTEM_ABOUT_OBJECT);

	// RAM_NAME
	var ram_name_txt = string(global.GAME_VALUE[3]) + " " + AutoLanguage("GB") + "(" + string(global.GAME_VALUE[3] - MathPercentToValue( 2 , global.GAME_VALUE[3])) + " GB usable)" ;
	var RAM_NAME = AddText(id.x, id.y, ram_name_txt, Segoe10, #414141, id.WINDOW.LAYERS[1], id.TAG + "RAM_NAME", [undefined]);
	id.WINDOW.list_objects = addtolist(RAM_NAME, id.WINDOW.list_objects);
	id.SSSYSTEM_ABOUT_OBJECT = addtolist([RAM_NAME, -50, MidleStr(205, ram_name_txt), 1], id.SSSYSTEM_ABOUT_OBJECT);
	

	
	// CREATE GRAPHIC_CARD_TITLE
	var GRAPHIC_CARD_TITLE = AddText(id.x, id.y, AutoLanguage("Graphic card"), Segoe8, #262626, id.WINDOW.LAYERS[0], id.TAG + "GRAPHIC_CARD_TITLE", [undefined]);
	id.WINDOW.list_objects = addtolist(GRAPHIC_CARD_TITLE, id.WINDOW.list_objects);
	id.SSSYSTEM_ABOUT_OBJECT = addtolist([GRAPHIC_CARD_TITLE, -100, 240, 1], id.SSSYSTEM_ABOUT_OBJECT);

	// BACK RAM
	var GUI_BACK_GRAPHIC_CARD = CreateEmptyRound(OEmptyRound, id.x, id.y, #FBFCFE, 450, 50, id.WINDOW.LAYERS[0], id.TAG + "GUI_BACK_GRAPHIC_CARD", [undefined]);
	id.WINDOW.list_objects = addtolist(GUI_BACK_GRAPHIC_CARD, id.WINDOW.list_objects);
	id.SSSYSTEM_ABOUT_OBJECT = addtolist([GUI_BACK_GRAPHIC_CARD, -100, 260, 1], id.SSSYSTEM_ABOUT_OBJECT);
	
	// IMG_GRAPHIC_CARD
	var IMG_GRAPHIC_CARD = CreateObjectSprite(id.x, id.y, id.WINDOW.LAYERS[1], S_SSsystem_About_Graphic_card, OJustGUI, "IMAGE", id.TAG + "IMG_GRAPHIC_CARD", [undefined]);
	id.WINDOW.list_objects = addtolist(IMG_GRAPHIC_CARD, id.WINDOW.list_objects);
	id.SSSYSTEM_ABOUT_OBJECT = addtolist([IMG_GRAPHIC_CARD, -90, 270, 1], id.SSSYSTEM_ABOUT_OBJECT);

	// GRAPHIC_CARD_NAME
	var graphic_card_name_txt = global.GAME_VALUE[4][0] + " " + string(global.GAME_VALUE[4][1]) + " " + AutoLanguage("GB");
	var GRAPHIC_CARD_NAME = AddText(id.x, id.y, graphic_card_name_txt, Segoe10, #414141, id.WINDOW.LAYERS[1], id.TAG + "GRAPHIC_CARD_NAME", [undefined]);
	id.WINDOW.list_objects = addtolist(GRAPHIC_CARD_NAME, id.WINDOW.list_objects);
	id.SSSYSTEM_ABOUT_OBJECT = addtolist([GRAPHIC_CARD_NAME, -50, MidleStr(285, graphic_card_name_txt), 1], id.SSSYSTEM_ABOUT_OBJECT);
	

	// CREATE MOTHERBOARD_TITLE
	var MOTHERBOARD_TITLE = AddText(id.x, id.y, AutoLanguage("Motherboard"), Segoe8, #262626, id.WINDOW.LAYERS[0], id.TAG + "MOTHERBOARD_TITLE", [undefined]);
	id.WINDOW.list_objects = addtolist(MOTHERBOARD_TITLE, id.WINDOW.list_objects);
	id.SSSYSTEM_ABOUT_OBJECT = addtolist([MOTHERBOARD_TITLE, -100, 320, 1], id.SSSYSTEM_ABOUT_OBJECT);

	// BACK MOTHERBOARD
	var GUI_BACK_MOTHERBOARD = CreateEmptyRound(OEmptyRound, id.x, id.y, #FBFCFE, 450, 50, id.WINDOW.LAYERS[0], id.TAG + "GUI_BACK_MOTHERBOARD", [undefined]);
	id.WINDOW.list_objects = addtolist(GUI_BACK_MOTHERBOARD, id.WINDOW.list_objects);
	id.SSSYSTEM_ABOUT_OBJECT = addtolist([GUI_BACK_MOTHERBOARD, -100, 340, 1], id.SSSYSTEM_ABOUT_OBJECT);
	
	// IMG_GUI_BACK_MOTHERBOARD
	var IMG_GUI_BACK_MOTHERBOARD = CreateObjectSprite(id.x, id.y, id.WINDOW.LAYERS[1], S_SSsystem_About_Motherboard, OJustGUI, "IMAGE", id.TAG + "IMG_GUI_BACK_MOTHERBOARD", [undefined]);
	id.WINDOW.list_objects = addtolist(IMG_GUI_BACK_MOTHERBOARD, id.WINDOW.list_objects);
	id.SSSYSTEM_ABOUT_OBJECT = addtolist([IMG_GUI_BACK_MOTHERBOARD, -90, 350, 1], id.SSSYSTEM_ABOUT_OBJECT);

	// MOTHERBOARD_NAME
	var motherboard_name_txt = global.GAME_VALUE[5][0] + " (" + AutoLanguage("Maximum RAM capacity") + " : " + string(global.GAME_VALUE[5][1]) + " " +  AutoLanguage("GB") + ")";
	var MOTHERBOARD_NAME = AddText(id.x, id.y, motherboard_name_txt, Segoe10, #414141, id.WINDOW.LAYERS[1], id.TAG + "MOTHERBOARD_NAME", [undefined]);
	id.WINDOW.list_objects = addtolist(MOTHERBOARD_NAME, id.WINDOW.list_objects);
	id.SSSYSTEM_ABOUT_OBJECT = addtolist([MOTHERBOARD_NAME, -50, MidleStr(365, motherboard_name_txt), 1], id.SSSYSTEM_ABOUT_OBJECT);

}

function UpdateSystemAbout(id) {

	for (var i = 0; id.SSSYSTEM_ABOUT_OBJECT[i] != undefined; i++) {
		var get = id.SSSYSTEM_ABOUT_OBJECT[i][0];
		if (id.image_alpha < 1)
			get.ALPHA = id.image_alpha * id.SSSYSTEM_ABOUT_OBJECT[i][3];
		else
			get.ALPHA = id.SSSYSTEM_ABOUT_OBJECT[i][3];
		if (get.TYPE != "EMPT_BUTTON-NO-HAND") {
			if (id.SSSYSTEM_ABOUT_OBJECT[i][1] != undefined)
				get.x = id.x + id.SSSYSTEM_ABOUT_OBJECT[i][1];
			if (id.SSSYSTEM_ABOUT_OBJECT[i][2] != undefined)
				get.y = id.y + id.SSSYSTEM_ABOUT_OBJECT[i][2];
		}
		get.ON = id.WINDOW.ON;
	}
}

function DestroySSystemAbout(id) {

	// DELETE ALL
	for (var i = 0; id.SSSYSTEM_ABOUT_OBJECT[i] != undefined; i++) {
		var get = id.SSSYSTEM_ABOUT_OBJECT[i][0];

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
	id.SSSYSTEM_ABOUT_OBJECT = [undefined];
}
