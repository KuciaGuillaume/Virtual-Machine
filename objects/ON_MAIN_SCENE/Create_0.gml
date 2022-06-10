/// @On MainScene Create
// You can write your code in this editor

// WINDOWS
TASKS = ["NULL"];
N_WINDOW = 0;
N_WINDOW_LIMITED = 15;
ON_GUI = false;

// SLIDER
DESK_SLIDER = false;
DESK_SLIDER_OBJECT = "NULL";

// ICONS
ICONS = ["NULL"];


PATH = global.PATH;
// FOLDERS
if (global.FOLDERS != undefined) {
	NAME_FOLDERS = global.FOLDERS;
	FOLDERS = ["NULL"];
	for (var i = 0; NAME_FOLDERS[i] != "NULL"; i++) {
		var folder = AddFolders(NAME_FOLDERS[i], "START");
		FOLDERS[i] = folder;
		FOLDERS[i + 1] = "NULL";
		for (var e = 1; PATH[1][e] != "NULL" && PATH[1][e][0][0][0] != NAME_FOLDERS[i][0]; ) { e++;}
		if (PATH[1][e] != "NULL")
			PATH[1][e][0][0][2] = folder;
	}
} else {
	NAME_FOLDERS = ["NULL"];
	FOLDERS = ["NULL"];
}

// DESK
ON_DESK = true;


if (PATH == undefined || PATH == "NULL") {
	PATH = [[["~", "ROOT"]], "NULL"];
	var get = terminal_mkdir(["mkdir", "Desk", "Documents", "NULL"], "NULL", PATH, "NULL", "/~"); PATH = get[0];
}

CURSOR = CreateObjects(960, 540, "Cursor",  Ocursor, "CURSOR", "CURSOR", ["NULL"]);
CreateObjectSprite(0, 0, "Background_Gp0", S_backgrounds, OJustGUI, "IMAGE", "MAIN_BACKGROUNDS", [["INDEX_IMAGE", global.USER[7]], ["FADE_IN", 0.00001], "NULL"]);
TASKBAR = CreateObjectSprite(960, 1040, "TaskBar_Gp0", S_taskbar, OJustGUI, "IMAGE", "MAIN_TASKBAR", [["FADE_IN", 0.00001], "NULL"]);

// PIN
for (var i = 0; global.WINDOWS_PIN[i] != "NULL"; i++) {
	var class = global.WINDOWS_PIN[i];
	if (!class[0])
		continue;
	CreateWindowIcon(class[1], class[2], class[3], class[4], class[5]);
}