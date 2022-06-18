
function CreateButtonBox(X, Y, IMAGE, OBJECT, TEXT, LAYER1, LAYER2, FONT, COLOR, TAG, OPTION) {
	
	var btn = CreateObjectSprite(X, Y, LAYER1, IMAGE, OBJECT, "BUTTON", TAG, OPTION);
	btn.TAG = TAG;
	btn.OPTION = OPTION;
	var text = AddText(X, Y, TEXT, FONT, COLOR, LAYER2, TAG, OPTION);
	btn.TEXT_CONNECT = text;
	return btn;
}

function CreateButtonBoxType(X, Y, IMAGE, OBJECT, TEXT, LAYER1, LAYER2, FONT, COLOR, TAG, OPTION, TYPE) {
	
	var btn = CreateObjectSprite(X, Y, LAYER1, IMAGE, OBJECT, TYPE, TAG, OPTION);
	btn.TAG = TAG;
	btn.OPTION = OPTION;
	var text = AddText(X, Y, TEXT, FONT, COLOR, LAYER2, TAG, OPTION);
	btn.TEXT_CONNECT = text;
	return btn;
}

function CreateButtonImage(X, Y, IMAGE1, OBJECT1, LAYER1, LAYER2, IMAGE2, OBJECT2, TAG, OPTION) {
	
	static i = 0;
	var btn = CreateObjectSprite(X, Y, LAYER1, IMAGE1, OBJECT1, "BUTTON", TAG, OPTION);
	btn.TAG = TAG;
	btn.OPTION = OPTION;
	btn.SELF = btn;
	TAG = TAG + "_id_(" + string(i) + ")";
	var image = CreateObjectSprite(X, Y, LAYER2, IMAGE2, OBJECT2, "IMAGE", TAG, OPTION);
	btn.OBJECT_LINKED = image;
	i += 1;
	return btn;
}

function CreateButton_Image_Text(X, Y, IMAGE, IMAGE_LINK, X2, Y2, OBJECT, TEXT, LAYER1, LAYER2, FONT, COLOR, TAG, OPTION)
{
	var btn = CreateObjectSprite(X, Y, LAYER1, IMAGE, OBJECT, "BUTTON-NO-HAND", TAG, OPTION);
	btn.TAG = TAG;
	btn.OPTION = OPTION;
	var text = AddText(X, Y, TEXT, FONT, COLOR, LAYER2, TAG, OPTION);
	btn.TEXT_CONNECT = text;
	btn.OBJECT_LINKED = CreateObjectSprite(X2, Y2, LAYER2, IMAGE_LINK, OJustGUI, "IMAGE", TAG + "icon", OPTION);
	return btn;
}

function DestroyButtonBox(TAG) {
	
	var get = GetObject(TAG);
	if (get != undefined && get.OBJECT_LINKED != undefined)
		DestroyObject(get.OBJECT_LINKED.TAG);
	DestroyObject(TAG);
	DestroyText(TAG);
}

function DestroyButtonImage(TAG) {
	
	var delete_object = GetObject(TAG);
	DestroyObject(delete_object.OBJECT_LINKED.TAG);
	DestroyObject(TAG);
}

