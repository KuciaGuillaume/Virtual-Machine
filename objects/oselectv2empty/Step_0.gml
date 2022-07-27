/// @Project by Kucia Guillaume* ///

IMAGE_WIDTH = SIZE_X;
IMAGE_HEIGHT = SIZE_Y;
DevKit(id);


if (PARENT != undefined) {
	x = PARENT.x + REF_X;
	y = PARENT.y + REF_Y;
	if (TEXT_CONNECT != undefined) {
		TEXT_CONNECT.x = x + TEXT_REF_X; TEXT_CONNECT.y = y + TEXT_REF_Y; }
	if (OBJECT_LINKED != undefined) {
		OBJECT_LINKED.x = x + OBJ_REF_X;OBJECT_LINKED.y = y + OBJ_REF_Y; }
	image_alpha = PARENT.image_alpha;
	if (OBJECT_LINKED != undefined)
		OBJECT_LINKED.image_alpha = PARENT.image_alpha;
	if (TEXT_CONNECT != undefined)
		TEXT_CONNECT.image_alpha = PARENT.image_alpha;
}

if (OPEN) {
	for (var i = 0; SELECTS[i] != undefined; i++) {
		
		var check = false;
		if (mouse_check_button_pressed(mb_left) && MouseInsideRound(SELECTS[i].id)) {
			TEXT_CONNECT.TEXT = SELECTS[i].TEXT_CONNECT.TEXT;
			check = true;
		}
		
		if (check) {
			for (var i = 0; SELECTS[i] != undefined; i++)
				DestroyEmptyButton(SELECTS[i].TAG);
			SELECTS = [undefined];
			DestroyObject(TAG + "BOX");
			OPEN = false;
			return
		}
	}
	
	if ((mouse_check_button_pressed(mb_left) && !MouseInsideRound(id)) || KeyPress(vk_anykey)) {
		for (var i = 0; SELECTS[i] != undefined; i++)
			DestroyEmptyButton(SELECTS[i].TAG);
		SELECTS = [undefined];
		DestroyObject(TAG + "BOX");
		OPEN = false;
	}
}

if (mouse_check_button_pressed(mb_left) && MouseInsideRound(id) && !OPEN && ON) {
	var size = array_size(LISTS);
	var height = SIZE_Y * size;
	var sp = 3;
	height += (sp * size) + (sp * 2);
	
	var box = CreateEmptyRound(OEmptyRound, x, (y - (height/2)) + (SIZE_Y/2), COLOR_1, SIZE_X, height, "Notifications_Gp0", TAG + "BOX", [undefined]);
	box.EXT = true;
	box.EXT_COLOR = c_gray;
	OPEN = true;
	
	// Create empty button
	var X = x;
	var Y = (y - (height/2)) + (SIZE_Y/2) + sp;
	for (var i = 0; LISTS[i] != undefined; i++) {
		var empt_linked = undefined;
		var empt_text = GetEmptText(X + (SIZE_X/2), Y + (SIZE_Y/2), LISTS[i], Arial10, c_gray, c_white, "Notifications_Gp2");
	
		var Select = CreateEmptyButton(OEmptyRound, X + (SIZE_X/2), Y + (SIZE_Y/2), SIZE_X - (sp * 2), SIZE_Y, COLOR_1, COLOR_2, "Notifications_Gp1", empt_linked, empt_text, TAG + "SELECT" + LISTS[i] + string(i) , "EMPT_BUTTON-NO-HAND", [["CENTERED"], undefined]);
		SELECTS = addtolist(Select, SELECTS);
		Select.PARENT = id;
		Y += SIZE_Y + sp;
	}
}


