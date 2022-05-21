/// @Project by Kucia Guillaume* ///

//GET OPTIONS
for (var i = 0; OPTION[i] != "NULL"; i++) {
	if (OPTION[i][0] == "LOCK")
		LOCK = OPTION[i];
	if (OPTION[i][0] == "IMAGE_INDEX")
		OBJECT_LINKED.image_index = OPTION[i][1];
}

// ICON BUTTON
if (global.USER[6][0] == OBJECT_LINKED.sprite_index && global.USER[6][1] == OBJECT_LINKED.image_index) { image_index = 2; }
else if (image_index == 2) { image_index = 0; LOCK_STATE = true; }

// LOCK BUTTON
if ((LOCK[0] != "NULL" && !LOCK[1].LOCK_STATE)) {
	image_index = 2;
	return;
} else if (image_index == 2) { image_index = 0; }

if (mouse_x < bbox_left || mouse_x > bbox_right)
	return;
if (mouse_y < bbox_top || mouse_y > bbox_bottom)
	return;
	
if (!mouse_check_button_pressed(mb_left))
	return;

if (TAG == "EDIT_ICON_1" || TAG == "EDIT_ICON_2" || TAG == "EDIT_ICON_3" || TAG == "EDIT_ICON_4" ||
	 TAG == "EDIT_ICON_5" || TAG == "EDIT_ICON_6" || TAG == "EDIT_ICON_7" || TAG == "EDIT_ICON_8")
{
	LOCK[0] = "LOCK";
	LOCK[1] = SELF;
	LOCK_STATE = false;
	global.USER[6][0] = OBJECT_LINKED.sprite_index;
	global.USER[6][1] = OBJECT_LINKED.image_index;
}

