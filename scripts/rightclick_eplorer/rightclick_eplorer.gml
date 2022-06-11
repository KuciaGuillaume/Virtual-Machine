// Les actifs du script ont changé pour v2.3.0 Voir
// https://help.yoyogames.com/hc/en-us/articles/360005277377 pour plus d’informations
function rightclick_explorer(PARENT, FOLDERS, LAYERS) {

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
		DestroyButtonBox(PARENT.TAG + "NEW_EXPLORERS_FOLDERS");
	}

	var get = GetObject(PARENT.TAG + "RENAME_EXPLORERS_FOLDERS");
	if (get != undefined) {
		PARENT.WINDOW.list_objects = remove_findlist(get, PARENT.WINDOW.list_objects);
		DestroyButtonBox(PARENT.TAG + "RENAME_EXPLORERS_FOLDERS");
	}

	var get = GetObject(PARENT.TAG + "DELETE_EXPLORERS_FOLDERS");
	if (get != undefined) {
		PARENT.WINDOW.list_objects = remove_findlist(get, PARENT.WINDOW.list_objects);
		DestroyButtonBox(PARENT.TAG + "DELETE_EXPLORERS_FOLDERS");
	}

	if (on_folders == undefined) {
		PARENT.EXPLORER_SLIDER = CreateEmptyRound(mouse_x - 10, mouse_y - 5, c_white, 200, 31, LAYERS[2], PARENT.TAG + "EXPLORER_SLIDERS", [["FADE_IN", 0.000005], ["SLIDE", 0.0001], undefined]);
		var button = CreateButtonBox(mouse_x + 90, mouse_y + 11, S_new_folder, OboxText, "Create new folder", LAYERS[3], LAYERS[4], Arial10, c_black, PARENT.TAG + "NEW_EXPLORERS_FOLDERS", [["CENTERED"], ["FADE_IN", 0.000005], ["SLIDE", 0.0001],  undefined]);
		button.PARENT = PARENT.EXPLORER_SLIDER;
		PARENT.WINDOW.list_objects = addtolist(PARENT.EXPLORER_SLIDER, PARENT.WINDOW.list_objects);
		PARENT.WINDOW.list_objects = addtolist(button, PARENT.WINDOW.list_objects);
	} else {
		PARENT.EXPLORER_SLIDER = CreateEmptyRound(mouse_x - 10, mouse_y - 25, c_white, 200, 56, LAYERS[2], PARENT.TAG + "EXPLORER_SLIDERS", [["FADE_IN", 0.000005], ["SLIDE", 0.0001], undefined]);
		var button = CreateButtonBox(mouse_x + 90, mouse_y + 16, S_rename_folder, OboxText, "Rename folder", LAYERS[3], LAYERS[4], Arial10, c_black, PARENT.TAG + "RENAME_EXPLORERS_FOLDERS", [["CENTERED"], ["FADE_IN", 0.000005], ["SLIDE", 0.0001],  undefined]);
		var deleted = CreateButtonBox(mouse_x + 90, mouse_y - 8, S_delete_folder, OboxText, "Delete folder", LAYERS[3], LAYERS[4], Arial10, c_black, PARENT.TAG + "DELETE_EXPLORERS_FOLDERS", [["CENTERED"], ["FADE_IN", 0.000005], ["SLIDE", 0.0001],  undefined]);
		button.NUM_LINKED = i;
		button.PARENT = PARENT.EXPLORER_SLIDER;
		deleted.PARENT = PARENT.EXPLORER_SLIDER;
		deleted.NUM_LINKED = i;
		PARENT.WINDOW.list_objects = addtolist(PARENT.EXPLORER_SLIDER, PARENT.WINDOW.list_objects);
		PARENT.WINDOW.list_objects = addtolist(button, PARENT.WINDOW.list_objects);
		PARENT.WINDOW.list_objects = addtolist(deleted, PARENT.WINDOW.list_objects);
	}
	PARENT.EXPLORER_SLIDER.PARENT = PARENT;
}