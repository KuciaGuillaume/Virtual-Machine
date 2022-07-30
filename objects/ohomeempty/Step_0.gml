/// @Project by Kucia Guillaume* ///

IMAGE_WIDTH = SIZE_X;
IMAGE_HEIGHT = SIZE_Y;
DevKit(id);
// CLICK
if (!MouseInsideRound(id) || !mouse_check_button_pressed(mb_left) || !ON) return;

if (TAG == "HOME_OPTION_POWER_OFF") {
	savegame_clear("USER");
	savegame_save("USER", [global.USER, ON_MAIN_SCENE.PATH, ON_MAIN_SCENE.NAME_FOLDERS, global.WINDOWS_PIN, global.SETTINGS, global.SOUNDS, global.GAME_VALUE, undefined]);
	Machine("END");
} if (TAG == "HOME_OPTION_RESTART") {
	savegame_clear("USER");
	savegame_save("USER", [global.USER, ON_MAIN_SCENE.PATH, ON_MAIN_SCENE.NAME_FOLDERS, global.WINDOWS_PIN, global.SETTINGS, global.SOUNDS, global.GAME_VALUE, undefined]);
	Machine("RESTART");
} if (TAG == "HOME_OPTION_STANDBY") {
	savegame_clear("USER");
	savegame_save("USER", [global.USER, ON_MAIN_SCENE.PATH, ON_MAIN_SCENE.NAME_FOLDERS, global.WINDOWS_PIN, global.SETTINGS, global.SOUNDS, global.GAME_VALUE, undefined]);
	Machine("STANDBY");
}

if (TAG == "HOME_FILE_TERMINAL") {
	CreateWindow(Sterminal_bk, OJustGUITerminal, "TERMINAL", S_terminal_icon, "Terminal");
	DestroyHome();
}

if (TAG == "HOME_FILE_EXPLORERS") {
	CreateWindow(S_File_explorer_Bk, OJustGUI_File_explorer, "FILE_EXPLORER", S_File_explorer_icon, "File_explorer");
	DestroyHome();
}

if (TAG == "HOME_FILE_SETTINGS") {
	CreateWindow(S_Settings_BK, OJustGUI_Settings, "SETTINGS", S_Settings_Icon, "Settings");
	DestroyHome();
}

if (IS_FOLDER) {
	var window = CreateWindow(S_File_explorer_Bk, OJustGUI_File_explorer, "FILE_EXPLORER", S_File_explorer_icon, "File_explorer");
	window.WINDOW_BK.PWD = FOLDER_PWD;
	window.WINDOW_BK.PWD_PATH = FOLDER_PWD_PATH;
}