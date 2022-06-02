/// @Project by Kucia Guillaume* ///

if (TAG == "NULL")
	return;
for (var i = 0; OPTION[i] != "NULL"; i++) {
	if (OPTION[i][0] == "FADE_IN" && !FADE_SATE) { 
		FADE_IN = true; FADE_POWER = OPTION[i][1];
		FADE_SATE = true; image_alpha = 0;
	}
	if (OPTION[i][0] == "INDEX_IMAGE")
		image_index = OPTION[i][1];
	if (OPTION[i][0] == "FADE_ON") {FADE_ON = true; FADE_ON_POWER = OPTION[i][1]; }
	if (OPTION[i][0] == "INFO") {INFO = true; INFO_NAME = OPTION[i][1]; }
}

if (!FIRST_PASS && !FADE_IN) {image_alpha = 2; FIRST_PASS = true; } 

// FADE_IN

if (FADE_IN && image_alpha < 1)
	image_alpha += FADE_POWER * delta_time;
else
	FADE_IN = false;

if (!PIN && ON_MAIN_SCENE.TASKS[WINDOW][3][0] == "NULL")
	OPT_CLOSING = true;

var windows_n = 0;
for (var i = 0; ON_MAIN_SCENE.TASKS[WINDOW][3][i] != "NULL"; i++) {
	var obj = ON_MAIN_SCENE.TASKS[WINDOW][3][i];
	if (instance_exists(obj))
		windows_n += 1;
}

var visio = GetObject(TAG + "VISIO");
var right_option = GetObject(TAG + "RIGHT_OPT");
if (MouseInsideObject(id) && right_option == "NULL") {
	if (GetObject(TAG + "VISIO") == "NULL" && windows_n > 0 && VISIO_TIME >= 0.5) {
		var Y = y - 30;
		var all_button_box = ["NULL"];
		var f = 0;
		for (var i = 0; ON_MAIN_SCENE.TASKS[WINDOW][3][i] != "NULL"; i++) {
			var obj = ON_MAIN_SCENE.TASKS[WINDOW][3][i];
			if (instance_exists(obj)) {
				all_button_box[f] = CreateButton_Image_Text(x, Y, S_window_option_button, sprite_index, x - 100, Y, Obox, obj.NAME, "TaskBar_Gp1", "TaskBar_Gp2", Arial10, c_black, obj.TAG + "VISIO_BUTTON", [["CENTERED"], ["FADE_IN", 0.00001], "NULL"]);
				all_button_box[f].PARENT = obj;
				all_button_box[f].OBJECT_LINKED.image_xscale = 0.5;
				all_button_box[f].OBJECT_LINKED.image_yscale = 0.5;
				all_button_box[f + 1] = CreateObjectSprite(x + 100, Y, "TaskBar_Gp2", S_window_visio_close, Obox, "BUTTON", obj.TAG + "VISIO_CLOSE", [["FADE_IN", 0.00001], "NULL"])
				all_button_box[f + 1].PARENT = obj;
				all_button_box[f + 1].OTHER_PARENT = all_button_box[f];
				all_button_box[f + 1].VISIO_TAG = TAG + "VISIO";
				f += 2;
				all_button_box[f] = "NULL";
				Y -= 22.5;
			}
		}
		visio = CreateEmptyRound(x - 120, y - 30 - (20 * windows_n) - (2.5 * (windows_n - 1)), c_white, 240, (20 * windows_n) + (2.5 * (windows_n - 1)) + 20, "TaskBar_Gp0", TAG + "VISIO", [["FADE_IN", 0.00001], "NULL"]);
		visio.Y_TARGET = y - 30 - (20 * windows_n) - (2.5 * (windows_n - 1)) - 20;
		visio.PARENT = id;
		visio.COMPONENTS = all_button_box;
	} else if (VISIO_TIME < 0.5)
		VISIO_TIME += delta_time / 1000000;
} else if (visio != "NULL" && ((!MouseInsideObject(id) && !MouseInside(visio.x, visio.x + visio.SIZE_X, visio.y, visio.y + visio.SIZE_Y)) || right_option != "NULL")) {
	if (VISIO_TIME <= 0 || right_option != "NULL")
		visio.CLOSE = true;
	else
		VISIO_TIME -= delta_time / 1000000;
} else if (visio != "NULL" && MouseInside(visio.x, visio.x + visio.SIZE_X, visio.y, visio.y + visio.SIZE_Y))
	VISIO_TIME = 0.5;

var info = GetObject(INFO_NAME);
if (right_option != "NULL") {
	if (right_option.y > right_option.Y_TARGET && !OPT_CLOSING) {
		if (!PIN && ON_MAIN_SCENE.TASKS[WINDOW][3][0] == "NULL") {
			ICON.image_xscale += 0.00001 * delta_time;
			ICON.image_yscale += 0.00001 * delta_time;
		}
		right_option.y -= 0.0001 * delta_time;
		for (var i = 0; WINDOWS_BUTTONS[i] != "NULL"; i++) {
			var object = WINDOWS_BUTTONS[i];
			if (!instance_exists(object))
				continue;
			object.y -= 0.0001 * delta_time;
			object.TEXT_CONNECT.y -= 0.0001 * delta_time;
			object.OBJECT_LINKED.y -= 0.0001 * delta_time;
		}
	} else if (!OPT_CLOSING) {
		var test = Y_BASE;
		for (var i = 0; WINDOWS_BUTTONS[i] != "NULL"; i++) {
			var object = WINDOWS_BUTTONS[i];
			if (!instance_exists(object))
				continue;
			object.y = test;
			object.TEXT_CONNECT.y = test;
			object.OBJECT_LINKED.y = test;
			test -= 22.5;
		}
	}
	if (OPT_CLOSING) {
		right_option.y += 0.0001 * delta_time;
		right_option.image_alpha -= 0.00001 * delta_time;
		for (var i = 0; WINDOWS_BUTTONS[i] != "NULL"; i++) {
			var object = WINDOWS_BUTTONS[i];
			if (!instance_exists(object))
				continue;
			object.y += 0.0001 * delta_time; object.image_alpha -= 0.00001 * delta_time;
			object.TEXT_CONNECT.y += 0.0001 * delta_time;
			object.OBJECT_LINKED.y += 0.0001 * delta_time; object.OBJECT_LINKED.image_alpha -= 0.00001 * delta_time;
		}
		if (right_option.image_alpha <= 0) {
			for (var i = 0; WINDOWS_BUTTONS[i] != "NULL"; i++)
			if (instance_exists(WINDOWS_BUTTONS[i]))
				DestroyButtonBox(WINDOWS_BUTTONS[i].TAG);
			WINDOWS_BUTTONS = ["NULL"];
			DestroyObject(right_option.TAG);
			OPT_CLOSING = false;
			NBAR = 0;
			if (!PIN && ON_MAIN_SCENE.TASKS[WINDOW][3][0] == "NULL") {
				DestroyObject(TAG);
				DestroyObject(ON_TASK.TAG);
			}
		}
	} else if (info != "NULL")
		DestroyRound(INFO_NAME);
}

if (mouse_check_button_pressed(mb_right) && MouseInsideObject(id) && string_count("_TASK_ICON", TAG) >= 1) {
	if (right_option != "NULL")
		DestroyObject(TAG + "RIGHT_OPT");
	
	// CREATE ADD RECREATE BUTTON
	var Y = y - 30;
	Y_BASE = Y - 20;
	for (var i = 0; WINDOWS_BUTTONS[i] != "NULL"; i++)
		if (instance_exists(WINDOWS_BUTTONS[i]))
			DestroyButtonBox(WINDOWS_BUTTONS[i].TAG);
	WINDOWS_BUTTONS = ["NULL"];
	if (windows_n > 0) {
		var close_all = CreateButton_Image_Text(x, Y, S_window_option_button, S_window_option_close, x - 100, Y,  Obox, "Close all windows", "TaskBar_Gp1", "TaskBar_Gp2", Arial10, c_black, TAG + "CLOSE_ALL_WINDOW", [["CENTERED"], ["FADE_IN", 0.00001], "NULL"]); Y -= 22.5;
		close_all.PARENT = id;
		WINDOWS_BUTTONS = addtolist(close_all, WINDOWS_BUTTONS);
	}
	var pin = CreateButton_Image_Text(x, Y, S_window_option_button, S_window_option_pin, x - 100, Y,  Obox, "Pin to taskbar", "TaskBar_Gp1", "TaskBar_Gp2", Arial10, c_black, TAG + "PIN", [["CENTERED"], ["FADE_IN", 0.00001], "NULL"]); Y -= 22.5;
	pin.PARENT = id;
	WINDOWS_BUTTONS = addtolist(pin, WINDOWS_BUTTONS);
	var name = "";
	for (var e = 0; string_char_at(CREATE_WINDOW_NAME, e + 1) != " "; e++)
		name += string_char_at(CREATE_WINDOW_NAME, e + 1);
	var me = CreateButton_Image_Text(x, Y, S_window_option_button, CREATE_WINDOW_ICON, x - 100, Y,  Obox, name, "TaskBar_Gp1", "TaskBar_Gp2", Arial10, c_black, TAG + "WINDOW_ME", [["CENTERED"], ["FADE_IN", 0.00001], "NULL"]); Y -= 22.5;
	me.PARENT = id;
	me.OBJECT_LINKED.image_xscale = 0.5; me.OBJECT_LINKED.image_yscale = 0.5;
	WINDOWS_BUTTONS = addtolist(me, WINDOWS_BUTTONS);
	var nbar = list_n(WINDOWS_BUTTONS);
	right_option = CreateEmptyRound(x - 120, y - 30 - (20 * nbar) - (2.5 * (nbar - 1)), c_white, 240, (20 * nbar) + (2.5 * (nbar - 1)) + 20, "TaskBar_Gp0", TAG + "RIGHT_OPT", [["FADE_IN", 0.00001], "NULL"]);
	right_option.Y_TARGET = y - 30 - (20 * nbar) - (2.5 * (nbar - 1)) - 20;
} else if ((mouse_check_button_pressed(mb_right) || mouse_check_button_pressed(mb_left)) && string_count("_TASK_ICON", TAG) >= 1) {
	if (right_option != "NULL") {
		if (!MouseInside(right_option.bbox_left, right_option.bbox_left + right_option.SIZE_X, right_option.bbox_top, right_option.bbox_top + right_option.SIZE_Y))
			OPT_CLOSING = true;
	}
}
	

if (mouse_check_button_pressed(mb_left) && MouseInsideObject(id) && string_count("_TASK_ICON", TAG) >= 1 && string_count("RIGHT_OPT", TAG) <= 0) {
	var all_open = true;
	var all_closed = true;
	for (var i = 0; ON_MAIN_SCENE.TASKS[WINDOW][3][i] != "NULL"; i++) {
		var obj = ON_MAIN_SCENE.TASKS[WINDOW][3][i];
		all_closed = false;
		if (obj.IS_REDUCE)
			all_open = false;
		if (obj.IS_REDUCE && obj.image_alpha <= 0) {
			obj.FADE_MOVEMENT = false;
			obj.IS_REDUCE = false;
			obj.y = obj.Y_TARGET + 20;
			obj.FADE_IN = true;
		}
	}
	if (all_open) {
		for (var i = 0; ON_MAIN_SCENE.TASKS[WINDOW][3][i] != "NULL"; i++) {
			var obj = ON_MAIN_SCENE.TASKS[WINDOW][3][i];
			if (obj.image_alpha >= 1) {
				obj.REDUCING = true;
				obj.FADE_END = true;
			}
		}
	}
	if (all_closed)
		CreateWindow(CREATE_WINDOW_IMAGE, CREATE_WINDOW_TAG, CREATE_WINDOW_ICON, CREATE_WINDOW_NAME);
	mouse_clear(mb_left);
}