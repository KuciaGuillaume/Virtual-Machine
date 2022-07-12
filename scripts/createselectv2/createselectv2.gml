/////////////////////////////////////
//// GUILLAUME KUCIA  ////
////////////////////////////////////
// SCRIPT TITLE : SelectV2


function CreateSelectV2(X, Y, X_SIZE, Y_SIZE, LAYER1, LAYER2, INDEX_FIRST, LISTS, TAG, OPTION) {
	
	var empt_text = GetEmptText(X, Y, LISTS[INDEX_FIRST], Arial10, c_gray, c_white, LAYER2);

	var SelectV2 = CreateEmptyButton(OSelectV2Empty, X, Y, X_SIZE, Y_SIZE, #FBFCFE, #0079FF, LAYER1, undefined, empt_text, TAG + "SELECTV2", "EMPT_BUTTON-NO-HAND", [["CENTERED"], undefined]);
	SelectV2.LISTS = LISTS;
	SelectV2.SIZE_X = X_SIZE;
	SelectV2.SIZE_Y = Y_SIZE;
	
	return SelectV2;
}