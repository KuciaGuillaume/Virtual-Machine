

function AddTextLink(X, Y, TEXT, FONT, COLOR1, COLOR2, LAYER, TAG, OPTION) {
	var text = AddText(X, Y, TEXT, FONT, COLOR1, LAYER, TAG, OPTION);
	text.LINK_COLOR = COLOR2;
	text.LINK_BTN_TEXT = true;
	text.LINK_FIRST_COLOR = COLOR1;
	return text;
}

