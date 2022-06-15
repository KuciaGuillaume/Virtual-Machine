/// @description Insert description here
// You can write your code in this editor

var CTRL = KeyPress(vk_control);

if (CTRL && KeyPressed(ord("T"))) {
	CreateWindow(Sterminal_bk, OJustGUITerminal, "TERMINAL", S_terminal_icon, "Terminal");
	setforfolders(FOLDERS, false);
	ON_DESK = false;
}

if (CTRL && KeyPressed(ord("E")))
	CreateWindow(S_File_explorer_Bk, OJustGUI_File_explorer, "FILE_EXPLORER", S_File_explorer_icon, "File_explorer");

if (mouse_check_button_pressed(mb_left) || mouse_check_button_pressed(mb_right))
	check_all_off()
	

// RIGHT CLICK IN EMPTY && SLIDERS
if (mouse_check_button_pressed(mb_right) && ON_DESK) {
	
	// CHECK RIGHT CLICK ON FOLDERS
	var on_folders = undefined;
	for (var i = 0; FOLDERS[i] != undefined; i++) {
		if (FOLDERS[i] != undefined && instance_exists(FOLDERS[i]) && MouseInsideObject(FOLDERS[i])) {
			on_folders = FOLDERS[i];
			break;
		}
	}
	var task_bar = GetObject("MAIN_TASKBAR");
	if (MouseInsideObject(task_bar))
		return;
	var get = GetObject("NEW_FOLDER_SLIDERS");
	if (get != undefined)
		DestroyButtonBox(get.TAG);
	var get = GetObject("RENAME_FOLDER_SLIDERS");
	if (get != undefined)
		DestroyButtonBox(get.TAG);
	var get = GetObject("DELETE_FOLDER_SLIDERS");
	if (get != undefined)
		DestroyButtonBox(get.TAG);
	var get = GetObject("DESK_OPEN_IN_FILE_EXPLORER");
	if (get != undefined)
		DestroyButtonBox(get.TAG);
	if (on_folders == undefined) {
		DESK_SLIDER_OBJECT = CreateEmptyRound(mouse_x - 10, mouse_y - 25, c_white, 200, 56, "Sliders_Gp0", "DESK_SLIDERS", [["FADE_IN", 0.000005], ["SLIDE", 0.0001], undefined]);
		var button = CreateButtonBox(mouse_x + 90, mouse_y + 16, S_new_folder, OboxText, "Create new folder", "Sliders_Gp1", "Sliders_Gp2", Arial10, c_black, "NEW_FOLDER_SLIDERS", [["CENTERED"], ["FADE_IN", 0.000005], ["SLIDE", 0.0001],  undefined]);
		var open_explorer = CreateButtonBox(mouse_x + 90, mouse_y - 8, S_Desk_open_explorer, OboxText, "Open in file explorer", "Sliders_Gp1", "Sliders_Gp2", Arial10, c_black, "DESK_OPEN_IN_FILE_EXPLORER", [["CENTERED"], ["FADE_IN", 0.000005], ["SLIDE", 0.0001],  undefined]);
		button.PARENT = DESK_SLIDER_OBJECT;
		open_explorer.PARENT = DESK_SLIDER_OBJECT;
	} else if (on_folders.WRITE == undefined || (on_folders.WRITE != undefined && !on_folders.WRITE.ON_WRITE)) {
		DESK_SLIDER_OBJECT = CreateEmptyRound(mouse_x - 10, mouse_y - 25, c_white, 200, 56, "Sliders_Gp0", "DESK_SLIDERS", [["FADE_IN", 0.000005], ["SLIDE", 0.0001],  undefined]);
		var button = CreateButtonBox(mouse_x + 90, mouse_y + 16, S_rename_folder, OboxText, "Rename folder", "Sliders_Gp1", "Sliders_Gp2", Arial10, c_black, "RENAME_FOLDER_SLIDERS", [["CENTERED"], ["FADE_IN", 0.000005], ["SLIDE", 0.0001],  undefined]);
		var deleted = CreateButtonBox(mouse_x + 90, mouse_y - 8, S_delete_folder, OboxText, "Delete folder", "Sliders_Gp1", "Sliders_Gp2", Arial10, c_black, "DELETE_FOLDER_SLIDERS", [["CENTERED"], ["FADE_IN", 0.000005], ["SLIDE", 0.0001],  undefined]);
		button.NUM_LINKED = i;
		button.PARENT = DESK_SLIDER_OBJECT;
		deleted.PARENT = DESK_SLIDER_OBJECT;
		deleted.NUM_LINKED = i;
	}
	DESK_SLIDER = true;
}

if (DESK_SLIDER_OBJECT != undefined && DESK_SLIDER && (!MouseInside(DESK_SLIDER_OBJECT.x, DESK_SLIDER_OBJECT.x + DESK_SLIDER_OBJECT.SIZE_X, DESK_SLIDER_OBJECT.y, DESK_SLIDER_OBJECT.y + DESK_SLIDER_OBJECT.SIZE_Y) || !ON_DESK) && DESK_SLIDER_OBJECT.image_alpha >= 1) {
	DESK_SLIDER = false;
	DestroyObject(DESK_SLIDER_OBJECT.TAG);
	DestroyButtonBox("DESK_OPEN_IN_FILE_EXPLORER");
	DestroyButtonBox("DELETE_FOLDER_SLIDERS");
	DestroyButtonBox("NEW_FOLDER_SLIDERS");
	DestroyButtonBox("RENAME_FOLDER_SLIDERS");
}

if (keyboard_check_pressed(vk_escape)) {
	savegame_save("USER", [global.USER, PATH, NAME_FOLDERS, global.WINDOWS_PIN, undefined]);
	Machine("END");
}