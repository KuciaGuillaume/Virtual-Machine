

function CreateEmptyButton(X, Y, SIZE_X, SIZE_Y, COLOR_1, COLOR_2, LAYER, EMPT_LINKED, EMPT_TEXT, TAG, TYPE, OPTION) {
	var button = CreateEmptyRound(X - (SIZE_X/2), Y - (SIZE_Y/2), COLOR_1, SIZE_X, SIZE_Y, LAYER, TAG, [["TYPE", TYPE], undefined]);
	button.OBJECT_LINKED = CreateObjectSprite(EMPT_LINKED.X, EMPT_LINKED.Y, EMPT_LINKED.LAYER, EMPT_LINKED.SPRITE, EMPT_LINKED.OBJECT, EMPT_LINKED.TYPE, TAG + "EMPT_LINKED", OPTION);
	button.TEXT_CONNECT = AddText(EMPT_TEXT.X, EMPT_TEXT.Y, EMPT_TEXT.TEXT, EMPT_TEXT.FONT, EMPT_TEXT.COLOR1, EMPT_TEXT.LAYER, TAG + "EMPT_TEXT", OPTION);
	button.TYPE = TYPE;
	button.COLOR_1 = COLOR_1;
	button.COLOR_2 = COLOR_2;
	button.TEXT_COLOR_1 = EMPT_TEXT.COLOR1;
	button.TEXT_COLOR_2 = EMPT_TEXT.COLOR2;
	return button;
}

function CreateSimpleEmptyButton(X, Y, SIZE_X, SIZE_Y, COLOR_1, COLOR_2, LAYER1, LAYER2, SPRITE, TEXT, TAG, TYPE, OPTION) {
	var button = CreateEmptyRound(X - (SIZE_X/2), Y - (SIZE_Y/2), COLOR_1, SIZE_X, SIZE_Y, LAYER1, TAG, [["TYPE", TYPE], undefined]);
	button.OBJECT_LINKED = CreateObjectSprite(X - (SIZE_X/2) + SPRITE.sprite_width, Y, LAYER2, SPRITE, OJustGUI, "IMAGE", TAG + "EMPT_LINKED", OPTION);
	button.TEXT_CONNECT = AddText(X, Y, TEXT, Arial10, c_black, LAYER2, TAG + "EMPT_TEXT", OPTION);
	button.TYPE = TYPE;
	button.COLOR_1 = COLOR_1;
	button.COLOR_2 = COLOR_2;
	button.TEXT_COLOR_1 = c_black;
	button.TEXT_COLOR_2 = c_black;
	return button;
}

function GetEmptLinked(EX, EY, ELAYER, ESPRITE, EOBJECT, ETYPE) {
	var struct = {
		X : EX,
		Y : EY,
		LAYER : ELAYER,
		SPRITE : ESPRITE,
		OBJECT : EOBJECT,
		TYPE : ETYPE
	};
	return struct;
}

function GetEmptText(TX, TY, TTEXT, TFONT, TCOLOR1, TCOLOR2, TLAYER) {
	var struct = {
		X : TX,
		Y : TY,
		LAYER : TLAYER,
		TEXT : TTEXT,
		FONT : TFONT,
		COLOR1 : TCOLOR1,
		COLOR2 : TCOLOR2
	};
	return struct;
}