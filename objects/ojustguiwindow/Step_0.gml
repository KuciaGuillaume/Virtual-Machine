/// @Project by Kucia Guillaume* ///

if (TAG == "NULL")
	return;

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
	DestroyButtonBox(TAG + "TERMINAL_HISTORY");
	DestroyButtonBox(TAG + "TERMINAL_CLEAR");
	DestroyButtonBox(TAG + "SAVING");
	DestroyObject(TAG + "CONNECT_AT_IMAGE");
	DestroyText(TAG + "CONNECT_AT_TEXT");
	DestroyObject(TAG + "CONNECT_TO_YOU");
	DestroyText(TAG + "CONNECT_TO_YOU_TEXT");
	DestroyObject(TAG);
}

if ((WINDOW != "NULL" && instance_exists(WINDOW)) && !CLOSE && string_count("TERMINAL", WINDOW.TAG) ) {

	if (user_enter == "NULL") user_enter = GetText(TAG + "TERMINAL_TEXT");
	if (write_text == "NULL") write_text = GetWrite(TAG + "TERMINAL_WRITE");
	if (pwd == "NULL") pwd = GetText(TAG + "TERMINAL_SYSTEM_PWD");
	if (system_write == "NULL") system_write = GetText(TAG + "TERMINAL_SYSTEM_WRITE");
	if (BTN_HELP == "NULL") BTN_HELP = GetObject(TAG + "TERMINAL_HELP"); if (BTN_HELP != "NULL") BTN_HELP.ON = WINDOW.ON;
	if (BTN_HISTORY == "NULL") BTN_HISTORY = GetObject(TAG + "TERMINAL_HISTORY"); if (BTN_HISTORY != "NULL") BTN_HISTORY.ON = WINDOW.ON;
	if (BTN_CLEAR == "NULL") BTN_CLEAR = GetObject(TAG + "TERMINAL_CLEAR"); if (BTN_CLEAR != "NULL") BTN_CLEAR.ON = WINDOW.ON;
	if (SAVING_LOAD == "NULL") SAVING_LOAD = GetObject(TAG + "SAVING");
	if (CONNECT_AT_IMAGE == "NULL") CONNECT_AT_IMAGE = GetObject(TAG + "CONNECT_AT_IMAGE");
	if (CONNECT_AT_TEXT == "NULL") CONNECT_AT_TEXT = GetText(TAG + "CONNECT_AT_TEXT");
	if (CONNECT_TO_YOU == "NULL") CONNECT_TO_YOU = GetObject(TAG + "CONNECT_TO_YOU");
	if (CONNECT_TO_YOU_TEXT == "NULL") CONNECT_TO_YOU_TEXT = GetText(TAG + "CONNECT_TO_YOU_TEXT");
	
	if (CREATE) {
		if (CONNECT) {
			if (instance_exists(CONNECT_ID)) {
				var get = GetObject(CONNECT_ID.TAG);
				if (get.CLOSE) {
				CONNECT = false;
				DestroyObject(TAG + "CONNECT_AT_IMAGE");
				DestroyText(TAG + "CONNECT_AT_TEXT");
				CONNECT_AT_IMAGE = "NULL";
				CONNECT_AT_TEXT = "NULL";
				}
			}
		}
		terminal_update(id)
	}
	if (!CREATE) {
		
		// ON CREATE
		addtolist(AddText(x, y, "Je suis une phrase de test", Arial10, c_white, WINDOW.LAYERS[0], TAG + "TERMINAL_TEXT", ["NULL"]), WINDOW.list_objects);
		addtolist(CreateWrite(TAG + "TERMINAL_WRITE", 100, WINDOW.LAYERS[0], ""), WINDOW.list_objects);
		write_text = GetWrite(TAG + "TERMINAL_WRITE");
		write_text.BAR.x = x;
		addtolist(AddText(x, y, "[ " + global.USER[1] + "/" + PWD[0] + " ]", Arial10, c_white, WINDOW.LAYERS[0], TAG + "TERMINAL_SYSTEM_PWD", ["NULL"]), WINDOW.list_objects);
		addtolist(AddText(x, y, "", Arial10, c_white, WINDOW.LAYERS[0], TAG + "TERMINAL_SYSTEM_WRITE", ["NULL"]), WINDOW.list_objects);
		addtolist(CreateButtonBox(x, y, S_terminal_button, Obox, "Help", WINDOW.LAYERS[0], WINDOW.LAYERS[1], Arial10, c_white, TAG + "TERMINAL_HELP", [["CENTERED"], "NULL"]), WINDOW.list_objects);
		addtolist(CreateButtonBox(x, y, S_terminal_button, Obox, "History", WINDOW.LAYERS[0], WINDOW.LAYERS[1], Arial10, c_white, TAG + "TERMINAL_HISTORY", [["CENTERED"], "NULL"]), WINDOW.list_objects);
		addtolist(CreateButtonBox(x, y, S_terminal_button, Obox, "Clear", WINDOW.LAYERS[0], WINDOW.LAYERS[1], Arial10, c_white, TAG + "TERMINAL_CLEAR", [["CENTERED"], "NULL"]), WINDOW.list_objects);
		system_write = GetText(TAG + "TERMINAL_SYSTEM_WRITE");
		system_write.PARENT = id;
		CREATE = true;
		
		
	} else if (CREATE && (WINDOW.ON || WINDOW.REDUCING || !WINDOW.FADE_MOVEMENT) && !CONNECTION) {
		
		terminal_buttons(BTN_HELP, id, "HELP");
		terminal_buttons(BTN_HISTORY, id, "HISTORY");
		terminal_buttons(BTN_CLEAR, id, "CLEAR");
		
		//PATH
		PWD = ON_MAIN_SCENE.PATH;
		PWD = go_to_path(PWD, PATH);
		if (PWD == ON_MAIN_SCENE.PATH)
			PATH = "/~";
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
			addtolist_limited(COMMAND, COMMAND_HISTORY, 10);
			write_text.TEXT = ["", "NULL"];
			write_text.TEXT_INDEX = 1;
			write_text.TEXT_INDEX_MAX = 1;
			var command_find = false;
			var ARRAY = get_array(COMMAND, " ");
			if (CONNECT) {
				var get = GetObject(CONNECT_ID.TAG);
				if (get == "NULL") { CONNECT = false; terminal_execute(id, ARRAY, COMMAND, id); } else { terminal_execute(get.id, ARRAY, COMMAND, id); if (CONNECT) {system_write.TEXT = get.system_write.TEXT; }}
			} else
				terminal_execute(id, ARRAY, COMMAND, id);
		}

		if (pwd.y + pwd.TEXT_HEIGHT + 30 >= bbox_bottom) {
			var replace = "";
			for (var i = 1; string_char_at(system_write.TEXT, i - 1) != "\n";) { i++; }
			for (; string_char_at(system_write.TEXT, i - 1) == "\n";) { i++; }
			for (; i != string_length(system_write.TEXT); i++)
				replace = replace + string_char_at(system_write.TEXT, i);
			system_write.TEXT = replace + "\n";
		}
	}
}