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

if (CLOSE && instance_exists(WINDOW) && string_count("TERMINAL", WINDOW.TAG)) {
	
	// ON CLOSE
	DestroyText(TAG + "TERMINAL_TEXT");
	DestroyWrite(TAG + "TERMINAL_WRITE");
	DestroyText(TAG + "TERMINAL_SYSTEM_PWD");
	DestroyText(TAG + "TERMINAL_SYSTEM_WRITE");
}

if ((WINDOW != "NULL" && instance_exists(WINDOW)) && !CLOSE) {
	var user_enter = GetText(TAG + "TERMINAL_TEXT");
	var write_text = GetWrite(TAG + "TERMINAL_WRITE");
	var pwd = GetText(TAG + "TERMINAL_SYSTEM_PWD");
	var system_write = GetText(TAG + "TERMINAL_SYSTEM_WRITE");
	if (string_count("TERMINAL", WINDOW.TAG) && !CREATE) {
		
		// ON CREATE
		addtolist(AddText(x, y, "Je suis une phrase de test", Arial10, c_white, WINDOW.LAYERS[0], TAG + "TERMINAL_TEXT", ["NULL"]), WINDOW.list_objects);
		addtolist(CreateWrite(TAG + "TERMINAL_WRITE", 150, WINDOW.LAYERS[0], "Write here..."), WINDOW.list_objects);
		addtolist(AddText(x, y, PWD_DISPLAY, Arial10, c_white, WINDOW.LAYERS[0], TAG + "TERMINAL_SYSTEM_PWD", ["NULL"]), WINDOW.list_objects);
		addtolist(AddText(x, y, "", Arial10, c_white, WINDOW.LAYERS[0], TAG + "TERMINAL_SYSTEM_WRITE", ["NULL"]), WINDOW.list_objects);
		CREATE = true;
		
		
	} else if (string_count("TERMINAL", WINDOW.TAG) && CREATE && (WINDOW.ON || WINDOW.REDUCING || !WINDOW.FADE_MOVEMENT)) {
		
		// ON UPDATE
		system_write.x = x - sprite_width / 2 + 10; system_write.y = y + 10; system_write.image_alpha = image_alpha;
		pwd.x = x - sprite_width / 2 + 10; user_enter.x = x - sprite_width / 2 + 10 + pwd.TEXT_WIDTH + 5;
		user_enter.y = y + (USER_WRITE_POSITION * string_count("\n", system_write.TEXT)) + 10; pwd.y =  y + (USER_WRITE_POSITION * string_count("\n", system_write.TEXT)) + 10;
		user_enter.image_alpha = image_alpha; pwd.image_alpha = image_alpha;
		write_text.BAR.image_alpha = image_alpha;
		user_enter.TEXT = write_text.TEXT_OUTPUT;
		if (!WINDOW.IS_REDUCE)
			write_text.ON_WRITE = true;
		else
			write_text.ON_WRITE = false;
		if (user_enter.TEXT_HEIGHT > 0)
			write_text.BAR.y = user_enter.y + user_enter.TEXT_HEIGHT/2;
		else
			write_text.BAR.y = user_enter.y + 7;
		UpdateBar(write_text.BAR, user_enter.TEXT_WIDTH, user_enter.x);
		
		// GET COMMAND
		if (KeyPressed(vk_enter)) {
			COMMAND = user_enter.TEXT;
			write_text.TEXT = ["", "NULL"];
			write_text.TEXT_INDEX = 1;
			write_text.TEXT_INDEX_MAX = 1;
			terminal_ls(COMMAND, system_write, PWD);
		}
		
	} else if (string_count("TERMINAL", WINDOW.TAG) && CREATE && !WINDOW.ON) {
		write_text.ON_WRITE = false;
	}
}