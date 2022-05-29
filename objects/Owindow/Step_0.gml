/// @Project by Kucia Guillaume* ///

if (TAG == "NULL")
	return;
//GET OPTIONS
for (var i = 0; OPTION[i] != "NULL"; i++) {
	if (OPTION[i][0] == "LOCK")
		LOCK = OPTION[i];
	if (OPTION[i][0] == "IMAGE_INDEX")
		OBJECT_LINKED.image_index = OPTION[i][1];
	if (OPTION[i][0] == "FADE_ON") {FADE_ON = true; FADE_ON_POWER = OPTION[i][1]; }
	if (OPTION[i][0] == "FADE_IN" && !FADE_SATE) { 
		FADE_IN = true; FADE_POWER = OPTION[i][1];
		FADE_SATE = true; image_alpha = 0;	
	}
	if (OPTION[i][0] == "INFO") {INFO = true; INFO_NAME = OPTION[i][1]; }
}

if (!FIRST_PASS && !FADE_IN) { FIRST_PASS = true; image_alpha = 2; } 

// FADE_IN

if (FADE_IN && image_alpha < 1)
	image_alpha += FADE_POWER * delta_time;
else
	FADE_IN = false;
	
for (var i = 0; ON_MAIN_SCENE.TASKS[i][0] != WINDOW_TAG;) { i++; }
	CLASS = ON_MAIN_SCENE.TASKS[i];

CAN_TAKE = true;
for (var e = 0; CLASS[2][e] != "NULL"; e++) {
	if (CLASS[2][e][0] == ID)
		ON_CLASS = CLASS[2][e];
	else if (CLASS[2][e][1] == true)
		CAN_TAKE = false;
}
	
if (mouse_check_button(mb_left) && (MouseInsideObject(self) || MouseInsideObject(WINDOW_BK)) && CAN_TAKE) {
	ON = true;
	ON_CLASS[1] = true;
} else if (mouse_check_button(mb_left) && (!MouseInsideObject(self) || !MouseInsideObject(WINDOW_BK))) {
	ON = false;
	ON_CLASS[1] = false;
}

if (ON) {
	for (var i = 0; global.layer_depth[i] != "NULL"; ) { i++; }
	i -= 1;
	if (global.layer_depth[i] != "NULL") {
		var tmp = global.layer_depth[i];
		show_debug_message( global.layer_depth[i]);
		var target = global.layer_depth[i][2];

		var layers = global.layer_depth[i][1];
		layer = layer_get_id(layers[0]);
		WINDOW_BK.layer = layer_get_id(layers[0]);
		CLOSE.layer = layer_get_id(layers[1]);
		REDUCE.layer = layer_get_id(layers[1]);
	
		tmp = global.layer_depth[MAIN_LAYER_ID][1];
		target.layer = layer_get_id(tmp[0]);
		target.WINDOW_BK.layer = layer_get_id(tmp[0]);
		target.CLOSE.layer = layer_get_id(tmp[1]);
		target.REDUCE.layer = layer_get_id(tmp[1]);
		target.MAIN_LAYER_ID = MAIN_LAYER_ID;
		target.ON = false;
	
		global.layer_depth[MAIN_LAYER_ID][2] = global.layer_depth[i][2];
		global.layer_depth[i][2] = self; 
		MAIN_LAYER_ID = i;
	}
}


// MOVE WINDOW
if ((MouseInside(bbox_left, bbox_right, bbox_top, bbox_bottom) || SELECT) && mouse_check_button(mb_left) && CAN_TAKE) {
	if (!MouseInsideObject(CLOSE) && !MouseInsideObject(REDUCE) && !SELECT) {
		SELECT = true;
		X = mouse_x;
		Y = mouse_y;
		BASE_X = x;
		BASE_Y = y;
	} else if (SELECT && !MouseInsideObject(CLOSE) && !MouseInsideObject(REDUCE)) {
		if (mouse_x > X)
			x = BASE_X + (mouse_x - X);
		else if (mouse_x < X)
			x = BASE_X - (X - mouse_x);
		if (mouse_y > Y)
			y = BASE_Y + (mouse_y - Y);
		else if (mouse_y < Y)
			y = BASE_Y - (Y - mouse_y);
	}
} else
	SELECT = false;
	

// FERMETURE DE LA WINDOW
if (MouseInsideObject(CLOSE) && mouse_check_button_pressed(mb_left)) {
	// delete layer index
	for (var i = 0; global.layer_depth[MAIN_LAYER_ID + i] != "NULL"; i++) {
		global.layer_depth[MAIN_LAYER_ID + i] = global.layer_depth[MAIN_LAYER_ID + (i + 1)];
		if (global.layer_depth[MAIN_LAYER_ID + i] != "NULL") {
			var object = global.layer_depth[MAIN_LAYER_ID + i][2];
			object.MAIN_LAYER_ID -= 1;
		}
	}
	// delete bool
	for (var d = 0; CLASS[2][d][0] != ID;) { d++; }
	for (; CLASS[2][d] != "NULL"; d++)
		CLASS[2][d] = CLASS[2][d + 1];
	for (var i = 0; global.layer_depth[i] != "NULL"; i++) {
		var actual = global.layer_depth[i][1];
		for (var e = 0; actual[e] != "NULL"; e++) {
			var get = layer_get_id(actual[e]);
			layer_depth(get, layer_get_depth(get) + 2);
		}
	}
	global.last_layer_id += 2;
	WINDOW_BK.CLOSE = true;
	CLASS[1] -= 1;
	if (CLASS[1] <= 0) {
		DestroyObject(WINDOW_TAG + "TASK_ICON");
		DestroyObject(WINDOW_TAG + "ON_TASK");
	}
	DestroyObject(CLOSE.TAG);
	DestroyObject(REDUCE.TAG);
	DestroyObject(TAG);
	return;
}

var on = false;

for (var t = 0; CLASS[2][t] != "NULL"; t++)
	if (CLASS[2][t][1] == true)
		on = true;
if (on)
	ON_OBJECT.image_index = 1;
else
	ON_OBJECT.image_index = 0;
	

WINDOW_BK.x = x + 3;
WINDOW_BK.y = y + (sprite_height/2) - 6;
CLOSE.x = bbox_left + 17.5 + 10;
CLOSE.y = y + 3;
REDUCE.x = bbox_left + 42.5 + 10;
REDUCE.y = y + 3;

