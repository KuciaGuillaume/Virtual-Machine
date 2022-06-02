/// @On MainScene Create
// You can write your code in this editor


TASKS = ["NULL"];
N_WINDOW = 0;
N_WINDOW_LIMITED = 15;
ON_GUI = false;


PATH = global.PATH;
if (PATH == undefined) {
	PATH = ["~", "NULL"];
	var get = terminal_mkdir(["mkdir", "Desk", "Documents", "NULL"], "NULL", PATH, "NULL", "/~"); PATH = get[0];
}

CreateObjects(960, 540, "Cursor",  Ocursor, "CURSOR", "CURSOR", ["NULL"]);
CreateObjectSprite(0, 0, "Background_Gp0", S_backgrounds, OJustGUI, "IMAGE", "MAIN_BACKGROUNDS", [["INDEX_IMAGE", global.USER[7]], ["FADE_IN", 0.00001], "NULL"]);
CreateObjectSprite(960, 1040, "TaskBar_Gp0", S_taskbar, OJustGUI, "IMAGE", "MAIN_TASKBAR", [["FADE_IN", 0.00001], "NULL"]);
