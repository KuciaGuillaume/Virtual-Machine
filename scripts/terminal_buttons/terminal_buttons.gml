
function terminal_buttons(BUTTON, PARENT, TAG) {

	if (MouseInsideObject(BUTTON) && mouse_check_button_pressed(mb_left)) {
		if (TAG == "HELP") terminal_help(PARENT);
		if (TAG == "HISTORY") terminal_history(PARENT);
		if (TAG == "CLEAR") terminal_btn_clear(PARENT);
			
	}
}

function terminal_help(PARENT) {
	PARENT.system_write.TEXT = PARENT.system_write.TEXT + PARENT.HELP_MESSAGE + "\n";
}

function terminal_btn_clear(PARENT) {
	PARENT.system_write.TEXT = "";
}

function terminal_saving(PARENT) {
	var saving = GetObject(PARENT.TAG + "SAVING");
	if (saving == "NULL") {
		saving = CreateObjectSprite(PARENT.x, PARENT.y, PARENT.WINDOW.LAYERS[0], Sstart_load, OJustGUI, "IMAGE", PARENT.TAG + "SAVING", ["NULL"]);
		saving.image_xscale = 0.3;
		saving.image_yscale = 0.3;
	}
}