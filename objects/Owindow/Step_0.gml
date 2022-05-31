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
	
if (y > Y_TARGET && !FADE_MOVEMENT)
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
TEXT_TITLE.y = y + 3;
TEXT_TITLE.x = x + 10;
CLOSE.image_alpha = image_alpha; REDUCE.image_alpha = image_alpha; TEXT_TITLE.image_alpha = image_alpha;
WINDOW_BK.image_alpha = image_alpha;

if (IS_REDUCE)
	return;

FIRST_TAKE = true;

if (FADE_END) { 
	y += 0.0001 * delta_time; 
	image_alpha -= 0.000005 * delta_time;
	CLOSE.image_alpha = image_alpha;
	WINDOW_BK.image_alpha = image_alpha;
	REDUCE.image_alpha = image_alpha;
	TEXT_TITLE.image_alpha = image_alpha;
	if (ON_OBJECT.image_xscale > 0 && CLOSING && !ICON.PIN)
		ON_OBJECT.image_xscale -= 0.000005 * delta_time;
	if (CLASS[1] - 1 <= 0 && ICON.image_xscale > 0 && CLOSING && !ICON.PIN) {
		ICON.image_xscale -= 0.000005 * delta_time;
		ICON.image_yscale -= 0.000005 * delta_time;
	}
}

// CLOSING
if (image_alpha <= 0 && FADE_END && CLOSING) {
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
			layer_depth(get, layer_get_depth(get) + 7);
		}
	}
	for (var i = 0; CLASS[3][i] != id;) { i++; }
	for (; CLASS[3][i] != "NULL"; i++)
		CLASS[3][i] = CLASS[3][i + 1];
	global.last_layer_id += 7;
	WINDOW_BK.CLOSE = true;
	CLASS[1] -= 1;
	if (CLASS[1] <= 0) {
		if (!ICON.PIN) {
			DestroyObject(ICON.TAG);
			DestroyObject(ON_OBJECT.TAG);
		}	
	}
	DestroyObject(CLOSE.TAG);
	DestroyObject(REDUCE.TAG);
	DestroyObject(TAG);
	ON_MAIN_SCENE.N_WINDOW -= 1;
	return;
} else if (image_alpha <= 0 && FADE_END && REDUCING) {
	IS_REDUCE = true;
	ON_CLASS[1] = false;
	ON_OBJECT.image_index = 0;
	ON_OBJECT.image_xscale = 1;
	REDUCING = false;
	FADE_END = false;
	Y_TARGET = y - 20;
	y += 3000;
	return;
}

if (mouse_check_button_pressed(mb_left) && (!MouseInsideObject(id) || !MouseInsideObject(WINDOW_BK)))
	ON_THIS_WINDOW = false;
for (var i = 0; ON_MAIN_SCENE.TASKS[i] != "NULL"; i++) {
	if ( ON_MAIN_SCENE.TASKS[i][0] == WINDOW_TAG)
		CLASS = ON_MAIN_SCENE.TASKS[i];
	for (var e = 0; ON_MAIN_SCENE.TASKS[i][3][e] != "NULL"; e++) {
		var object = ON_MAIN_SCENE.TASKS[i][3][e];
		var get = layer_get_depth(object.layer);
		
		if ((MouseInsideObject(object) || MouseInsideObject(object.WINDOW_BK)) && get < depth)
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


if (mouse_check_button_pressed(mb_left) && (MouseInsideObject(self) || MouseInsideObject(WINDOW_BK))) {
	for (var i = 0; ON_MAIN_SCENE.TASKS[i] != "NULL"; i++) {
		for (var g = 0; ON_MAIN_SCENE.TASKS[i][3][g] != "NULL"; g++) {
			var obj = ON_MAIN_SCENE.TASKS[i][3][g];
			var get = layer_get_depth(obj.layer);
			if (get < depth || ((!MouseInsideObject(obj) && !MouseInsideObject(obj.WINDOW_BK)))) {
				obj.ON_CLASS[1] = false;
			}
		}
	}
}

CAN_TAKE = true;
for (var e = 0; CLASS[2][e] != "NULL"; e++) {
	if (CLASS[2][e][0] == ID)
		ON_CLASS = CLASS[2][e];
	else if (CLASS[2][e][1] == true)
		CAN_TAKE = false;
}

if (!FIRST_TAKE)
	CAN_TAKE = false;

if (mouse_check_button_pressed(mb_left) && (MouseInsideObject(self) || MouseInsideObject(WINDOW_BK)) && CAN_TAKE) {
	ON = true;
	ON_CLASS[1] = true;
} else if (mouse_check_button_pressed(mb_left) && (!MouseInsideObject(self) && !MouseInsideObject(WINDOW_BK)) || !FIRST_TAKE) {
	ON = false;
	ON_CLASS[1] = false;
}

if (!FIRST_TAKE)
	return;

if (ON && mouse_check_button(mb_left)) {
	var min_depth = 30000;
	var is = 0;
	for (var mac = 0; global.layer_depth[mac] != "NULL"; mac ++) {
		if (global.layer_depth[mac][2] == id || global.layer_depth[mac][2] == self)
			continue;
		var test = layer_get_id(global.layer_depth[mac][1][6]);
		if (layer_get_depth(test) < min_depth) {
			is = mac;
			min_depth = layer_get_depth(test);
		}
	}
	for (var la = 0; global.layer_depth[la] != "NULL" && depth > min_depth; la++) {
		if (global.layer_depth[la][2] == id || global.layer_depth[la][2] == self)
			continue;
		for (var f = 0; global.layer_depth[MAIN_LAYER_ID][1][f] != "NULL"; f++) {
			var get = layer_get_id(global.layer_depth[MAIN_LAYER_ID][1][f]);
			layer_depth(get, layer_get_depth(get) - 7);
		}
		for (var f = 0; global.layer_depth[la][1][f] != "NULL"; f++) {
			var get = layer_get_id(global.layer_depth[la][1][f]);
			layer_depth(get, layer_get_depth(get) + 7);
		}
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
if ((MouseInsideObject(CLOSE) || MouseInsideObject(REDUCE)) && mouse_check_button_pressed(mb_left)) {
	FADE_END = true;
	if (MouseInsideObject(CLOSE))
		CLOSING = true;
	else
		REDUCING = true;
}

WINDOW_BK.x = x + 3;
WINDOW_BK.y = y + (sprite_height/2) - 6;
CLOSE.x = bbox_left + 17.5 + 10;
CLOSE.y = y + 3;
REDUCE.x = bbox_left + 42.5 + 10;
REDUCE.y = y + 3;
TEXT_TITLE.y = y + 3;
TEXT_TITLE.x = x + 10;
CLOSE.image_alpha = image_alpha; REDUCE.image_alpha = image_alpha; TEXT_TITLE.image_alpha = image_alpha;
WINDOW_BK.image_alpha = image_alpha;