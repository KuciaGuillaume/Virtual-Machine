
function terminal_buttons(BUTTON, PARENT, TAG) {

	if (MouseInsideObject(BUTTON) && mouse_check_button_pressed(mb_left)) {
		if (TAG == "HELP") terminal_help(PARENT);
			
	}
}

function terminal_help(PARENT) {
	PARENT.system_write.TEXT = PARENT.system_write.TEXT + PARENT.HELP_MESSAGE + "\n";
}
