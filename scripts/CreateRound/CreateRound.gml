
function CreateRound(OBJECT_TAG, TEXT_NAME, FONT, LAYER1, LAYER2, COLOR, MARGE, OPTION) {
	
	var my = GetObject(OBJECT_TAG);
	
	if (my == undefined || my.TAG != OBJECT_TAG)
		return undefined;
	var roundRect = GetObject(TEXT_NAME + OBJECT_TAG);
	if (roundRect != undefined) {
		var TEXT = roundRect.TEXT_CONNECT;
		var X = (my.x - (string_width(TEXT.TEXT) / 2)) - MARGE;
		var Y = ((my.y - 25 - (string_height(TEXT_NAME)/2)) - (string_height(TEXT.TEXT) / 2)) - (MARGE / 2);
		roundRect.x = X;
		roundRect.y = Y;
		TEXT.x = my.x;
		TEXT.y = my.y - 25 - string_height(TEXT_NAME)/2;
		roundRect.BBOX_X = (X + TEXT.TEXT_WIDTH) + MARGE;
		roundRect.BBOX_Y = (Y + TEXT.TEXT_HEIGHT) + MARGE;
		roundRect.COLOR = COLOR;
		roundRect.MARGE = MARGE;
		return roundRect;
	}
	var TEXT = AddText(my.x, my.y - 25 - string_height(TEXT_NAME)/2, TEXT_NAME, FONT, c_white, LAYER2, TEXT_NAME + OBJECT_TAG, OPTION);
	var X = (TEXT.x - (string_width(TEXT.TEXT) / 2)) - MARGE;
	var Y = (TEXT.y - (string_height(TEXT.TEXT) / 2)) - (MARGE / 2);
	var roundRect = CreateObjects(X, Y, LAYER1, Osimple_round, "ROUND", TEXT_NAME + OBJECT_TAG, OPTION);
	roundRect.image_alpha = 0;
	TEXT.image_alpha = 0;
	roundRect.BBOX_X = (X + TEXT.TEXT_WIDTH) + MARGE;
	roundRect.BBOX_Y = (Y + TEXT.TEXT_HEIGHT) + MARGE;
	roundRect.COLOR = COLOR;
	roundRect.TEXT_CONNECT = TEXT;
	roundRect.MARGE = MARGE;
	return roundRect;
}

function CreateEmptyRound(OBJECT, X, Y, COLOR, SIZE_X, SIZE_Y, LAYER, TAG, OPTION) {
	var rounded = GetObject(TAG);
	if (rounded != undefined) {
		rounded.x = X; rounded.y = Y;
		rounded.COLOR = COLOR;
		rounded.SIZE_X = SIZE_X;
		rounded.SIZE_Y = SIZE_Y;
		rounded.image_alpha = 0;
		rounded.FIRST_PASS = false;
		for (var i = 0; OPTION[i] != undefined; i++)
			if (is_array(OPTION[i]) && OPTION[i][0] == "FADE_IN")
				rounded.FADE_IN = true;
		return rounded;
	}
	var type = "IMAGE";
	for (var i = 0; OPTION[i] != undefined; i++) {
		if (OPTION[i][0] == "TYPE")
			type = OPTION[i][1];
	}
	rounded = CreateObjects(X, Y, LAYER, OBJECT, type, TAG, OPTION);
	rounded.COLOR = COLOR;
	rounded.SIZE_X = SIZE_X;
	rounded.SIZE_Y = SIZE_Y;
	return rounded;
}

function CreateEmptyRoundButton(OBJECT, X, Y, COLOR, BUTTONS, SEP, LAYER, TAG, OPTION) {
	
	// SIZE_X AND SIZE_Y
	var SIZE_X = 0, SIZE_Y = 0;
	SIZE_X = SEP + BUTTONS[0].SIZE_X + SEP;
	for (var i = 0; BUTTONS[i] != undefined; i++) {
		SIZE_Y += SEP;
		SIZE_Y += BUTTONS[i].SIZE_Y;
	} SIZE_Y += SEP;
	for (var inc = 0, i = 0; BUTTONS[i] != undefined; i++) {
		inc += SEP;
		inc += BUTTONS[i].SIZE_Y;
		BUTTONS[i].x = X - (BUTTONS[i].SIZE_X/2);
		BUTTONS[i].y = Y - SIZE_Y + (inc - BUTTONS[i].SIZE_Y);
		if (BUTTONS[i].OBJECT_LINKED != undefined) {
			BUTTONS[i].OBJECT_LINKED.x = BUTTONS[i].x + BUTTONS[i].OBJ_REF_X;
			BUTTONS[i].OBJECT_LINKED.y = BUTTONS[i].y + BUTTONS[i].OBJ_REF_Y;
			BUTTONS[i].TEXT_CONNECT.x = BUTTONS[i].x + BUTTONS[i].TEXT_REF_X;
			BUTTONS[i].TEXT_CONNECT.y = BUTTONS[i].y + BUTTONS[i].TEXT_REF_Y;
		}
	}
	var rounded = GetObject(TAG);
	if (rounded != undefined) {
		rounded.BUTTONS = BUTTONS;
		rounded.x = X - (SIZE_X/2); rounded.y = Y - SIZE_Y;
		rounded.COLOR = COLOR;
		rounded.SIZE_X = SIZE_X;
		rounded.SIZE_Y = SIZE_Y;
		rounded.image_alpha = 0;
		rounded.FIRST_PASS = false;
		for (var i = 0; OPTION[i] != undefined; i++)
			if (is_array(OPTION[i]) && OPTION[i][0] == "FADE_IN")
				rounded.FADE_IN = true;
		return rounded;
	}
	var type = "IMAGE";
	for (var i = 0; OPTION[i] != undefined; i++) {
		if (OPTION[i][0] == "TYPE")
			type = OPTION[i][1];
	}
	rounded = CreateObjects(X - (SIZE_X/2), Y - SIZE_Y, LAYER, OBJECT, type, TAG, OPTION);
	rounded.BUTTONS = BUTTONS;
	rounded.COLOR = COLOR;
	rounded.SIZE_X = SIZE_X;
	rounded.SIZE_Y = SIZE_Y;
	return rounded;
}

function DestroyRound(TEXT_NAME) {
	DestroyObject(TEXT_NAME);
	DestroyText(TEXT_NAME);
}
