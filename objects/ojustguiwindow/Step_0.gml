/// @Project by Kucia Guillaume* ///

if (TAG == "NULL")
	return;
for (var i = 0; OPTION[i] != "NULL"; i++) {
	if (OPTION[i][0] == "FADE_IN" && !FADE_SATE) { 
		FADE_IN = true; FADE_POWER = OPTION[i][1];
		FADE_SATE = true; image_alpha = 0;
	}
	if (OPTION[i][0] == "INDEX_IMAGE")
		image_index = OPTION[i][1];
	if (OPTION[i][0] == "FADE_ON") {FADE_ON = true; FADE_ON_POWER = OPTION[i][1]; }
	if (OPTION[i][0] == "INFO") {INFO = true; INFO_NAME = OPTION[i][1]; }
}

if (!FIRST_PASS && !FADE_IN) {image_alpha = 2; FIRST_PASS = true; } 

// FADE_IN

if (FADE_IN && image_alpha < 1)
	image_alpha += FADE_POWER * delta_time;
else
	FADE_IN = false;

if (CLOSE && string_count("TERMINAL", WINDOW_TAG)) {
	
	// ON CLOSE
	DestroyText(TAG + "TERMINAL_TEXT");
	DestroyWrite(TAG + "TERMINAL_WRITE");
	DestroyText(TAG + "TERMINAL_SYSTEM_PWD");
	DestroyText(TAG + "TERMINAL_SYSTEM_WRITE");
	DestroyButtonBox(TAG + "TERMINAL_HELP");
}

if ((WINDOW != "NULL" && instance_exists(WINDOW)) && !CLOSE) {
	user_enter = GetText(TAG + "TERMINAL_TEXT");
	write_text = GetWrite(TAG + "TERMINAL_WRITE");
	pwd = GetText(TAG + "TERMINAL_SYSTEM_PWD");
	system_write = GetText(TAG + "TERMINAL_SYSTEM_WRITE");
	BTN_HELP = GetObject(TAG + "TERMINAL_HELP");
	if (BTN_HELP != "NULL") BTN_HELP.ON = WINDOW.ON;
	if (string_count("TERMINAL", WINDOW.TAG) && !CREATE) {
		
		// ON CREATE
		addtolist(AddText(x, y, "Je suis une phrase de test", Arial10, c_white, WINDOW.LAYERS[0], TAG + "TERMINAL_TEXT", ["NULL"]), WINDOW.list_objects);
		addtolist(CreateWrite(TAG + "TERMINAL_WRITE", 100, WINDOW.LAYERS[0], ""), WINDOW.list_objects);
		var write_text = GetWrite(TAG + "TERMINAL_WRITE");
		write_text.BAR.x = x;
		addtolist(AddText(x, y, "[ " + global.USER[1] + "/" + PWD[0] + " ]", Arial10, c_white, WINDOW.LAYERS[0], TAG + "TERMINAL_SYSTEM_PWD", ["NULL"]), WINDOW.list_objects);
		addtolist(AddText(x, y, "", Arial10, c_white, WINDOW.LAYERS[0], TAG + "TERMINAL_SYSTEM_WRITE", ["NULL"]), WINDOW.list_objects);
		addtolist(CreateButtonBox(x, y, S_terminal_button, Obox, "Help", WINDOW.LAYERS[0], WINDOW.LAYERS[1], Arial10, c_white, TAG + "TERMINAL_HELP", [["CENTERED"], "NULL"]), WINDOW.list_objects);
		CREATE = true;
		
		
	} else if (string_count("TERMINAL", WINDOW.TAG) && CREATE && (WINDOW.ON || WINDOW.REDUCING || !WINDOW.FADE_MOVEMENT)) {
		
		// ON UPDATE
		
		//BUTTON HELP
		BTN_HELP.x = x + 349; BTN_HELP.y = y + 9; BTN_HELP.TEXT_CONNECT.x = BTN_HELP.x; BTN_HELP.TEXT_CONNECT.y = BTN_HELP.y;
		BTN_HELP.image_alpha = image_alpha;
		terminal_buttons(BTN_HELP, id, "HELP");
		
		PWD = ON_MAIN_SCENE.PATH;
		PWD = go_to_path(PWD, PATH);
		pwd.TEXT = "[ " + global.USER[1] + PATH + " ]";
		system_write.x = x - sprite_width / 2 + 10; system_write.y = y + 30; system_write.image_alpha = image_alpha;
		pwd.x = x - sprite_width / 2 + 10; user_enter.x = x - sprite_width / 2 + 10 + pwd.TEXT_WIDTH + 5;
		user_enter.y = y + (USER_WRITE_POSITION * string_count("\n", system_write.TEXT)) + 30; pwd.y =  y + (USER_WRITE_POSITION * string_count("\n", system_write.TEXT)) + 30;
		user_enter.image_alpha = image_alpha; pwd.image_alpha = image_alpha;
		write_text.BAR.image_alpha = image_alpha;
		user_enter.TEXT = write_text.TEXT_OUTPUT;
		if (mouse_check_button(mb_left))
			write_text.BAR.x = user_enter.x + user_enter.TEXT_WIDTH;
		if (!WINDOW.IS_REDUCE)
			write_text.ON_WRITE = true;
		else
			write_text.ON_WRITE = false;
		if (user_enter.TEXT_HEIGHT > 0)
			write_text.BAR.y = user_enter.y + user_enter.TEXT_HEIGHT/2;
		else
			write_text.BAR.y = user_enter.y + 8;
		UpdateBar(write_text.BAR, user_enter.TEXT_WIDTH, user_enter.x);
		
		// GET COMMAND
		if (KeyPressed(vk_enter) && write_text.ON_WRITE && write_text.TEXT != write_text.INITIAL_TEXT) {
			COMMAND = user_enter.TEXT;
			write_text.TEXT = ["", "NULL"];
			write_text.TEXT_INDEX = 1;
			write_text.TEXT_INDEX_MAX = 1;
			var command_find = false;
			var ARRAY = get_array(COMMAND, " ");
			if (ARRAY[0] == "exit" && ARRAY[1] == "NULL") {
				CLOSE = true;
				WINDOW.FADE_END = true;
				WINDOW.CLOSING = true;
				return;
			}
			if (ARRAY[0] == "help" && ARRAY[1] == "NULL") { system_write.TEXT = system_write.TEXT + HELP_MESSAGE + "\n"; return; }
			if (ARRAY[0] != "NULL") {
				if (terminal_ls(ARRAY, system_write, PWD)) command_find = true;
				if (terminal_clear(ARRAY, system_write)) command_find = true;
				var cd = terminal_cd(ARRAY, system_write, PWD, PATH); PWD = cd[0]; PATH = cd[2]; if (cd[1]) { command_find = true; }
				var mkdir = terminal_mkdir(ARRAY, system_write, PWD, COMMAND, PATH); PWD = mkdir[0]; if (mkdir[1]) { command_find = true; }
				var rm = terminal_rm(ARRAY, system_write, PWD, COMMAND, PATH); PWD = rm[0]; if (rm[1]) { command_find = true; }
				if (!command_find)
					system_write.TEXT = system_write.TEXT + COMMAND + ": command not found.\n";
				} else
					system_write.TEXT = system_write.TEXT + pwd.TEXT + "\n";
				var SAVE_LIST = [global.USER, ON_MAIN_SCENE.PATH, "NULL"];
				savegame_save("USER", SAVE_LIST);
			}
		if (pwd.y + pwd.TEXT_HEIGHT + 30 >= bbox_bottom) {
			var replace = "";
			for (var i = 1; string_char_at(system_write.TEXT, i - 1) != "\n";) { i++; }
			for (; string_char_at(system_write.TEXT, i - 1) == "\n";) { i++; }
			for (; i != string_length(system_write.TEXT); i++)
				replace = replace + string_char_at(system_write.TEXT, i);
			system_write.TEXT = replace + "\n";
		}
		
	} else if (string_count("TERMINAL", WINDOW.TAG) && CREATE && !WINDOW.ON) {
		write_text.ON_WRITE = false;
		system_write.x = x - sprite_width / 2 + 10; system_write.y = y + 30; system_write.image_alpha = image_alpha;
		pwd.x = x - sprite_width / 2 + 10; user_enter.x = x - sprite_width / 2 + 10 + pwd.TEXT_WIDTH + 5;
		user_enter.y = y + (USER_WRITE_POSITION * string_count("\n", system_write.TEXT)) + 30; pwd.y =  y + (USER_WRITE_POSITION * string_count("\n", system_write.TEXT)) + 30;
		user_enter.image_alpha = image_alpha; pwd.image_alpha = image_alpha;
		write_text.BAR.image_alpha = image_alpha;
		user_enter.TEXT = write_text.TEXT_OUTPUT
		BTN_HELP.x = x + 349; BTN_HELP.y = y + 9; BTN_HELP.TEXT_CONNECT.x = BTN_HELP.x; BTN_HELP.TEXT_CONNECT.y = BTN_HELP.y;
		BTN_HELP.image_alpha = image_alpha;
	}
}