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

if (!OPEN) {
	OPEN = true;
}

