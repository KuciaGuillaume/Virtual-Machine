


function CreateTextButton(X, Y, IMAGE, TEXT, LAYER1, LAYER2, COLOR, FONT, SIZE, NAME, OPTION) {
	
	var write = CreateWrite(NAME, SIZE, LAYER2, TEXT);
	var obj = CreateObjects(X, Y, LAYER1, Otext_button, "TEXT_BUTTON", NAME, OPTION);
	write.ON_WRITE = false;
	obj.sprite_index = IMAGE;
	obj.COLOR = COLOR;
	obj.FONT = FONT;
	obj.NAME = NAME;
	obj.OPTION = OPTION;
	write.BAR.x = X;
	write.BAR.y = Y;
	obj.write = write;
	return obj;
}


function DestroyTextButton(TAG) {
	
	DestroyWrite(TAG);
	DestroyObject(TAG);
}

