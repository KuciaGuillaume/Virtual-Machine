/////////////////////////////////////
//// GUILLAUME KUCIA  ////
////////////////////////////////////
// SCRIPT TITLE : CHECKER


function CreateChecker(X, Y, STATE, LAYER1, LAYER2, LAYER3,  TAG, OPTION) {

	var bar_1 = CreateObjectSprite(X, Y, LAYER1, S_checker_bar_1, OJustGUI, "IMAGE", TAG, OPTION);
	var bar_2 = CreateObjectSprite(X - (bar_1.sprite_width/2), Y - (bar_1.sprite_height/2), LAYER2, S_checker_bar_2, OJustGUI, "IMAGE", TAG + "CHECKER_BAR_2", OPTION);
	var selector = CreateObjectSprite(X, Y, LAYER3, S_checker_selector, OChecker, "CHECKER", TAG + "CHECKER_SELECTOR", OPTION);
	
	bar_2.PARENT = selector;
	selector.OBJECT_LINKED = bar_1;
	selector.STATE = STATE;
	
	bar_2.SET_DISPLAY_LEFT = true;
	bar_2.IMAGE_HEIGHT = bar_2.sprite_height;
	bar_2.IMAGE_TOP = 0;
	bar_2.IMAGE_LEFT = 0;
	
	selector.CHECKER_STATE = STATE;
	
	if (STATE == true) {
		selector.x += (bar_1.sprite_width/2);
		selector.image_index = 1;
		bar_2.IMAGE_WIDTH = bar_2.sprite_width;
	} else {
		selector.x -= (bar_1.sprite_width/2);
		bar_2.IMAGE_WIDTH = 0;
	}
	return [bar_1, bar_2, selector];
}