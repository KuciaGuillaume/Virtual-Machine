
function CreateSetting(TEXT, IMAGE, LAYER1, LAYER2, TAG, id) {
	
		
		var YREF = 130;
		var X = id.x - 371, Y = id.y + YREF;
		var XREF = (-371);
		var size = array_size(id.all_settings);
		YREF = YREF + (40 * size);
		var empt = GetEmptLinked(X - 98, Y + 2, LAYER2, IMAGE, OJustGUI, "IMAGE");
		var empt_text = GetEmptText(X - 40, Y, TEXT, Segoe10, #5E6668, #5E6668, LAYER2);
		
		var setting = CreateEmptyButton(OSettingEmpty, X, Y, 246, 30, #EFF4FA, #E6EBEF, LAYER1, empt, empt_text, TAG + "SET-ING", "EMPT_BUTTON-NO-HAND", [["BACK", 25], ["SLIDE", 0.0001], ["FADE_IN", 0.000005], undefined]);
		setting.REF_X = XREF;
		setting.REF_Y = YREF;
		setting.PARENT = id;
		id.all_settings = addtolist(setting, id.all_settings);
		id.WINDOW.list_objects = addtolist(setting, id.WINDOW.list_objects);
		return setting;
}