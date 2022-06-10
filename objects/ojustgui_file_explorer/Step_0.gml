/// @Project by Kucia Guillaume* ///

if (TAG == "NULL")
	return;

if (!FIRST_PASS && !FADE_IN) {image_alpha = 2; FIRST_PASS = true; } 

// FADE_IN

if (FADE_IN && image_alpha < 1)
	image_alpha += FADE_POWER * delta_time;
else
	FADE_IN = false;

if (CLOSE && string_count("FILE_EXPLORER", WINDOW_TAG)) {
	
	for (var i = 0; FOLDER_LIST[i] != "NULL"; i++) {
		DestroyText(FOLDER_LIST[i].TEXT_CONNECT.TAG);
		DestroyText(FOLDER_LIST[i].DOCK_TYPE_TEXT.TAG);
		DestroyObject(FOLDER_LIST[i].OBJECT_LINKED);
		DestroyObject(FOLDER_LIST[i].TAG);
	}
	if (EXPLORER_RELOAD.REFRESH)
		DestroyObject(EXPLORER_RELOAD.REFRESH_LOAD.TAG);
	if (EMPTY_FOLDER != "NULL")
		DestroyText(EMPTY_FOLDER.TAG);
	DestroyText(ELEMENTS.TAG);
	DestroyObject(GO_ROOT.TAG);
	DestroyObject(GO_BACK.TAG);
	DestroyObject(EXPLORER_RELOAD.TAG);
	DestroyTextButton(SEARCH.TAG);
	DestroyText(PATH.TAG);
	DestroyObject(TAG);
}

if ((WINDOW != "NULL" && instance_exists(WINDOW)) && !CLOSE && string_count("FILE_EXPLORER", WINDOW.TAG) ) {
	
	if (CREATE) {
		if (SEARCH != "NULL") {
			SEARCH.ON = WINDOW.ON;
			if (EXPLORER_SLIDER == "NULL" || !instance_exists(EXPLORER_SLIDER))
				EXPLORER_RELOAD.ON = WINDOW.ON;
			else
				EXPLORER_RELOAD.ON = false;
			if (!WINDOW.ON) SEARCH.write.ON_WRITE = false;
		}

		// UPDTAE SEARCH
		if (SEARCH != "NULL") {
			if (!WINDOW.REDUCING) {
				SEARCH.image_alpha = image_alpha; SEARCH.x = x - 259; SEARCH.y = y + 46;
			} else {
				SEARCH.image_alpha = 0; SEARCH.x = x - 259; SEARCH.y = y + 46; }
		}

		// UPDTAE PATH
		if (PATH != "NULL") {
			PATH.image_alpha = image_alpha; PATH.x = x + 110; PATH.y = y + 47;
			PATH.TEXT = PWD_PATH;
		}
		
		// UPDATE EXPLORER RELOAD
		if (EXPLORER_RELOAD != "NULL") {
			EXPLORER_RELOAD.image_alpha = image_alpha; EXPLORER_RELOAD.x = x + 348; EXPLORER_RELOAD.y = y + 46;
		}

		// UPDATE GO ROOT
		if (GO_ROOT != "NULL") {
			GO_ROOT.image_alpha = image_alpha; GO_ROOT.x = x - 113; GO_ROOT.y = y + 46;
		}

		// UPDATE GO BACK
		if (GO_BACK != "NULL") {
			GO_BACK.image_alpha = image_alpha; GO_BACK.x = x - 75; GO_BACK.y = y + 46;
		}

		// UPDATE LIST
		for (var i = 0; FOLDER_LIST[i] != "NULL"; i++)
			FOLDER_LIST[i].ON = false;
		
		// SLIDER UPDATE
		if (EXPLORER_SLIDER != "NULL" && instance_exists(EXPLORER_SLIDER) && !MouseInside(EXPLORER_SLIDER.x, EXPLORER_SLIDER.x + EXPLORER_SLIDER.SIZE_X, EXPLORER_SLIDER.y, EXPLORER_SLIDER.y + EXPLORER_SLIDER.SIZE_Y) && EXPLORER_SLIDER.image_alpha >= 1) {
			DestroyButtonBox(TAG + "NEW_EXPLORERS_FOLDERS");
			DestroyButtonBox(TAG + "RENAME_EXPLORERS_FOLDERS");
			DestroyButtonBox(TAG + "DELETE_EXPLORERS_FOLDERS");
			DestroyObject(EXPLORER_SLIDER.TAG);
			EXPLORER_SLIDER = "NULL";
		}
		
		//UPDATE ELEMENTS
		if (ELEMENTS != "NULL") {
			ELEMENTS.image_alpha = image_alpha; ELEMENTS.x = bbox_left + 10; ELEMENTS.y = bbox_bottom - 20;
			ELEMENTS.TEXT =  string(N_ELEMENTS) + " Item(s)  | ";
		}
		
		//UPDATE EMPTY FOLDER
		if (N_ELEMENTS <= 0) {
			if (EMPTY_FOLDER == "NULL") {
				EMPTY_FOLDER = AddText(x + 110, y + 300, "Folder is empty.", Arial10, c_black, WINDOW.LAYERS[0], "TEXT", [["CENTERED"], "NULL"]);
				WINDOW.list_objects = addtolist(EMPTY_FOLDER, WINDOW.list_objects);
			}
			EMPTY_FOLDER.image_alpha = image_alpha; EMPTY_FOLDER.x = x + 110; EMPTY_FOLDER.y = y + 300;
		} else if (N_ELEMENTS > 0 && EMPTY_FOLDER != "NULL") {
			WINDOW.list_objects = remove_findlist(EMPTY_FOLDER, WINDOW.list_objects);
			DestroyText(EMPTY_FOLDER.TAG);
			EMPTY_FOLDER = "NULL";
		}
	}
	if (!CREATE) {
		
		// ON CREATE
		
		// CREATE SEARCH
		SEARCH = CreateTextButton(x - 259, y + 46, S_search_file, "Search", WINDOW.LAYERS[0], WINDOW.LAYERS[1], c_black, Segoe10, 20, TAG + "Search", ["NULL"]); WINDOW.list_objects = addtolist(SEARCH, WINDOW.list_objects);
		SEARCH.MORE_X += 35;
		SEARCH.write.BAR.image_index = 1;
		
		// CREATE PATH
		PATH = AddText(x + 110, y + 48, PWD_PATH, Arial10, c_black, WINDOW.LAYERS[0], TAG + "PATH", [["CENTERED"], "NULL"]); WINDOW.list_objects = addtolist(PATH, WINDOW.list_objects);
		
		// CREATE FOLDER
		FOLDER_LIST = UpdateFileExplorer(PWD, PWD_PATH, FOLDER_LIST, id);
		
		// CREATE EXPLORER RELOAD
		EXPLORER_RELOAD = CreateObjectSprite(x + 347, y + 46, WINDOW.LAYERS[0], S_File_Explorer_Reload, Obox, "BUTTON", TAG + "EXPLORER_RELOAD", [["INFO", "Refresh"], "NULL"]); WINDOW.list_objects = addtolist(EXPLORER_RELOAD, WINDOW.list_objects);
		EXPLORER_RELOAD.PARENT = id;
		
		// CREATE ELEMENTS
		ELEMENTS = AddText(bbox_left + 10, bbox_bottom - 10, string(N_ELEMENTS) + " Item(s)  | ", Arial10, c_black, WINDOW.LAYERS[0], TAG + "ELEMENTS", ["NULL"]);
		
		// CREATE GO_ROOT
		GO_ROOT = CreateObjectSprite(x - 130, y + 46, WINDOW.LAYERS[0], S_Files_Explorer_root, Obox, "BUTTON", TAG + "GO_ROOT", [["INFO", "Back to root"], "NULL"]);
		GO_ROOT.PARENT = id;
		
		// CREATE GO BACK
		GO_BACK = CreateObjectSprite(x - 110, y + 46, WINDOW.LAYERS[0], S_Files_Explorer_back, Obox, "BUTTON", TAG + "GO_BACK", [["INFO", "Back to previous path"], "NULL"]);
		GO_BACK.PARENT = id;
	
		CREATE = true;
	} else if (CREATE && (WINDOW.ON || WINDOW.REDUCING || !WINDOW.FADE_MOVEMENT)) {
		
		// SEARCH UPDATE
		if (KeyPressed(vk_tab) && !SEARCH.write.ON_WRITE)
			SEARCH.write.ON_WRITE = true;
		
		// RIGHT CLICK
		if (mouse_check_button_pressed(mb_right) && MouseInside(x - 140, bbox_right - 40, y + 70, bbox_bottom - 40))
			rightclick_explorer(id, FOLDER_LIST, WINDOW.LAYERS);
		
		// UPDATE LIST
		for (var i = 0; FOLDER_LIST[i] != "NULL"; i++) {
			if (GetObject(TAG + "EXPLORER_SLIDERS") == "NULL")
				FOLDER_LIST[i].ON = true;
			else
				FOLDER_LIST[i].ON = false;
		}
	}	
	return;
}