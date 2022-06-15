// Les actifs du script ont changé pour v2.3.0 Voir
// https://help.yoyogames.com/hc/en-us/articles/360005277377 pour plus d’informations

function check_path(PWD, PATH) {

	PWD = go_to_path(ON_MAIN_SCENE.PATH, PATH);
	var slash = string_count("/", PATH);
	for (var e = 1; slash != 0; e++)
		if (string_char_at(PATH, e) == "/")
			slash -= 1;
	var size = string_length(PATH) + 1;
	var get_end = "";
	for (; e != size; e++)
		get_end = get_end + string_char_at(PATH, e);
	if (get_end != PWD[0][0][0])
		return false;
	return true;
}

function rightclick_explorer(PARENT, FOLDERS, LAYERS) {

	if (!check_path(PARENT.PWD, PARENT.PWD_PATH)) {
		PARENT.PWD = ON_MAIN_SCENE.PATH;
		PARENT.PWD_PATH = "/~";
		PARENT.FOLDER_LIST = UpdateFileExplorer(PARENT.PWD , PARENT.PWD_PATH, PARENT.FOLDER_LIST, PARENT.id);
		return;
	}
	// CHECK RIGHT CLICK ON FOLDERS
	var on_folders = undefined;
	for (var i = 0; FOLDERS[i] != undefined; i++) {
		if (FOLDERS[i] != undefined && instance_exists(FOLDERS[i]) && MouseInsideObject(FOLDERS[i])) {
			on_folders = FOLDERS[i];
			break;
		}
	};

	var get = GetObject(PARENT.TAG + "NEW_EXPLORERS_FOLDERS");
	if (get != undefined) {
		PARENT.WINDOW.list_objects = remove_findlist(get, PARENT.WINDOW.list_objects);
		DestroyButtonBox(get.TAG);
	}

	var get = GetObject(PARENT.TAG + "RENAME_EXPLORERS_FOLDERS");
	if (get != undefined) {
		PARENT.WINDOW.list_objects = remove_findlist(get, PARENT.WINDOW.list_objects);
		DestroyButtonBox(get.TAG);
	}

	var get = GetObject(PARENT.TAG + "DELETE_EXPLORERS_FOLDERS");
	if (get != undefined) {
		PARENT.WINDOW.list_objects = remove_findlist(get, PARENT.WINDOW.list_objects);
		DestroyButtonBox(get.TAG);
	}
	
	var get = GetObject(PARENT.TAG + "EXPLORERS_OPEN_IN_ANOTHER");
	if (get != undefined) {
		PARENT.WINDOW.list_objects = remove_findlist(get, PARENT.WINDOW.list_objects);
		DestroyButtonBox(get.TAG);
	}

	if (on_folders == undefined) {
		PARENT.EXPLORER_SLIDER = CreateEmptyRound(mouse_x - 10, mouse_y - 5, c_white, 200, 31, LAYERS[2], PARENT.TAG + "EXPLORER_SLIDERS", [["FADE_IN", 0.000005], ["SLIDE", 0.0001], undefined]);
		var button = CreateButtonBox(mouse_x + 90, mouse_y + 11, S_new_folder, OboxText, "Create new folder", LAYERS[3], LAYERS[4], Arial10, c_black, PARENT.TAG + "NEW_EXPLORERS_FOLDERS", [["CENTERED"], ["FADE_IN", 0.000005], ["SLIDE", 0.0001],  undefined]);
		button.PARENT = PARENT.EXPLORER_SLIDER;
		PARENT.WINDOW.list_objects = addtolist(PARENT.EXPLORER_SLIDER, PARENT.WINDOW.list_objects);
		PARENT.WINDOW.list_objects = addtolist(button, PARENT.WINDOW.list_objects);
	} else if (on_folders.WRITE == undefined || (on_folders.WRITE != undefined && !on_folders.WRITE.ON_WRITE)) {
		PARENT.EXPLORER_SLIDER = CreateEmptyRound(mouse_x - 10, mouse_y - 40, c_white, 200, 81, LAYERS[2], PARENT.TAG + "EXPLORER_SLIDERS", [["FADE_IN", 0.000005], ["SLIDE", 0.0001], undefined]);
		var button = CreateButtonBox(mouse_x + 90, mouse_y + 25, S_rename_folder, OboxText, "Rename folder", LAYERS[3], LAYERS[4], Arial10, c_black, PARENT.TAG + "RENAME_EXPLORERS_FOLDERS", [["CENTERED"], ["FADE_IN", 0.000005], ["SLIDE", 0.0001],  undefined]);
		var deleted = CreateButtonBox(mouse_x + 90, mouse_y - 23, S_delete_folder, OboxText, "Delete folder", LAYERS[3], LAYERS[4], Arial10, c_black, PARENT.TAG + "DELETE_EXPLORERS_FOLDERS", [["CENTERED"], ["FADE_IN", 0.000005], ["SLIDE", 0.0001],  undefined]);
		var open = CreateButtonBox(mouse_x + 90, mouse_y + 1, S_Desk_open_explorer, OboxText, "Open in another explorer", LAYERS[3], LAYERS[4], Arial10, c_black, PARENT.TAG + "EXPLORERS_OPEN_IN_ANOTHER", [["CENTERED"], ["FADE_IN", 0.000005], ["SLIDE", 0.0001],  undefined]);
		button.NUM_LINKED = i;
		button.PARENT = PARENT.EXPLORER_SLIDER;
		deleted.PARENT = PARENT.EXPLORER_SLIDER;
		deleted.NUM_LINKED = i;
		open.PARENT = PARENT.EXPLORER_SLIDER;
		open.NUM_LINKED = i;
		PARENT.WINDOW.list_objects = addtolist(PARENT.EXPLORER_SLIDER, PARENT.WINDOW.list_objects);
		PARENT.WINDOW.list_objects = addtolist(button, PARENT.WINDOW.list_objects);
		PARENT.WINDOW.list_objects = addtolist(deleted, PARENT.WINDOW.list_objects);
		PARENT.WINDOW.list_objects = addtolist(open, PARENT.WINDOW.list_objects);
	}
	PARENT.EXPLORER_SLIDER.PARENT = PARENT;
}