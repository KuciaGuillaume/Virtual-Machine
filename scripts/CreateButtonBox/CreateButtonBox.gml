
function CreateButtonBox(X, Y, IMAGE, OBJECT, TEXT, LAYER1, LAYER2, FONT, COLOR, TAG, OPTION) {
	
	var btn = CreateObjectSprite(X, Y, LAYER1, IMAGE, OBJECT, "BUTTON", TAG, OPTION);
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

function DestroyButtonBox(TAG) {
	
	DestroyObject(TAG);
	DestroyText(TAG);
}

function DestroyButtonImage(TAG) {
	
	var delete_object = GetObject(TAG);
	DestroyObject(delete_object.OBJECT_LINKED.TAG);
	DestroyObject(TAG);
}

