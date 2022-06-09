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
	DestroyTextButton(SEARCH.TAG);
	DestroyText(PATH.TAG);
	DestroyObject(TAG);
}

if ((WINDOW != "NULL" && instance_exists(WINDOW)) && !CLOSE && string_count("FILE_EXPLORER", WINDOW.TAG) ) {
	
	if (CREATE) {
		if (SEARCH != "NULL") {
			SEARCH.ON = WINDOW.ON;
			if (!WINDOW.ON) SEARCH.write.ON_WRITE = false;
		}
		// UPDATE LIST
		for (var i = 0; FOLDER_LIST[i] != "NULL"; i++)
			FOLDER_LIST[i].ON = false;
	}
	if (!CREATE) {
		
		// ON CREATE
		
		// CREATE SEARCH
		SEARCH = CreateTextButton(x - 259, y + 46, S_search_file, "Search", WINDOW.LAYERS[0], WINDOW.LAYERS[1], c_black, Segoe10, 20, TAG + "Search", ["NULL"]); addtolist(SEARCH, WINDOW.list_objects);
		SEARCH.MORE_X += 35;
		SEARCH.write.BAR.image_index = 1;
		
		// CREATE PATH
		PATH = AddText(x + 110, y + 47, PWD_PATH, Arial10, c_black, WINDOW.LAYERS[0], TAG + "PATH", [["CENTERED"], "NULL"]); addtolist(PATH, WINDOW.list_objects);
		CREATE = true;
		
		// CREATE FOLDER
		FOLDER_LIST = UpdateFileExplorer(PWD, PWD_PATH, FOLDER_LIST, id);
	} else if (CREATE && (WINDOW.ON || WINDOW.REDUCING || !WINDOW.FADE_MOVEMENT)) {
		
		// UPDTAE SEARCH
		if (SEARCH != "NULL") {
			if (!WINDOW.REDUCING) {
				SEARCH.image_alpha = image_alpha; SEARCH.x = x - 259; SEARCH.y = y + 46;
			} else {
				SEARCH.image_alpha = 0; SEARCH.x = x - 259; SEARCH.y = y + 46; }
		}

		// UPDTAE PATH
		if (PATH != "NULL")
			PATH.image_alpha = image_alpha; PATH.x = x + 110; PATH.y = y + 47;
		if (KeyPressed(vk_tab) && !SEARCH.write.ON_WRITE)
			SEARCH.write.ON_WRITE = true;
		
		// UPDATE LIST
		for (var i = 0; FOLDER_LIST[i] != "NULL"; i++)
			FOLDER_LIST[i].ON = true;
	}	
	return;
}