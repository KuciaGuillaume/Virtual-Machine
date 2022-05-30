

function CreateWindow(WINDOW_BK, TAG, ICON, NAME) {
	static ID = 0;
	
	if (ON_MAIN_SCENE.N_WINDOW >= ON_MAIN_SCENE.N_WINDOW_LIMITED) {
		CreateNotification(Ssystem_icon, "Warning", "Too many windows have already been created", "TOO_MANY_WINDOW");
		return;
	}
	ON_MAIN_SCENE.N_WINDOW += 1;	
	// LAYER
	OPTION = [["FADE_IN", 0.000005], "NULL"];
	for (var i = 0; global.layer_depth[i] != "NULL"; ) { i++; }
	var LAYER_1 = string(ID) + "LAYER" + string(global.last_layer_id - 1);
	layer_create(global.last_layer_id - 1, LAYER_1);
	var LAYER_2 = string(ID) + "LAYER" + string(global.last_layer_id - 2);
	layer_create(global.last_layer_id - 2, LAYER_2);
	var Gp0 = string(ID) + "GP0" + string(global.last_layer_id - 3);
	var Gp1 = string(ID) + "GP1" + string(global.last_layer_id - 4);
	var Gp2 = string(ID) + "GP2" + string(global.last_layer_id - 5);
	var Gp3 = string(ID) + "GP3" + string(global.last_layer_id - 6);
	var Gp4 = string(ID) + "GP4" + string(global.last_layer_id - 7);
	layer_create(global.last_layer_id - 3, Gp0);layer_create(global.last_layer_id - 4, Gp1);
	layer_create(global.last_layer_id - 5, Gp2);layer_create(global.last_layer_id - 6, Gp3);
	layer_create(global.last_layer_id - 7, Gp4);
	global.layer_depth[i] = ["LAYER" + string(ID), [LAYER_1, LAYER_2, Gp0, Gp1, Gp2, Gp3, Gp4, "NULL"]];
	global.layer_depth[i + 1] = "NULL";
	global.last_layer_id -= 7;

	var window = CreateObjectSprite(960, 260, LAYER_1, Swindow_top, Owindow, "TOP_WINDOW", TAG + string(ID), OPTION);
	window.WINDOW_BK = CreateObjectSprite(960 + 3, window.y + (window.sprite_height/2) - 6, LAYER_1, WINDOW_BK, OJustGUI, "WINDOW_BK", TAG + "_BK" + string(ID), OPTION);
	window.CLOSE = CreateObjectSprite(window.bbox_left + 17.5 + 10, window.y + 3, LAYER_2 , Swindow_close, OJustGUI, "BUTTON-NO-HAND", TAG + "CLOSE" + string(ID), OPTION);
	window.REDUCE = CreateObjectSprite(window.bbox_left + 42.5 + 10, window.y + 3, LAYER_2 , Swindow_reduce, OJustGUI, "BUTTON-NO-HAND", TAG + "CLOSE" + string(ID), OPTION);
	window.TEXT_TITLE = AddText(x + 10, y + 3, NAME, Arial10, c_black, LAYER_2, TAG + "TITLE" + string(ID), [["CENTERED"], ["FADE_IN", 0.000005], "NULL"]);
	window.ID = ID;
	window.WINDOW_TAG = TAG;
	window.MAIN_LAYER_ID = i;
	window.WINDOW_BK.WINDOW = window;
	window.LAYERS = [Gp0, Gp1, Gp2, Gp3, Gp4];
	global.layer_depth[i][2] = window;
	
	for (var i = 0; ON_MAIN_SCENE.TASKS[i] != "NULL" && ON_MAIN_SCENE.TASKS[i][0] != TAG; ) { i++; }
	
	if (ON_MAIN_SCENE.TASKS[i] != "NULL") {
		ON_MAIN_SCENE.TASKS[i][1] += 1;
		for (var e = 0; ON_MAIN_SCENE.TASKS[i][2][e] != "NULL"; ) { e++; }
		ON_MAIN_SCENE.TASKS[i][2][e] = [ID, true];
		ON_MAIN_SCENE.TASKS[i][2][e + 1] = "NULL";
		for (var l = 0;  ON_MAIN_SCENE.TASKS[i][3][l] != "NULL"; ) { l++; }
		ON_MAIN_SCENE.TASKS[i][3][l] = window;
		ON_MAIN_SCENE.TASKS[i][3][l + 1] = "NULL";
	} else {
		var new_class = [TAG, 1, [[ID, true], "NULL"], [window, "NULL"]];
		ON_MAIN_SCENE.TASKS[i] = new_class;
		ON_MAIN_SCENE.TASKS[i + 1] = "NULL";
	}
	
	var icon = GetObject(TAG + "_TASK_ICON");
	var task_bar = GetObject("MAIN_TASKBAR");
	// ICON
	if (icon == "NULL") {
		icon = CreateObjectSprite(task_bar.x, task_bar.y - 3, "TaskBar_Gp1", ICON, OJustGUI, "BUTTON-NO-HAND", TAG + "_TASK_ICON", [["INFO", NAME], "NULL"]);
		icon.WINDOW = i;
		window.ON_OBJECT = CreateObjectSprite(task_bar.x, task_bar.y + 12, "TaskBar_Gp2", S_on_task, OJustGUI, "IMAGE", TAG + "ON_TASK", ["NULL"]);
		icon.image_xscale = 0;
		icon.image_yscale = 0;
	} else
		window.ON_OBJECT = GetObject(TAG + "ON_TASK");
	window.image_alpha = 0;
	window.WINDOW_BK.image_alpha = 0;
	window.CLOSE.image_alpha = 0;
	window.REDUCE.image_alpha = 0;
	window.ICON = icon;
	ID += 1;
}