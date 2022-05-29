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
	
if (y > 240 && !FADE_MOVEMENT)
	y -= 0.0001 * delta_time;
else
	FADE_MOVEMENT = true;

if (ICON.image_xscale < 1 && !FADE_END) {
	ICON.image_xscale += 0.00001 * delta_time;
	ICON.image_yscale += 0.00001 * delta_time;
}

WINDOW_BK.x = x + 3;
WINDOW_BK.y = y + (sprite_height/2) - 6;
CLOSE.x = bbox_left + 17.5 + 10;
CLOSE.y = y + 3;
REDUCE.x = bbox_left + 42.5 + 10;
REDUCE.y = y + 3;

FIRST_TAKE = true;

if (FADE_END) { 
	y += 0.0001 * delta_time; 
	image_alpha -= 0.000005 * delta_time;
	CLOSE.image_alpha = image_alpha;
	WINDOW_BK.image_alpha = image_alpha;
	REDUCE.image_alpha = image_alpha;
	if (ON_OBJECT.image_xscale > 0)
		ON_OBJECT.image_xscale -= 0.000005 * delta_time;
	if (CLASS[1] - 1 <= 0 && ICON.image_xscale > 0) {
		ICON.image_xscale -= 0.000005 * delta_time;
		ICON.image_yscale -= 0.000005 * delta_time;
	}
}

if (mouse_check_button_pressed(mb_left) && (!MouseInsideObject(id) || !MouseInsideObject(WINDOW_BK)))
	ON_THIS_WINDOW = false;
for (var i = 0; ON_MAIN_SCENE.TASKS[i] != "NULL"; i++) {
	if ( ON_MAIN_SCENE.TASKS[i][0] == WINDOW_TAG)
		CLASS = ON_MAIN_SCENE.TASKS[i];
	for (var e = 0; ON_MAIN_SCENE.TASKS[i][3][e] != "NULL"; e++) {
		var object = ON_MAIN_SCENE.TASKS[i][3][e];
		if ((MouseInsideObject(object) || MouseInsideObject(object.WINDOW_BK)) && object.MAIN_LAYER_ID > MAIN_LAYER_ID)
			FIRST_TAKE = false
		if (mouse_check_button_pressed(mb_left) && (MouseInsideObject(object) || MouseInsideObject(object.WINDOW_BK)) && !ON_THIS_WINDOW) {
			ON_THIS_WINDOW = true;
			ON_OBJECT.image_xscale = 0.5;
		}
	}
}

if (ON_THIS_WINDOW && !FADE_END) {
	ON_OBJECT.image_index = 1;
	if (ON_OBJECT.image_xscale < 1)
		ON_OBJECT.image_xscale += 0.000005 * delta_time;
} else if (!FADE_END) {
	if (ON_OBJECT.image_xscale > 0.5 && ON_OBJECT.image_index)
		ON_OBJECT.image_xscale -= 0.000005 * delta_time;
	else {
		ON_OBJECT.image_index = 0;
		ON_OBJECT.image_xscale = 1;
	}
}

if (!FIRST_TAKE)
	return;
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
} else if ((!MouseInsideObject(self) || !MouseInsideObject(WINDOW_BK))) {
	ON = false;
	ON_CLASS[1] = false;
}

if (ON && mouse_check_button(mb_left)) {
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
	
		for (var la = MAIN_LAYER_ID; la != i; la ++) {
			tmp = global.layer_depth[la][1];
			var target = global.layer_depth[la + 1][2];
			target.layer = layer_get_id(tmp[0]);
			target.WINDOW_BK.layer = layer_get_id(tmp[0]);
			target.CLOSE.layer = layer_get_id(tmp[1]);
			target.REDUCE.layer = layer_get_id(tmp[1]);
			target.MAIN_LAYER_ID = MAIN_LAYER_ID;
			target.ON = false;
			global.layer_depth[la][2] = global.layer_depth[la + 1][2];
		}
	
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
if (MouseInsideObject(CLOSE) && mouse_check_button_pressed(mb_left))
	FADE_END = true;

if (image_alpha <= 0 && FADE_END) {
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
	for (var i = 0; CLASS[3][i] != id;) { i++; }
	for (; CLASS[3][i] != "NULL"; i++)
		CLASS[3][i] = CLASS[3][i + 1];
	global.last_layer_id += 2;
	WINDOW_BK.CLOSE = true;
	CLASS[1] -= 1;
	if (CLASS[1] <= 0) {
		DestroyObject(ICON.TAG);
		DestroyObject(WINDOW_TAG + "ON_TASK");
	}
	DestroyObject(CLOSE.TAG);
	DestroyObject(REDUCE.TAG);
	DestroyObject(TAG);
	return;
}	

WINDOW_BK.x = x + 3;
WINDOW_BK.y = y + (sprite_height/2) - 6;
CLOSE.x = bbox_left + 17.5 + 10;
CLOSE.y = y + 3;
REDUCE.x = bbox_left + 42.5 + 10;
REDUCE.y = y + 3;

