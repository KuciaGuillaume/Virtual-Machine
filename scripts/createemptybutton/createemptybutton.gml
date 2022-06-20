

function CreateEmptyButton(OBJECT, X, Y, SIZE_X, SIZE_Y, COLOR_1, COLOR_2, LAYER, EMPT_LINKED, EMPT_TEXT, TAG, TYPE, OPTION) {
	var opt = addtolist(["TYPE", TYPE], OPTION);
	var button = CreateEmptyRound(OBJECT, X - (SIZE_X/2), Y - (SIZE_Y/2), COLOR_1, SIZE_X, SIZE_Y, LAYER, TAG, opt);
	var auto_class = false;
	for (var i = 0; OPTION[i] != undefined; i++)
		if (OPTION[i][0] == "AUTO_CLASS")
			auto_class = true;
	if (!auto_class) {
		button.OBJECT_LINKED = CreateObjectSprite(EMPT_LINKED.X, EMPT_LINKED.Y, EMPT_LINKED.LAYER, EMPT_LINKED.SPRITE, EMPT_LINKED.OBJECT, EMPT_LINKED.TYPE, TAG + "EMPT_LINKED", OPTION);
		button.TEXT_CONNECT = AddText(EMPT_TEXT.X, EMPT_TEXT.Y, EMPT_TEXT.TEXT, EMPT_TEXT.FONT, EMPT_TEXT.COLOR1, EMPT_TEXT.LAYER, TAG + "EMPT_TEXT", OPTION);
	} else {
		button.OBJECT_LINKED = CreateObjectSprite(X - (SIZE_X/2) + sprite_get_width(EMPT_LINKED.SPRITE), Y, EMPT_LINKED.LAYER, EMPT_LINKED.SPRITE, EMPT_LINKED.OBJECT, EMPT_LINKED.TYPE, TAG + "EMPT_LINKED", OPTION);
		var connect = button.OBJECT_LINKED.bbox_right;
		var center = (button.x + button.SIZE_X) - connect;
		button.TEXT_CONNECT = AddText(button.OBJECT_LINKED.bbox_right + center/2, Y, EMPT_TEXT.TEXT, EMPT_TEXT.FONT, EMPT_TEXT.COLOR1, EMPT_TEXT.LAYER, TAG + "EMPT_TEXT", OPTION);
	}
	button.TYPE = TYPE;
	button.COLOR_1 = COLOR_1;
	button.COLOR_2 = COLOR_2;
	button.TEXT_COLOR_1 = EMPT_TEXT.COLOR1;
	button.TEXT_COLOR_2 = EMPT_TEXT.COLOR2;
	button.OBJ_REF_X = button.OBJECT_LINKED.x - button.x;
	button.OBJ_REF_Y = button.OBJECT_LINKED.y - button.y;
	button.TEXT_REF_X = button.TEXT_CONNECT.x - button.x;
	button.TEXT_REF_Y = button.TEXT_CONNECT.y - button.y;
	return button;
}

function CreateSimpleEmptyButton(OBJECT, X, Y, SIZE_X, SIZE_Y, COLOR_1, COLOR_2, LAYER1, LAYER2, SPRITE, FONT, TEXT, TAG, TYPE, OPTION) {
	var opt = addtolist(["TYPE", TYPE], OPTION)
	var button = CreateEmptyRound(OBJECT, X - (SIZE_X/2), Y - (SIZE_Y/2), COLOR_1, SIZE_X, SIZE_Y, LAYER1, TAG, opt);
	button.OBJECT_LINKED = CreateObjectSprite(X - (SIZE_X/2) + sprite_get_width(SPRITE), Y, LAYER2, SPRITE, OJustGUI, "IMAGE", TAG + "EMPT_LINKED", OPTION);
	var connect = button.OBJECT_LINKED.bbox_right;
	var center = (button.x + button.SIZE_X) - connect;
	button.TEXT_CONNECT = AddText(button.OBJECT_LINKED.bbox_right + center/2, Y, TEXT, FONT, c_black, LAYER2, TAG + "EMPT_TEXT", OPTION);
	button.TYPE = TYPE;
	button.COLOR_1 = COLOR_1;
	button.COLOR_2 = COLOR_2;
	button.TEXT_COLOR_1 = c_black;
	button.TEXT_COLOR_2 = c_black;
	button.OBJ_REF_X = button.OBJECT_LINKED.x - button.x;
	button.OBJ_REF_Y = button.OBJECT_LINKED.y - button.y;
	button.TEXT_REF_X = button.TEXT_CONNECT.x - button.x;
	button.TEXT_REF_Y = button.TEXT_CONNECT.y - button.y;
	return button;
}

function DestroyEmptyButton(TAG) {
	var empty = GetObject(TAG);
	if (empty == undefined || !instance_exists(empty))
		return;
	DestroyText(empty.TEXT_CONNECT.TAG);
	DestroyObject(empty.OBJECT_LINKED.TAG);
	DestroyObject(empty.TAG);
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