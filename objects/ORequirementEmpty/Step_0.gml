/// @Project by Kucia Guillaume* ///

IMAGE_WIDTH = SIZE_X;
IMAGE_HEIGHT = SIZE_Y;
DevKit(id);


if (PARENT != undefined && AUTO_PLACE) {
	x = PARENT.x + REF_X;
	y = PARENT.y + REF_Y;
	if (TEXT_CONNECT != undefined) {
		TEXT_CONNECT.x = x + TEXT_REF_X; TEXT_CONNECT.y = y + TEXT_REF_Y; }
	if (OBJECT_LINKED != undefined) {
		OBJECT_LINKED.x = x + OBJ_REF_X; OBJECT_LINKED.y = y + OBJ_REF_Y; }
	image_alpha = PARENT.image_alpha;
	if (OBJECT_LINKED != undefined)
		OBJECT_LINKED.image_alpha = PARENT.image_alpha;
	if (TEXT_CONNECT != undefined)
		TEXT_CONNECT.image_alpha = PARENT.image_alpha;
}


// CLICK
if (!mouse_check_button_pressed(mb_left) || !MouseInsideRound(id) || !ON) return;


if (TAG == "BUTTON_2_OF_REQUIEREMENT") {
	
	global.Requirement.state = "FINISH";
	global.Requirement.response = false;
	
	DestroyObject("BACKGROUND_OF_REQUIREMENT");
	DestroyObject("ICON_ALERT_BACKGROUND_OF_REQUIREMENT");
	DestroyText("TITLE_OF_REQUIREMENT");
	DestroyText("MESSAGE_BODY_OF_REQUIREMENT");
	DestroyEmptyButton("BUTTON_1_OF_REQUIEREMENT");
	DestroyEmptyButton("BUTTON_2_OF_REQUIEREMENT");
	instance_activate_all();
}

if (TAG == "BUTTON_1_OF_REQUIEREMENT") {
	
	global.Requirement.state = "FINISH";
	global.Requirement.response = true;
	
	DestroyObject("BACKGROUND_OF_REQUIREMENT");
	DestroyObject("ICON_ALERT_BACKGROUND_OF_REQUIREMENT");
	DestroyText("TITLE_OF_REQUIREMENT");
	DestroyText("MESSAGE_BODY_OF_REQUIREMENT");
	DestroyEmptyButton("BUTTON_1_OF_REQUIEREMENT");
	DestroyEmptyButton("BUTTON_2_OF_REQUIEREMENT");
	instance_activate_all();
}