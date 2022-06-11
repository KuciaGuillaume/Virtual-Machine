/// @Project by Kucia Guillaume* ///

if (TAG == undefined)
	return;

if (!FIRST_PASS && !FADE_IN) {image_alpha = 2; FIRST_PASS = true; } 

// FADE_IN

if (FADE_IN && image_alpha < 1)
	image_alpha += FADE_POWER * delta_time;
else
	FADE_IN = false;

if (!PIN && ON_MAIN_SCENE.TASKS[WINDOW][3][0] == undefined)
	OPT_CLOSING = true;

var windows_n = 0;
for (var i = 0; ON_MAIN_SCENE.TASKS[WINDOW][3][i] != undefined; i++) {
	var obj = ON_MAIN_SCENE.TASKS[WINDOW][3][i];
	if (instance_exists(obj))
		windows_n += 1;
}

// ICONS POSITIOB
for (var i = 0; ON_MAIN_SCENE.ICONS[i] != id; ) { i++ };

if (i != 0 && instance_exists(ON_MAIN_SCENE.ICONS[i - 1])) {
	var diff = x - ON_MAIN_SCENE.ICONS[i - 1].x;
	if (diff <= 0 || diff < 50)
		x += 0.0001 * delta_time;
} else if (i == 0 && x != ON_MAIN_SCENE.TASKBAR.x && ON_MAIN_SCENE.ICONS[i + 1] == undefined) {
	if (x > ON_MAIN_SCENE.TASKBAR.x)
		x -= (0.0001 * delta_time) * ((x - ON_MAIN_SCENE.TASKBAR.x) / 10);
	else if (x < ON_MAIN_SCENE.TASKBAR.x)
		x += (0.0001 * delta_time) * ((ON_MAIN_SCENE.TASKBAR.x - x) / 10);
}

if (ON_MAIN_SCENE.ICONS[i + 1] != undefined && instance_exists(ON_MAIN_SCENE.ICONS[i + 1])) {
var diff = ON_MAIN_SCENE.ICONS[i + 1].x - x;
	if (diff <= 0 || diff < 50)
		x -= 0.0001 * delta_time;
}

if (ON_TASK != undefined)
	ON_TASK.x = x;

var visio = GetObject(TAG + "VISIO");
var right_option = GetObject(TAG + "RIGHT_OPT");
if (MouseInsideObject(id) && right_option == undefined) {
	if (GetObject(TAG + "VISIO") == undefined && windows_n > 0 && VISIO_TIME >= 0.5) {
		var Y = y - 30;
		var all_button_box = [undefined];
		var f = 0;
		for (var i = 0; ON_MAIN_SCENE.TASKS[WINDOW][3][i] != undefined; i++) {
			var obj = ON_MAIN_SCENE.TASKS[WINDOW][3][i];
			if (instance_exists(obj)) {
				all_button_box[f] = CreateButton_Image_Text(x, Y, S_window_option_button, sprite_index, x - 100, Y, Obox, obj.NAME, "TaskBar_Gp1", "TaskBar_Gp2", Arial10, c_black, obj.TAG + "VISIO_BUTTON", [["CENTERED"], ["FADE_IN", 0.00001], undefined]);
				all_button_box[f].PARENT = obj;
				all_button_box[f].OBJECT_LINKED.image_xscale = 0.5;
				all_button_box[f].OBJECT_LINKED.image_yscale = 0.5;
				all_button_box[f + 1] = CreateObjectSprite(x + 100, Y, "TaskBar_Gp2", S_window_visio_close, Obox, "BUTTON", obj.TAG + "VISIO_CLOSE", [["FADE_IN", 0.00001], undefined])
				all_button_box[f + 1].PARENT = obj;
				all_button_box[f + 1].OTHER_PARENT = all_button_box[f];
				all_button_box[f + 1].VISIO_TAG = TAG + "VISIO";
				f += 2;
				all_button_box[f] = undefined;
				Y -= 22.5;
			}
		}
		visio = CreateEmptyRound(x - 120, y - 30 - (20 * windows_n) - (2.5 * (windows_n - 1)), c_white, 240, (20 * windows_n) + (2.5 * (windows_n - 1)) + 20, "TaskBar_Gp0", TAG + "VISIO", [["FADE_IN", 0.00001], undefined]);
		visio.Y_TARGET = y - 30 - (20 * windows_n) - (2.5 * (windows_n - 1)) - 20;
		visio.PARENT = id;
		visio.COMPONENTS = all_button_box;
	} else if (VISIO_TIME < 0.5)
		VISIO_TIME += delta_time / 1000000;
} else if (visio != undefined && ((!MouseInsideObject(id) && !MouseInside(visio.x, visio.x + visio.SIZE_X, visio.y, visio.y + visio.SIZE_Y)) || right_option != undefined)) {
	if (VISIO_TIME <= 0 || right_option != undefined)
		visio.CLOSE = true;
	else
		VISIO_TIME -= delta_time / 1000000;
} else if (visio != undefined && MouseInside(visio.x, visio.x + visio.SIZE_X, visio.y, visio.y + visio.SIZE_Y))
	VISIO_TIME = 0.5;

var info = GetObject(INFO_NAME);
if (right_option != undefined) {
	if (right_option.y > right_option.Y_TARGET && !OPT_CLOSING) {
		if (!PIN && ON_MAIN_SCENE.TASKS[WINDOW][3][0] == undefined) {
			ICON.image_xscale += 0.00001 * delta_time;
			ICON.image_yscale += 0.00001 * delta_time;
		}
		right_option.y -= 0.0001 * delta_time;
		for (var i = 0; WINDOWS_BUTTONS[i] != undefined; i++) {
			var object = WINDOWS_BUTTONS[i];
			if (!instance_exists(object))
				continue;
			object.y -= 0.0001 * delta_time;
			object.TEXT_CONNECT.y -= 0.0001 * delta_time;
			object.OBJECT_LINKED.y -= 0.0001 * delta_time;
		}
	} else if (!OPT_CLOSING) {
		var test = Y_BASE;
		for (var i = 0; WINDOWS_BUTTONS[i] != undefined; i++) {
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
		for (var i = 0; WINDOWS_BUTTONS[i] != undefined; i++) {
			var object = WINDOWS_BUTTONS[i];
			if (!instance_exists(object))
				continue;
			object.y += 0.0001 * delta_time; object.image_alpha -= 0.00001 * delta_time;
			object.TEXT_CONNECT.y += 0.0001 * delta_time;
			object.OBJECT_LINKED.y += 0.0001 * delta_time; object.OBJECT_LINKED.image_alpha -= 0.00001 * delta_time;
		}
		if (right_option.image_alpha <= 0) {
			for (var i = 0; WINDOWS_BUTTONS[i] != undefined; i++)
			if (instance_exists(WINDOWS_BUTTONS[i]))
				DestroyButtonBox(WINDOWS_BUTTONS[i].TAG);
			WINDOWS_BUTTONS = [undefined];
			DestroyObject(right_option.TAG);
			OPT_CLOSING = false;
			NBAR = 0;
			if (!PIN && ON_MAIN_SCENE.TASKS[WINDOW][3][0] == undefined) {
				remove_findlist(id, ON_MAIN_SCENE.ICONS);
				DestroyObject(TAG);
				if (ON_TASK != undefined)
					DestroyObject(ON_TASK.TAG);
			}
		}
	} else if (info != undefined)
		DestroyRound(INFO_NAME);
}

if (mouse_check_button_pressed(mb_right) && MouseInsideObject(id) && string_count("_TASK_ICON", TAG) >= 1) {
	setforfolders(ON_MAIN_SCENE.FOLDERS, false);
	ON_MAIN_SCENE.ON_DESK = false;
	if (right_option != undefined)
		DestroyObject(TAG + "RIGHT_OPT");
	
	// CREATE ADD RECREATE BUTTON
	var Y = y - 30;
	Y_BASE = Y - 20;
	for (var i = 0; WINDOWS_BUTTONS[i] != undefined; i++)
		if (instance_exists(WINDOWS_BUTTONS[i]))
			DestroyButtonBox(WINDOWS_BUTTONS[i].TAG);
	WINDOWS_BUTTONS = [undefined];
	if (windows_n > 0) {
		var close_all = CreateButton_Image_Text(x, Y, S_window_option_button, S_window_option_close, x - 100, Y,  Obox, "Close all windows", "TaskBar_Gp1", "TaskBar_Gp2", Arial10, c_black, TAG + "CLOSE_ALL_WINDOW", [["CENTERED"], ["FADE_IN", 0.00001], undefined]); Y -= 22.5;
		close_all.PARENT = id;
		WINDOWS_BUTTONS = addtolist(close_all, WINDOWS_BUTTONS);
	}
	var pin = CreateButton_Image_Text(x, Y, S_window_option_button, S_window_option_pin, x - 100, Y,  Obox, "Pin to taskbar", "TaskBar_Gp1", "TaskBar_Gp2", Arial10, c_black, TAG + "PIN", [["CENTERED"], ["FADE_IN", 0.00001], undefined]); Y -= 22.5;
	pin.PARENT = id;
	WINDOWS_BUTTONS = addtolist(pin, WINDOWS_BUTTONS);
	var name = "";
	for (var e = 0; string_char_at(CREATE_WINDOW_NAME, e + 1) != " "; e++)
		name += string_char_at(CREATE_WINDOW_NAME, e + 1);
	var me = CreateButton_Image_Text(x, Y, S_window_option_button, CREATE_WINDOW_ICON, x - 100, Y,  Obox, name, "TaskBar_Gp1", "TaskBar_Gp2", Arial10, c_black, TAG + "WINDOW_ME", [["CENTERED"], ["FADE_IN", 0.00001], undefined]); Y -= 22.5;
	me.PARENT = id;
	me.OBJECT_LINKED.image_xscale = 0.5; me.OBJECT_LINKED.image_yscale = 0.5;
	WINDOWS_BUTTONS = addtolist(me, WINDOWS_BUTTONS);
	var nbar = list_n(WINDOWS_BUTTONS);
	right_option = CreateEmptyRound(x - 120, y - 30 - (20 * nbar) - (2.5 * (nbar - 1)), c_white, 240, (20 * nbar) + (2.5 * (nbar - 1)) + 20, "TaskBar_Gp0", TAG + "RIGHT_OPT", [["FADE_IN", 0.00001], undefined]);
	right_option.Y_TARGET = y - 30 - (20 * nbar) - (2.5 * (nbar - 1)) - 20;
} else if ((mouse_check_button_pressed(mb_right) || mouse_check_button_pressed(mb_left)) && string_count("_TASK_ICON", TAG) >= 1) {
	if (right_option != undefined) {
		if (!MouseInside(right_option.bbox_left, right_option.bbox_left + right_option.SIZE_X, right_option.bbox_top, right_option.bbox_top + right_option.SIZE_Y))
			OPT_CLOSING = true;
	}
}
	

if (mouse_check_button_pressed(mb_left) && MouseInsideObject(id) && string_count("_TASK_ICON", TAG) >= 1 && string_count("RIGHT_OPT", TAG) <= 0) {
	var all_open = true;
	var all_closed = true;
	for (var i = 0; ON_MAIN_SCENE.TASKS[WINDOW][3][i] != undefined; i++) {
		var obj = ON_MAIN_SCENE.TASKS[WINDOW][3][i];
		all_closed = false;
		if (obj.IS_REDUCE)
			all_open = false;
		if (obj.IS_REDUCE) {
			obj.FADE_MOVEMENT = false;
			obj.IS_REDUCE = false;
			obj.y = obj.Y_TARGET + 20;
			obj.FADE_END = false;
			obj.FADE_IN = true;
			obj.ON = false;
			obj.FIRST_TAKE = false;
			obj.CAN_TAKE = false;
		}
	}
	if (all_open) {
		for (var i = 0; ON_MAIN_SCENE.TASKS[WINDOW][3][i] != undefined; i++) {
			var obj = ON_MAIN_SCENE.TASKS[WINDOW][3][i];
			if (!obj.IS_REDUCE) {
				obj.REDUCING = true;
				obj.FADE_END = true;
			}
		}
	}
	if (all_closed)
		CreateWindow(CREATE_WINDOW_IMAGE,  CREATE_WINDOW_OBJECT, CREATE_WINDOW_TAG, CREATE_WINDOW_ICON, CREATE_WINDOW_NAME);
	setforfolders(ON_MAIN_SCENE.FOLDERS, false);
	ON_MAIN_SCENE.ON_DESK = false;
	mouse_clear(mb_left);
}