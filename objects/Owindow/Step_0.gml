/// @Project by Kucia Guillaume* ///

if (TAG == undefined)
	return;

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
} else if (ICON.image_xscale > 1) {
	ICON.image_xscale = 1;
	ICON.image_yscale = 1;
}


if (WINDOW_BK != undefined && instance_exists(WINDOW_BK)) {
	WINDOW_BK.x = x + 3;
	WINDOW_BK.y = y + (sprite_height/2) - 6;
	WINDOW_BK.image_alpha = image_alpha;
}
CLOSE.x = bbox_left + 17.5 + 10;
CLOSE.y = y + 3;
REDUCE.x = bbox_left + 42.5 + 10;
REDUCE.y = y + 3;
WINDOW_TOP_ICON.x =  bbox_right - 17.5 - 10;
WINDOW_TOP_ICON.y = y + 3;
WINDOW_TOP_ICON.image_alpha = image_alpha;
TEXT_TITLE.y = y + 3;
TEXT_TITLE.x = x + 10;
CLOSE.image_alpha = image_alpha; REDUCE.image_alpha = image_alpha; TEXT_TITLE.image_alpha = image_alpha;

if (IS_REDUCE)
	return;

FIRST_TAKE = true;

if (FADE_END) { 
	y += 0.0001 * delta_time; 
	image_alpha -= 0.000005 * delta_time;
	if (WINDOW_BK != undefined && instance_exists(WINDOW_BK)) {
		CLOSE.image_alpha = image_alpha;
		WINDOW_BK.image_alpha = image_alpha;
		REDUCE.image_alpha = image_alpha;
	}
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
	for (var i = 0; global.layer_depth[MAIN_LAYER_ID + i] != undefined; i++) {
		global.layer_depth[MAIN_LAYER_ID + i] = global.layer_depth[MAIN_LAYER_ID + (i + 1)];
		if (global.layer_depth[MAIN_LAYER_ID + i] != undefined) {
			var object = global.layer_depth[MAIN_LAYER_ID + i][2];
			object.MAIN_LAYER_ID -= 1;
		}
	}
	// delete bool
	for (var d = 0; CLASS[2][d][0] != ID;) { d++; }
	for (; CLASS[2][d] != undefined; d++)
		CLASS[2][d] = CLASS[2][d + 1];
	for (var i = 0; global.layer_depth[i] != undefined; i++) {
		var actual = global.layer_depth[i][1];
		for (var e = 0; actual[e] != undefined; e++) {
			var get = layer_get_id(actual[e]);
			layer_depth(get, layer_get_depth(get) + 7);
		}
	}
	for (var i = 0; CLASS[3][i] != id;) { i++; }
	for (; CLASS[3][i] != undefined; i++)
		CLASS[3][i] = CLASS[3][i + 1];
	global.last_layer_id += 7;
	if (WINDOW_BK != undefined && instance_exists(WINDOW_BK))
		WINDOW_BK.CLOSE = true;
	CLASS[1] -= 1;
	if (CLASS[1] <= 0) {
		if (!ICON.PIN) {
			visio = GetObject(ICON.TAG + "VISIO");
			if (visio != undefined)
				DestroyObject(visio.TAG);
			remove_findlist(ICON.id, ON_MAIN_SCENE.ICONS);
			DestroyObject(ICON.TAG);
			DestroyObject(ON_OBJECT.TAG);
		}	
		ON_MAIN_SCENE.TASKS[INDEX][4] = 0;
	} else if (ON_MAIN_SCENE.TASKS[INDEX][4] == NUMBER)
		ON_MAIN_SCENE.TASKS[INDEX][4] -= 1;
	DestroyObject(CLOSE.TAG);
	DestroyObject(REDUCE.TAG);
	DestroyObject(WINDOW_TOP_ICON.TAG);
	DestroyText(TEXT_TITLE.TAG);
	ON = false;
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
	ON = false
	Y_TARGET = y - 20;
	y += 3000;
	return;
}

if (mouse_check_button_pressed(mb_left) && !ON_MAIN_SCENE.ON_GUI && (!MouseInsideObject(id) || !MouseInsideObject(WINDOW_BK)))
	ON_THIS_WINDOW = false;
for (var i = 0; ON_MAIN_SCENE.TASKS[i] != undefined; i++) {
	if ( ON_MAIN_SCENE.TASKS[i][0] == WINDOW_TAG)
		CLASS = ON_MAIN_SCENE.TASKS[i];
	for (var e = 0; ON_MAIN_SCENE.TASKS[i][3][e] != undefined; e++) {
		var object = ON_MAIN_SCENE.TASKS[i][3][e];
		var get = layer_get_depth(object.layer);
		
		if ((MouseInsideObject(object) ||(object.WINDOW_BK != undefined && instance_exists(object.WINDOW_BK) && MouseInsideObject(object.WINDOW_BK))) && get < depth)
			FIRST_TAKE = false
		if (mouse_check_button_pressed(mb_left) && !ON_MAIN_SCENE.ON_GUI && (MouseInsideObject(object) || MouseInsideObject(object.WINDOW_BK)) && !ON_THIS_WINDOW) {
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


if (mouse_check_button_pressed(mb_left) && !ON_MAIN_SCENE.ON_GUI && (MouseInsideObject(self) || MouseInsideObject(WINDOW_BK))) {
	for (var i = 0; ON_MAIN_SCENE.TASKS[i] != undefined; i++) {
		for (var g = 0; ON_MAIN_SCENE.TASKS[i][3][g] != undefined; g++) {
			var obj = ON_MAIN_SCENE.TASKS[i][3][g];
			var get = layer_get_depth(obj.layer);
			if (get < depth || ((!MouseInsideObject(obj) && !MouseInsideObject(obj.WINDOW_BK)))) {
				obj.ON_CLASS[1] = false;
			}
		}
	}
}

CAN_TAKE = true;
for (var e = 0; CLASS[2][e] != undefined; e++) {
	if (CLASS[2][e][0] == ID)
		ON_CLASS = CLASS[2][e];
	else if (CLASS[2][e][1] == true)
		CAN_TAKE = false;
}

if (!FIRST_TAKE)
	CAN_TAKE = false;
	
if (ON_MAIN_SCENE.HOME != undefined && MouseInsideObject(ON_MAIN_SCENE.HOME)) {
	CAN_TAKE = false;
	ON = false;
	ON_CLASS[1] = false;
} else {

	if ((mouse_check_button_pressed(mb_left) || mouse_check_button_pressed(mb_right)) && !ON_MAIN_SCENE.ON_GUI && (MouseInsideObject(id) || MouseInsideObject(WINDOW_BK)) && CAN_TAKE) {
		ON = true;
		ON_CLASS[1] = true;
	} else if ((mouse_check_button_pressed(mb_left) || mouse_check_button_pressed(mb_right)) && !ON_MAIN_SCENE.ON_GUI && (!MouseInsideObject(id) && !MouseInsideObject(WINDOW_BK)) || !FIRST_TAKE) {
		ON = false;
		ON_CLASS[1] = false;
	}
}

if (!FIRST_TAKE)
	return;

if (ON && mouse_check_button(mb_left) && !ON_MAIN_SCENE.ON_GUI)
	showmywindow(id, self, depth, MAIN_LAYER_ID);


// MOVE WINDOW
if ((MouseInside(bbox_left, bbox_right, bbox_top, bbox_bottom) || SELECT) && mouse_check_button(mb_left) && !ON_MAIN_SCENE.ON_GUI && CAN_TAKE && ON) {
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
if ((MouseInsideObject(CLOSE) || MouseInsideObject(REDUCE)) && mouse_check_button_pressed(mb_left) && !ON_MAIN_SCENE.ON_GUI && image_alpha >= 1) {
	FADE_END = true;
	if (MouseInsideObject(CLOSE))
		CLOSING = true;
	else
		REDUCING = true;
}

if (WINDOW_BK != undefined && instance_exists(WINDOW_BK)) {
	WINDOW_BK.x = x + 3;
	WINDOW_BK.y = y + (sprite_height/2) - 6;
	WINDOW_BK.image_alpha = image_alpha;
}
CLOSE.x = bbox_left + 17.5 + 10;
CLOSE.y = y + 3;
REDUCE.x = bbox_left + 42.5 + 10;
REDUCE.y = y + 3;
WINDOW_TOP_ICON.x =  bbox_right - 17.5 - 10;
WINDOW_TOP_ICON.y = y + 3;
WINDOW_TOP_ICON.image_alpha = image_alpha;
TEXT_TITLE.y = y + 3;
TEXT_TITLE.x = x + 10;
CLOSE.image_alpha = image_alpha; REDUCE.image_alpha = image_alpha; TEXT_TITLE.image_alpha = image_alpha;