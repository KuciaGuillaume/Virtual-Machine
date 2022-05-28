

function CreateWindow(WINDOW_BK, TAG, LAYER) {
	
	var UP_LAYER = string(string_char_at(LAYER, 1)) + string(string_char_at(LAYER, 2)) + string((CharToNum(string_char_at(LAYER, 3)) + 1));
	var window = CreateObjectSprite(960, 240, LAYER, Swindow_top, Owindow, "TOP_WINDOW", TAG, ["NULL"]);
	window.WINDOW_BK = CreateObjectSprite(960, window.y + (window.sprite_height/2), LAYER, WINDOW_BK, OJustGUI, "WINDOW_BK", TAG + "_BK", ["NULL"]);
	window.CLOSE = CreateObjectSprite(window.bbox_left + 17.5, window.y, UP_LAYER, Swindow_close, Obox, "BUTTON-NO-HAND", TAG + "CLOSE", ["NULL"]);
	window.REDUCE = CreateObjectSprite(window.bbox_left + 42.5, window.y, UP_LAYER, Swindow_reduce, Obox, "BUTTON-NO-HAND", TAG + "CLOSE", ["NULL"]);
}