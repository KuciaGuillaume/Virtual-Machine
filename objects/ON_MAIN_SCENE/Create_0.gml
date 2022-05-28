/// @On MainScene Create
// You can write your code in this editor

CreateObjects(960, 540, "Cursor",  Ocursor, "CURSOR", "CURSOR", ["NULL"]);
CreateObjectSprite(0, 0, "TaskBar_Gp0", S_backgrounds, OJustGUI, "IMAGE", "MAIN_BACKGROUNDS", [["INDEX_IMAGE", global.USER[7]], ["FADE_IN", 0.00001], "NULL"]);
CreateObjectSprite(960, 1040, "TaskBar_Gp1", S_taskbar, OJustGUI, "IMAGE", "MAIN_TASKBAR", [["FADE_IN", 0.00001], "NULL"]);
