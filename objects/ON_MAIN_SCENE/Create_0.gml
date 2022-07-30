/// @On MainScene Create
// You can write your code in this editor


// WINDOWS
TASKS = [undefined];
N_WINDOW = 0;
N_WINDOW_LIMITED = 15;
ON_GUI = false;

// SLIDER
DESK_SLIDER = false;
DESK_SLIDER_OBJECT = undefined;


// ICONS
ICONS = [undefined];


PATH = global.PATH;
// FOLDERS
if (global.FOLDERS != undefined) {
	NAME_FOLDERS = global.FOLDERS;
	FOLDERS = [undefined];
	for (var i = 0; NAME_FOLDERS[i] != undefined; i++) {
		var folder = AddFolders(NAME_FOLDERS[i], "START");
		FOLDERS[i] = folder;
		FOLDERS[i + 1] = undefined;
		for (var e = 1; PATH[1][e] != undefined && PATH[1][e][0][0][0] != NAME_FOLDERS[i][0]; ) { e++;}
		if (PATH[1][e] != undefined)
			PATH[1][e][0][0][2] = folder;
	}
} else {
	NAME_FOLDERS = [undefined];
	FOLDERS = [undefined];
}

// DESK
ON_DESK = true;


if (PATH == undefined || PATH == undefined) {
	PATH = [[["~", "ROOT"]], undefined];
	var get = terminal_mkdir(["mkdir", "Desk", "Documents", "Downloads", undefined], undefined, PATH, undefined, "/~", undefined, "xx."); PATH = get[0];
}

var CURSOR = CreateObjects(960, 540, "Cursor",  Ocursor, "CURSOR", "CURSOR", [undefined]);
if (global.SETTINGS[6] == "MAC")
	CURSOR.sprite_index = Scursor;
if (global.SETTINGS[6] == "WIN11")
	CURSOR.sprite_index = S_Win11_cursor;
if (global.SETTINGS[6] == "WIN11_LIGHT")
	CURSOR.sprite_index = S_Win11_light_cursor;
var background = CreateObjectSprite(0, 0, "Background_Gp0", S_backgrounds, OJustGUI, "IMAGE", "MAIN_BACKGROUNDS", [["FADE_IN", 0.00001], undefined]);
background.image_index = global.USER[7];
TASKBAR = CreateObjectSprite(960, 1040, "TaskBar_Gp0", S_taskbar, OJustGUI, "IMAGE", "MAIN_TASKBAR", [["FADE_IN", 0.00001], undefined]);
HOME_ICON = CreateObjectSprite(TASKBAR.x, TASKBAR.y - 3, "TaskBar_Gp1", S_Home_Icon, Owindow_icon_tasks, "BUTTON-NO-HAND", "HOME_ICON", [["INFO", "Home"], undefined]);
ICON = addtolist(HOME_ICON, ICONS);
HOME = undefined;
// PIN
for (var i = 0; global.WINDOWS_PIN[i] != undefined; i++) {
	var class = global.WINDOWS_PIN[i];
	if (!class[0])
		continue;
	CreateWindowIcon(class[1], class[2], class[3], class[4], class[5]);
}

if (global.SETTINGS[5]) {
	CreateObjectSprite(30, 30, "Notifications_Gp0", S_SSsystem_Display_Framerate, OJustGUI, "IMAGE", "BACK_FRAMERATE", [undefined]);
	AddText(100, 42.5, string(fps), Arial10, c_white, "Notifications_Gp1", "FRAMERATE_TEXT", [["CENTERED"], undefined]);
}