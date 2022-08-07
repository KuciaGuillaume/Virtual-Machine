/////////////////////////////////////
//// GUILLAUME KUCIA  ////
////////////////////////////////////
// SCRIPT TITLE : CreateAdminRequirement


function CreateAdminRequirement(TITLE, MESSAGE_BODY, BUTTON_1 , BUTTON_2 , ICON , TYPE) {
	
	global.Requirement.type = TYPE;
	global.Requirement.state = "RUN";
	
	instance_deactivate_all(false);
	instance_activate_object(ON_MAIN_SCENE);
	instance_activate_object(Ocursor);
	var background = layer_background_get_id(layer_get_id("Backgrounds_1"));
	layer_background_blend(background, #2A2A2A)
	
	// Create BACKGROUND_OF_REQUIREMENT
	CreateEmptyRound(OEmptyRound, 710, 240, c_white, 500, 600, "Gp0", "BACKGROUND_OF_REQUIREMENT", [undefined]);
	
	// CREATE ICON_ALERT_BACKGROUND_OF_REQUIREMENT
	CreateObjectSprite(740, 270, "Gp1", ICON, OJustGUI, "IMAGE", "ICON_ALERT_BACKGROUND_OF_REQUIREMENT", [undefined]);

	// CREATE TITLE_OF_REQUIREMENT
	AddText(1025, 320, TITLE, Segoe15, c_gray, "Gp1", "TITLE_OF_REQUIREMENT", [["CENTERED"], undefined]);
	
	// ADD MESSAGE_BODY_OF_REQUIREMENT
	AddText(740, 420, MESSAGE_BODY, Segoe10, c_gray, "Gp1", "MESSAGE_BODY_OF_REQUIREMENT", [undefined]);
	
	// CREATE BUTTON_1_OF_REQUIEREMENT
	var empt_text = GetEmptText(835, 815, BUTTON_1, Segoe10, c_gray, c_white, "Gp2");
	var BUTTON_1_OF_REQUIEREMENT = CreateEmptyButton(ORequirementEmpty, 835, 815, 250, 50, c_white, #6C63FF, "Gp1", undefined, empt_text, "BUTTON_1_OF_REQUIEREMENT", "EMPT_BUTTON-NO-HAND", [["CENTERED"], undefined]);
	
	// CREATE BUTTON_2_OF_REQUIEREMENT
	var empt_text = GetEmptText(1085, 815, BUTTON_2, Segoe10, c_gray, c_white, "Gp2");
	var BUTTON_2_OF_REQUIEREMENT = CreateEmptyButton(ORequirementEmpty, 1085, 815, 250, 50, c_white, #6C63FF, "Gp1", undefined, empt_text, "BUTTON_2_OF_REQUIEREMENT", "EMPT_BUTTON-NO-HAND", [["CENTERED"], undefined]);
}