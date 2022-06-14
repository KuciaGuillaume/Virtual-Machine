/// @Project by Kucia Guillaume* ///

if (TAG == undefined)
	return;

if (!FIRST_PASS && !FADE_IN) {image_alpha = 2; FIRST_PASS = true; } 

// FADE_IN

if (FADE_IN && image_alpha < 1)
	image_alpha += FADE_POWER * delta_time;
else
	FADE_IN = false;

if (CLOSE && string_count("FILE_EXPLORER", WINDOW_TAG)) {
	
	for (var i = 0; FOLDER_LIST[i] != undefined; i++) {
		DestroyText(FOLDER_LIST[i].TEXT_CONNECT.TAG);
		DestroyText(FOLDER_LIST[i].DOCK_TYPE_TEXT.TAG);
		DestroyObject(FOLDER_LIST[i].OBJECT_LINKED.TAG);
		DestroyWrite(FOLDER_LIST[i].WRITE.TAG);
		DestroyObject(FOLDER_LIST[i].TAG);
	}
	if (EXPLORER_RELOAD.REFRESH)
		DestroyObject(EXPLORER_RELOAD.REFRESH_LOAD.TAG);
	if (EMPTY_FOLDER != undefined)
		DestroyText(EMPTY_FOLDER.TAG);
	DestroyText(ELEMENTS.TAG);
	DestroyObject(GO_ROOT.TAG);
	DestroyObject(GO_BACK.TAG);
	DestroyObject(EXPLORER_RELOAD.TAG);
	DestroyButtonBox(LEFT_NEW_SLIDER.TAG);
	DestroyButtonBox(PATH_COMPUTER.TAG);
	DestroyButtonBox(PATH_DESK.TAG);
	DestroyButtonBox(PATH_DOWNLOAD.TAG);
	DestroyTextButton(SEARCH.TAG);
	if (RETURNED_TO_TOP != undefined)
		DestroyButtonBox(RETURNED_TO_TOP.TAG);
	if (FIND_OPTION_ROOT != undefined)
		DestroyButtonBox(FIND_OPTION_ROOT.TAG);
	DestroyText(PATH.TAG);
	DestroyObject(TAG);
}

if ((WINDOW != undefined && instance_exists(WINDOW)) && !CLOSE && string_count("FILE_EXPLORER", WINDOW.TAG) ) {
	
	if (CREATE) {
		if (SEARCH != undefined) {
			SEARCH.ON = WINDOW.ON;
			if (EXPLORER_SLIDER == undefined || !instance_exists(EXPLORER_SLIDER))
				EXPLORER_RELOAD.ON = WINDOW.ON;
			else
				EXPLORER_RELOAD.ON = false;
			if (!WINDOW.ON) SEARCH.write.ON_WRITE = false;
		}

		// UPDTAE SEARCH
		if (SEARCH != undefined) {
			if (!SEARCH.write.ON_WRITE) {
				if (FIND_OPTION_ROOT != undefined) {
					WINDOW.list_objects = remove_findlist(FIND_OPTION_ROOT, WINDOW.list_objects);
					WINDOW.list_objects = remove_findlist(FIND_OPTION_FOLDER, WINDOW.list_objects);
					DestroyButtonBox(FIND_OPTION_ROOT.TAG);
					DestroyButtonBox(FIND_OPTION_FOLDER.TAG);
					FIND_OPTION_ROOT = undefined;
					FIND_OPTION_FOLDER = undefined;
				}
				if (!WINDOW.REDUCING) {
					SEARCH.image_alpha = image_alpha; SEARCH.x = x - 259; SEARCH.y = y + 46;
				} else {
					SEARCH.image_alpha = 0; SEARCH.x = x - 259; SEARCH.y = y + 46; }
			}
		}

		// UPDTAE PATH
		if (PATH != undefined) {
			PATH.image_alpha = image_alpha; PATH.x = x + 110; PATH.y = y + 47;
			PATH.TEXT = PWD_PATH;
		}
		
		// UPDATE EXPLORER RELOAD
		if (EXPLORER_RELOAD != undefined) {
			EXPLORER_RELOAD.image_alpha = image_alpha; EXPLORER_RELOAD.x = x + 348; EXPLORER_RELOAD.y = y + 46;
		}

		// UPDATE GO ROOT
		if (GO_ROOT != undefined) {
			GO_ROOT.image_alpha = image_alpha; GO_ROOT.x = x - 113; GO_ROOT.y = y + 46;
			if (WINDOW.ON == false && GO_ROOT.ON != false) GO_ROOT.ON = false;
			else if (WINDOW.ON == true && GO_ROOT.ON != true) GO_ROOT.ON = true;
		}

		// UPDATE GO BACK
		if (GO_BACK != undefined) {
			GO_BACK.image_alpha = image_alpha; GO_BACK.x = x - 75; GO_BACK.y = y + 46;
			if (WINDOW.ON == false && GO_BACK.ON != false) GO_BACK.ON = false;
			else if (WINDOW.ON == true && GO_BACK.ON != true) GO_BACK.ON = true;
		}

		// UPDATE LEFT_NEW_FOLDER
		if (LEFT_NEW_SLIDER != undefined) {
			LEFT_NEW_SLIDER.image_alpha = image_alpha; LEFT_NEW_SLIDER.x = bbox_left + 140; LEFT_NEW_SLIDER.y = bbox_bottom - 48;
			LEFT_NEW_SLIDER.TEXT_CONNECT.x = bbox_left + 140; LEFT_NEW_SLIDER.TEXT_CONNECT.y = bbox_bottom - 48;
			if (WINDOW.ON == false && LEFT_NEW_SLIDER.ON != false) LEFT_NEW_SLIDER.ON = false;
			else if (WINDOW.ON == true && LEFT_NEW_SLIDER.ON != true) LEFT_NEW_SLIDER.ON = true;
		}

		// UPDATE PATHS
		if (PATH_COMPUTER != undefined) {
			PATH_COMPUTER.image_alpha = image_alpha; PATH_COMPUTER.x = bbox_left + 140; PATH_COMPUTER.y = bbox_top + 95;
			PATH_COMPUTER.TEXT_CONNECT.x = PATH_COMPUTER.x - 60; PATH_COMPUTER.TEXT_CONNECT.y = PATH_COMPUTER.y - 7;
			if (WINDOW.ON == false && PATH_COMPUTER.ON != false) PATH_COMPUTER.ON = false;
			else if (WINDOW.ON == true && PATH_COMPUTER.ON != true) PATH_COMPUTER.ON = true;
		}

		if (PATH_DESK != undefined) {
			PATH_DESK.image_alpha = image_alpha; PATH_DESK.x = bbox_left + 140; PATH_DESK.y = bbox_top + 125;
			PATH_DESK.TEXT_CONNECT.x = PATH_DESK.x - 60; PATH_DESK.TEXT_CONNECT.y = PATH_DESK.y - 7;
			if (WINDOW.ON == false && PATH_DESK.ON != false) PATH_DESK.ON = false;
			else if (WINDOW.ON == true && PATH_DESK.ON != true) PATH_DESK.ON = true;
		}
	
		if (PATH_DOWNLOAD != undefined) {
			PATH_DOWNLOAD.image_alpha = image_alpha; PATH_DOWNLOAD.x = bbox_left + 140; PATH_DOWNLOAD.y = bbox_top + 155;
			PATH_DOWNLOAD.TEXT_CONNECT.x = PATH_DOWNLOAD.x - 60; PATH_DOWNLOAD.TEXT_CONNECT.y = PATH_DOWNLOAD.y - 7;
			if (WINDOW.ON == false && PATH_DOWNLOAD.ON != false) PATH_DOWNLOAD.ON = false;
			else if (WINDOW.ON == true && PATH_DOWNLOAD.ON != true) PATH_DOWNLOAD.ON = true;
		}
		
		// UPDATE RETURNED_TO_TOP
		if (RETURNED_TO_TOP != undefined && RETURNED_TO_TOP.image_alpha >= 1)
			SPAWN = true;
		if (RETURNED_TO_TOP != undefined && SPAWN) {
			RETURNED_TO_TOP.x = x + 110;RETURNED_TO_TOP.y = y + 90;
			RETURNED_TO_TOP.TEXT_CONNECT.x = RETURNED_TO_TOP.x;
			RETURNED_TO_TOP.TEXT_CONNECT.y = RETURNED_TO_TOP.y;
			RETURNED_TO_TOP.image_alpha = image_alpha;
			RETURNED_TO_TOP.TEXT_CONNECT.image_alpha = image_alpha;
			RETURNED_TO_TOP.ON = WINDOW.ON;
		}

		// UPDATE LIST
		for (var i = 0; FOLDER_LIST[i] != undefined; i++) {
			if (FOLDER_LIST[i].ON)
				FOLDER_LIST[i].ON = false;
		}
		
		// SLIDER UPDATE
		if (EXPLORER_SLIDER != undefined && instance_exists(EXPLORER_SLIDER) && !MouseInside(EXPLORER_SLIDER.x, EXPLORER_SLIDER.x + EXPLORER_SLIDER.SIZE_X, EXPLORER_SLIDER.y, EXPLORER_SLIDER.y + EXPLORER_SLIDER.SIZE_Y) && EXPLORER_SLIDER.image_alpha >= 1) {
			DestroyButtonBox(TAG + "NEW_EXPLORERS_FOLDERS");
			DestroyButtonBox(TAG + "RENAME_EXPLORERS_FOLDERS");
			DestroyButtonBox(TAG + "DELETE_EXPLORERS_FOLDERS");
			DestroyObject(EXPLORER_SLIDER.TAG);
			EXPLORER_SLIDER = undefined;
		}
		
		//UPDATE ELEMENTS
		if (ELEMENTS != undefined) {
			ELEMENTS.image_alpha = image_alpha; ELEMENTS.x = bbox_left + 10; ELEMENTS.y = bbox_bottom - 20;
			ELEMENTS.TEXT =  string(N_ELEMENTS) + " Item(s)  | ";
		}
		
		//UPDATE EMPTY FOLDER
		if (N_ELEMENTS <= 0) {
			if (EMPTY_FOLDER == undefined) {
				EMPTY_FOLDER = AddText(x + 110, y + 300, "Folder is empty.", Arial10, c_black, WINDOW.LAYERS[0], "TEXT", [["CENTERED"], undefined]);
				WINDOW.list_objects = addtolist(EMPTY_FOLDER, WINDOW.list_objects);
			}
			EMPTY_FOLDER.image_alpha = image_alpha; EMPTY_FOLDER.x = x + 110; EMPTY_FOLDER.y = y + 300;
		} else if (N_ELEMENTS > 0 && EMPTY_FOLDER != undefined) {
			WINDOW.list_objects = remove_findlist(EMPTY_FOLDER, WINDOW.list_objects);
			DestroyText(EMPTY_FOLDER.TAG);
			EMPTY_FOLDER = undefined;
		}
		ON = false;
	}
	if (!CREATE) {
		
		// ON CREATE
		
		// CREATE SEARCH
		SEARCH = CreateTextButton(x - 259, y + 46, S_search_file, "Search", WINDOW.LAYERS[0], WINDOW.LAYERS[1], c_black, Segoe10, 20, TAG + "Search", [undefined]); WINDOW.list_objects = addtolist(SEARCH, WINDOW.list_objects);
		SEARCH.MORE_X += 35;
		SEARCH.write.BAR.image_index = 1;
		SEARCH.PARENT = id;
		
		// CREATE PATH
		PATH = AddText(x + 110, y + 48, PWD_PATH, Arial10, c_black, WINDOW.LAYERS[0], TAG + "PATH", [["CENTERED"], undefined]); WINDOW.list_objects = addtolist(PATH, WINDOW.list_objects);
		
		// CREATE FOLDER
		FOLDER_LIST = UpdateFileExplorer(PWD, PWD_PATH, FOLDER_LIST, id);
		
		// CREATE EXPLORER RELOAD
		EXPLORER_RELOAD = CreateObjectSprite(x + 347, y + 46, WINDOW.LAYERS[0], S_File_Explorer_Reload, Obox, "BUTTON", TAG + "EXPLORER_RELOAD", [["INFO", "Refresh"], undefined]); WINDOW.list_objects = addtolist(EXPLORER_RELOAD, WINDOW.list_objects);
		EXPLORER_RELOAD.PARENT = id;
		
		// CREATE ELEMENTS
		ELEMENTS = AddText(bbox_left + 10, bbox_bottom - 10, string(N_ELEMENTS) + " Item(s)  | ", Arial10, c_black, WINDOW.LAYERS[0], TAG + "ELEMENTS", [undefined]); WINDOW.list_objects = addtolist(ELEMENTS, WINDOW.list_objects);
		
		// CREATE GO_ROOT
		GO_ROOT = CreateObjectSprite(x - 130, y + 46, WINDOW.LAYERS[0], S_Files_Explorer_root, Obox, "BUTTON", TAG + "GO_ROOT", [["INFO", "Back to root"], undefined]); WINDOW.list_objects = addtolist(GO_ROOT, WINDOW.list_objects);
		GO_ROOT.PARENT = id;
		
		// CREATE GO BACK
		GO_BACK = CreateObjectSprite(x - 110, y + 46, WINDOW.LAYERS[0], S_Files_Explorer_back, Obox, "BUTTON", TAG + "GO_BACK", [["INFO", "Back to previous path"], undefined]); WINDOW.list_objects = addtolist(GO_BACK, WINDOW.list_objects);
		GO_BACK.PARENT = id;
	
		// ADD NEW LEFT SLIDER
		LEFT_NEW_SLIDER = CreateButtonBox(bbox_left + 80, bbox_bottom - 150, S_FIle_Explorer_new_folder_without_slider, Obox, "New folder", WINDOW.LAYERS[0], WINDOW.LAYERS[1], Arial10, c_black, TAG + "LEFT_NEW_FOLDER_EXPLORERS", [["CENTERED"], undefined]); WINDOW.list_objects = addtolist(LEFT_NEW_SLIDER, WINDOW.list_objects);
		LEFT_NEW_SLIDER.PARENT = id;
		
		// ADD PATHS
		PATH_COMPUTER = CreateButtonBox(bbox_left + 140, bbox_top + 100, S_Files_Explorer_path_computer, Obox, "This computer", WINDOW.LAYERS[0], WINDOW.LAYERS[1], Arial10, c_black, TAG + "PATH_THIS_COMPUTER", [undefined]);
		PATH_DESK = CreateButtonBox(bbox_left + 140, bbox_top + 120, S_Files_Explorer_path_desk, Obox, "Desk", WINDOW.LAYERS[0], WINDOW.LAYERS[1], Arial10, c_black, TAG + "PATH_DESK", [undefined]);
		PATH_DOWNLOAD = CreateButtonBox(bbox_left + 140, bbox_top + 140, S_Files_Explorer_path_download, Obox, "Downloads", WINDOW.LAYERS[0], WINDOW.LAYERS[1], Arial10, c_black, TAG + "PATH_DOWNLOADS", [undefined]);
		WINDOW.list_objects = addtolist(PATH_COMPUTER, WINDOW.list_objects); WINDOW.list_objects = addtolist(PATH_DESK, WINDOW.list_objects); WINDOW.list_objects = addtolist(PATH_COMPUTER, WINDOW.list_objects);
		PATH_COMPUTER.PARENT = id;PATH_DESK.PARENT = id;PATH_DOWNLOAD.PARENT = id;
		CREATE = true;
	} else if (CREATE && (WINDOW.ON || WINDOW.REDUCING || !WINDOW.FADE_MOVEMENT)) {
		
		// SEARCH UPDATE
		if (KeyPressed(vk_tab) && !SEARCH.write.ON_WRITE)
			SEARCH.write.ON_WRITE = true;
		
		// UpDATE NEW FOLDER
		if (MouseInsideObject(LEFT_NEW_SLIDER))
			LEFT_NEW_SLIDER.TEXT_CONNECT.COLOR = c_white;
		else if (LEFT_NEW_SLIDER.TEXT_CONNECT.COLOR == c_white)
			LEFT_NEW_SLIDER.TEXT_CONNECT.COLOR = c_black;
		
		// UPDATE PATH
		if (MouseInsideObject(PATH_COMPUTER))
			PATH_COMPUTER.TEXT_CONNECT.COLOR = c_white;
		else if (PATH_COMPUTER.TEXT_CONNECT.COLOR == c_white)
			PATH_COMPUTER.TEXT_CONNECT.COLOR = c_black;

		if (MouseInsideObject(PATH_DESK))
			PATH_DESK.TEXT_CONNECT.COLOR = c_white;
		else if (PATH_DESK.TEXT_CONNECT.COLOR == c_white)
			PATH_DESK.TEXT_CONNECT.COLOR = c_black;

		if (MouseInsideObject(PATH_DOWNLOAD))
			PATH_DOWNLOAD.TEXT_CONNECT.COLOR = c_white;
		else if (PATH_DOWNLOAD.TEXT_CONNECT.COLOR == c_white)
			PATH_DOWNLOAD.TEXT_CONNECT.COLOR = c_black;
			
		if (SEARCH.write.ON_WRITE && SEARCH.y > y + 30) {
			SEARCH.y -= 0.0001 * delta_time;
		} else if (SEARCH.write.ON_WRITE && SEARCH.y < y + 30) {
			if (FIND_OPTION_ROOT == undefined) {
				FIND_OPTION_ROOT = CreateButtonBox(x - 312, y + 60, S_FIles_Explorer_find_options, Obox, "PC search", WINDOW.LAYERS[0], WINDOW.LAYERS[1], Segoe8, c_white, TAG + "FIND_ROOT", [["INFO", "Search on all files, folders on machine from root"], ["CENTERED"], undefined]);
				FIND_OPTION_ROOT.TEXT_CONNECT.y -= 2;
				FIND_OPTION_FOLDER = CreateButtonBox(x - 205, y + 60, S_FIles_Explorer_find_options, Obox, "Current path", WINDOW.LAYERS[0], WINDOW.LAYERS[1], Segoe8, c_white, TAG + "FIND_FOLDER", [["INFO", "Search on all files, folders from current path"], ["CENTERED"], undefined]);
				FIND_OPTION_FOLDER.TEXT_CONNECT.y -= 2;
				FIND_OPTION_ROOT.PARENT = id;
				FIND_OPTION_FOLDER.PARENT = id;
				WINDOW.list_objects = addtolist(FIND_OPTION_ROOT, WINDOW.list_objects);
				WINDOW.list_objects = addtolist(FIND_OPTION_FOLDER, WINDOW.list_objects);
				SEARCH.y = y + 30;
			}
		}
		
		if (FIND_OPTION_ROOT != undefined && MouseInsideObject(FIND_OPTION_ROOT))
			FIND_OPTION_ROOT.TEXT_CONNECT.COLOR = c_white;
		else if (FIND_OPTION_ROOT != undefined && FIND_OPTION_ROOT.TEXT_CONNECT.COLOR == c_white && FIND_OPION_MODE != "ROOT")
			FIND_OPTION_ROOT.TEXT_CONNECT.COLOR = c_black;

		if (FIND_OPTION_FOLDER != undefined && MouseInsideObject(FIND_OPTION_FOLDER))
			FIND_OPTION_FOLDER.TEXT_CONNECT.COLOR = c_white;
		else if (FIND_OPTION_FOLDER != undefined && FIND_OPTION_FOLDER.TEXT_CONNECT.COLOR == c_white && FIND_OPION_MODE != "FOLDER")
			FIND_OPTION_FOLDER.TEXT_CONNECT.COLOR = c_black;

		if (FIND_OPTION_FOLDER != undefined && FIND_OPION_MODE == "FOLDER") {
			FIND_OPTION_FOLDER.image_index = 1;
			FIND_OPTION_FOLDER.TEXT_CONNECT.COLOR = c_white;
		}

		if (FIND_OPTION_ROOT != undefined && FIND_OPION_MODE == "ROOT") {
			FIND_OPTION_ROOT.image_index = 1;
			FIND_OPTION_ROOT.TEXT_CONNECT.COLOR = c_white;
		}
		
		if ((SEARCH.write.ON_WRITE || KeyPressed(vk_enter)) && SEARCH.write.TEXT_OUTPUT != "Search" && (KeyPressed(vk_anykey) || previous_enter != SEARCH.write.TEXT_OUTPUT)) {
			previous_enter = SEARCH.write.TEXT_OUTPUT;
			EXPLORER_RELOAD.REFRESH = true;
			EXPLORER_RELOAD.visible = false;
			if (EXPLORER_RELOAD.REFRESH_LOAD == undefined || !instance_exists(EXPLORER_RELOAD.REFRESH_LOAD))
				EXPLORER_RELOAD.REFRESH_LOAD = CreateObjectSprite(x, y, WINDOW.LAYERS[0], S_File_Explorer_Load, OJustGUI, "IMAGE", EXPLORER_RELOAD.TAG + "LOAD", [undefined]);
			EXPLORER_RELOAD.REFRESH_TIME = 0.5;
			if (FIND_OPION_MODE == "FOLDER")
				var find = find_files(PWD, PWD_PATH, SEARCH.write.TEXT_OUTPUT, 1);
			else
				var find = find_files(ON_MAIN_SCENE.PATH, "/~", SEARCH.write.TEXT_OUTPUT, 1);
			if (!find[0])
				return;
			PWD = find[1]
			PWD_PATH = find[2];
			
			for (var i = 0; FOLDER_LIST[i] != undefined; i++) {
				DestroyText(FOLDER_LIST[i].TEXT_CONNECT.TAG);
				DestroyText(FOLDER_LIST[i].DOCK_TYPE_TEXT.TAG);
				DestroyObject(FOLDER_LIST[i].OBJECT_LINKED.TAG);
				DestroyObject(FOLDER_LIST[i].TAG);
			}
			N_ELEMENTS = 0;
			FOLDER_LIST = [undefined];
			FOLDER_LIST = UpdateFileExplorer(PWD, PWD_PATH, FOLDER_LIST, id);
			rectsape_folder(id, undefined);
			for (var i = 0; FOLDER_LIST[i].NAME != SEARCH.write.TEXT_OUTPUT; ) { i++; }
			FOLDER_LIST[i].EXPLORER_SELECT = true;
			FOLDER_LIST[i].image_index = 1;
			FIND_TARGET = i;
		}
		
		if (FIND_TARGET != undefined)  {
			if (!FOLDER_LIST[FIND_TARGET].TEXT_CONNECT.visible) {
				rectsape_folder(id, "DOWN");
				FOLDER_LIST = UpdateFileExplorer(PWD, PWD_PATH, FOLDER_LIST, id);
			} else
				FIND_TARGET = undefined;
		}
			
		// MOUSE WHELL
		var DIR = undefined;
		if (mouse_wheel_down() && N_ELEMENTS > 0 && FOLDER_LIST[N_ELEMENTS - 1].y > bbox_bottom - 70) {
			if (RETURNED_TO_TOP != undefined) {
				WINDOW.list_objects = remove_findlist(RETURNED_TO_TOP, WINDOW.list_objects);
				DestroyButtonBox(RETURNED_TO_TOP.TAG);
				RETURNED_TO_TOP = undefined;
			}
			DIR = 1;
		}
		if (mouse_wheel_up() && (FOLDER_LIST[0] != undefined && FOLDER_LIST[0].y < y + 95)) {
			if (RETURNED_TO_TOP == undefined && !FOLDER_LIST[0].TEXT_CONNECT.visible) {
				RETURNED_TO_TOP = CreateButtonBox(x + 110, y + 50, S_FIles_Explorer_ReturnedToTop, Obox, "Returned to top", WINDOW.LAYERS[3], WINDOW.LAYERS[4], Arial10, c_black, TAG + "RETURNED_TO_TOP", [["FADE_IN", 0.000005], ["SLIDE", -0.0002], ["CENTERED"], undefined]);
				RETURNED_TO_TOP.PARENT = id;
				SPAWN = false;
				WINDOW.list_objects = addtolist(RETURNED_TO_TOP, WINDOW.list_objects);
			} else if (RETURNED_TO_TOP != undefined && FOLDER_LIST[0].TEXT_CONNECT.visible) {
				WINDOW.list_objects = remove_findlist(RETURNED_TO_TOP, WINDOW.list_objects);
				DestroyButtonBox(RETURNED_TO_TOP.TAG);
				RETURNED_TO_TOP = undefined;
			}
			DIR = 0;
		} else if (mouse_wheel_up() && FOLDER_LIST[0] != undefined && RETURNED_TO_TOP != undefined && FOLDER_LIST[0].TEXT_CONNECT.visible) {
			WINDOW.list_objects = remove_findlist(RETURNED_TO_TOP, WINDOW.list_objects);
			DestroyButtonBox(RETURNED_TO_TOP.TAG);
			RETURNED_TO_TOP = undefined;
		}
		
		if ((DIR != undefined && MouseInside(x - 140, bbox_right - 40, y + 70, bbox_bottom - 40)) || N_ELEMENTS > 19)
			rectsape_folder(id, DIR);
		// RIGHT CLICK
		if (mouse_check_button_pressed(mb_right) && MouseInside(x - 140, bbox_right - 40, y + 70, bbox_bottom - 40)) {
			rightclick_explorer(id, FOLDER_LIST, WINDOW.LAYERS);
			SLIDER_STATE = true;
		} else if (SLIDER_STATE && EXPLORER_SLIDER == undefined)
			SLIDER_STATE = false;
		
		// UPDATE LIST
		var on_returned = false;
		if (RETURNED_TO_TOP != undefined && MouseInsideObject(RETURNED_TO_TOP)) {
			RETURNED_TO_TOP.TEXT_CONNECT.COLOR = c_white;
			on_returned = true;
		} else if (RETURNED_TO_TOP != undefined && RETURNED_TO_TOP.TEXT_CONNECT.COLOR == c_white)
			RETURNED_TO_TOP.TEXT_CONNECT.COLOR = c_black;
		
		if (RETURNED_TO_TOP != undefined && mouse_check_button_pressed(mb_left) && on_returned) {
			RETURNED_TO_TOP_ACTIVE = true;
			DestroyButtonBox(RETURNED_TO_TOP.TAG);
			RETURNED_TO_TOP = undefined;
		}
		if (FOLDER_LIST[0] != undefined && FOLDER_LIST[0].TEXT_CONNECT.visible)
			RETURNED_TO_TOP_ACTIVE = false;
		if (RETURNED_TO_TOP_ACTIVE)
			rectsape_folder(id, "UP");
		if (!ON) {
			for (var i = 0; FOLDER_LIST[i] != undefined; i++)  {
				if (!SLIDER_STATE && FOLDER_LIST[i].TEXT_CONNECT.visible && !on_returned)
					FOLDER_LIST[i].ON = true;
				else
					FOLDER_LIST[i].ON = false;
			}
		}
		ON = true;
	}	
	return;
}