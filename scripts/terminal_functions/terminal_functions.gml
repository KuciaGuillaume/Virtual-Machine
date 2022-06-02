
function strlen(STR, TYPE) {
	var arguments = 0;
	var size = string_byte_length(STR) + 1;
	
	for (var i = 1; i != size; i++) {
		for (; i < size && string_char_at(STR, i) == TYPE;) { i++; }
		if (i < size)
			arguments += 1;
		else
			break;
		for (; i < size && string_char_at(STR, i) != TYPE; ) { i++; }
	}
	return arguments;
}

function remove_char(STR, CHAR) {
	var result = "";
	var size = string_byte_length(STR) + 1;
	
	for (var i = 1; i != size; i++) {
		if (string_char_at(STR, i) != CHAR)
			result = result + string_char_at(STR, i);
	}
	return result;
}

function get_array(STR, TYPE) {
	var array_size = strlen(STR, TYPE);
	var size = string_byte_length(STR) + 1;
	var array = [];
	
	var e = 1;
	for (var i = 0; i != array_size; i++) {
		for (; e != size && string_char_at(STR, e) == TYPE;) { e++; } 
		var to_array = "";
		for (; e != size && string_char_at(STR, e) != TYPE; e++)
			to_array = to_array + string_char_at(STR, e);
		array[i] = to_array;
	}
	array[i] = "NULL";
	return array;
}

function go_to_path(PWD, PATH) {
	var array = get_array(PATH, "/");
	for (var i = 1; array[i] != "NULL"; i++) {
		var get = terminal_cd(["cd", array[i], "NULL"], "NULL", PWD, PATH);
		if (!get[1]) {
			return ON_MAIN_SCENE.PATH;
			PATH = "/~";
		}
		PWD = get[0];
	}
	return PWD;
}

function terminal_ls(ARRAY, ID_RESULT, PWD) {
	var find = false;
	var ls = ARRAY;
	if (ls[0] == "ls") {
		find = true;
		if (PWD[1] != "NULL" && ls[1] == "NULL")
			ID_RESULT.TEXT = ID_RESULT.TEXT + "|-> " + COMMAND + "\n";
		if (PWD[1] == "NULL" || (PWD[1][0] == ".." && PWD[2] == "NULL")) {
			ID_RESULT.TEXT = ID_RESULT.TEXT + "Folder is empty\n";
			return find;
		}
		for (var i = 1; PWD[i] != "NULL"; i++) {
			if (ls[1] == "NULL") {
				if (PWD[i] != "NULL")
					ID_RESULT.TEXT = ID_RESULT.TEXT + PWD[i][0] + "\n";
			} else {
				for (var e = 1; ls[e] != "NULL"; e++) {
					for (var f = 0; PWD[f] != "NULL"; f++) {
						if (PWD[f] == "~") { continue; }
						if (is_array(PWD[f]) && PWD[f][0] == ls[e]) { break; }
					}
					if (PWD[f] == "NULL") {
						ID_RESULT.TEXT = ID_RESULT.TEXT + "ls: folder [ " + ls[e] + " ] not found.\n";
						return find;
					} else {
						terminal_ls(["ls", "NULL"], ID_RESULT,  PWD[f]);
						return find;
					}
				}
			}
		}
	}
	return find;
}

function terminal_clear(ARRAY, ID_RESULT) {
	var clear = ARRAY;
	if (clear[0] == "NULL" || clear[1] != "NULL")
		return false;
	if (clear[0] == "clear") {
		ID_RESULT.TEXT = "";
		return true;
	}
}

function terminal_cd(ARRAY, ID_RESULT, PWD, PATH) {
	static previous_path = PATH;
	var cd = ARRAY;
	if (cd[0] == "cd") {
		if (cd[1] == "NULL") {
			if (PWD[0] == "~") {
				if (ID_RESULT != "NULL")
					ID_RESULT.TEXT = ID_RESULT.TEXT + "|-> " + COMMAND + "\n" + "cd: You are already at the root.\n";
				return [PWD, true, PATH];
			}
			for (; PWD[0] != "~"; ) {
				var get = terminal_cd(["cd", "..", "NULL"], ID_RESULT, PWD, PATH);
				PWD = get[0];
				PATH = get[2];
			}
			return [PWD, true, PATH];
		}
		for (var i = 1; PWD[i] != "NULL"; i++)
			if (PWD[i][0] == cd[1]) {
				if (ID_RESULT != "NULL")
					ID_RESULT.TEXT = ID_RESULT.TEXT + "|-> " + COMMAND + "\n";
				if (cd[1] != "..") {
					PWD = PWD[i];
					PATH = PATH + "/" + PWD[0];
				} else {
					var slash = string_count("/", PATH);
					var new_path = "";
					for (var h = 0; slash != 0; h++) {
						if (string_char_at(PATH, h + 1) == "/")
							slash -= 1;
						if (slash == 0)
							break;
						new_path = new_path + string_char_at(PATH, h + 1);
					}
					PATH = new_path;
					PWD = go_to_path(ON_MAIN_SCENE.PATH, new_path);
				}
				return [PWD, true, PATH];
			}
		if (ID_RESULT != "NULL")
			ID_RESULT.TEXT = ID_RESULT.TEXT + "|-> " + COMMAND + "\n" + "cd: " + cd[1] + " was not found.\n";
		return [PWD, true, PATH];
	}
	return [PWD, false, PATH];
}

function terminal_mkdir(ARRAY, ID_RESULT, PWD, COMMAND, PATH, PARENT) {
	var mkdir = ARRAY;
	if (mkdir[0] == "mkdir" && mkdir[1] == "NULL") {
		if (ID_RESULT != "NULL")
			ID_RESULT.TEXT = ID_RESULT.TEXT + "|-> " + COMMAND + "\n" + "mkdir: No arguments.\n";
		return [PWD, true];
	} else if (mkdir[0] == "mkdir") {
		if (ID_RESULT != "NULL")
			ID_RESULT.TEXT = ID_RESULT.TEXT + "|-> " + COMMAND + "\n";
		for (var i = 1; mkdir[i] != "NULL"; i++) {
			var exists_already = false;
			for (var e = 0; PWD[e] != "NULL"; e++) {
				if (PWD[e] != "NULL" && is_array(PWD[e]) && PWD[e][0] == mkdir[i]) {
					if (ID_RESULT != "NULL")
						ID_RESULT.TEXT = ID_RESULT.TEXT + mkdir[i] + ": Folder already exists.\n";
					exists_already = true;
				}
			}
			if (exists_already)
				continue;
			var save = ON_MAIN_SCENE.PATH;
			ON_MAIN_SCENE.PATH = go_to_path(ON_MAIN_SCENE.PATH, PATH);
			for (var e = 0; ON_MAIN_SCENE.PATH [e] != "NULL"; ) { e++; }
			ON_MAIN_SCENE.PATH[e] = [mkdir[i], ["..", "*", "NULL"],"NULL"];
			ON_MAIN_SCENE.PATH[e + 1] = "NULL";
			var copy = PATH;
			ON_MAIN_SCENE.PATH = save;
			if (ID_RESULT != "NULL") {
				terminal_saving(PARENT);
				ID_RESULT.TEXT = ID_RESULT.TEXT + "[ " + mkdir[i] + " ] was created.\n";
			}
		}
		return [PWD, true];
	}
	return [PWD, false];
}
function terminal_rm(ARRAY, ID_RESULT, PWD, COMMAND, PATH, PARENT) {
	var rm = ARRAY;
	if (rm[0] == "rm" && rm[1] == "NULL") {
		ID_RESULT.TEXT = ID_RESULT.TEXT + "|-> " + COMMAND + "\n" + "rm: No arguments.\n";
		return [PWD, true];
	} else if (rm[0] == "rm") {
		ID_RESULT.TEXT = ID_RESULT.TEXT + "|-> " + COMMAND + "\n";
		var find = false;
		var save = ON_MAIN_SCENE.PATH;
		for (var i = 1; rm[i] != "NULL"; i++) {
			if (rm[i] == ".." || ((rm[i] == "Desk" || rm[i] == "Documents") && PWD[0] == "~")) {
				ID_RESULT.TEXT = ID_RESULT.TEXT + "[ " + rm[i] + " ] You do not have permission to delete it.\n";
				find = true;
				continue;
			}
			ON_MAIN_SCENE.PATH = go_to_path(ON_MAIN_SCENE.PATH, PATH);
			for (var e = 0; ON_MAIN_SCENE.PATH[e] != "NULL"; e++) { 
				if (is_array(ON_MAIN_SCENE.PATH[e]) && ON_MAIN_SCENE.PATH[e][0] == rm[i]) {
					for (; ON_MAIN_SCENE.PATH[e] != "NULL"; e++)
						ON_MAIN_SCENE.PATH[e] = ON_MAIN_SCENE.PATH[e + 1];
					terminal_saving(PARENT);
					ID_RESULT.TEXT = ID_RESULT.TEXT + "[ " + rm[i] + " ] was deleted.\n";
					find = true;
					break;
				}
			}
		}
		if (!find)
			ID_RESULT.TEXT = ID_RESULT.TEXT + "rm: " + rm[1] + " was not found.\n";
		var copy = PATH;
		ON_MAIN_SCENE.PATH = save;
		return [PWD, true];
	}
	return [PWD, false];
}

function terminal_history(PARENT) {
	PARENT.system_write.TEXT = PARENT.system_write.TEXT + "Here is the list of your keyboard commands: \n";
	for (var e = 0; PARENT.COMMAND_HISTORY[e] != "NULL"; e++) {
		PARENT.system_write.TEXT = PARENT.system_write.TEXT + "- " + PARENT.COMMAND_HISTORY[e] + "\n";
	}
	if (e == 0)
		PARENT.system_write.TEXT = PARENT.system_write.TEXT + "Your keyboard command history is empty !\n";
}


function terminal_getpid(PARENT) {
	PARENT.system_write.TEXT = PARENT.system_write.TEXT + "PID : " + string(PARENT.id) + "\n";
}

function terminal_connect(ARRAY, PARENT) {
	
	if (ARRAY[0] == "connect" && ARRAY[1] != "NULL") {
		terminal_saving(PARENT);
		PARENT.CONNECTION = true;
		PARENT.CONNECT_ID = string_digits(ARRAY[1]);
		PARENT.SAVING_TIMER = 5;
		return true;
	}
	return false;
}

function terminal_execute(id, ARRAY, COMMAND, send) {
	var command_find = false;
	if (ARRAY[0] == "exit" && ARRAY[1] == "NULL") {
		id.CLOSE = true;
		id.WINDOW.FADE_END = true;
		id.WINDOW.CLOSING = true;
		send.CONNECT = false;
		DestroyObject(send.TAG + "CONNECT_AT_IMAGE");
		DestroyText(send.TAG + "CONNECT_AT_TEXT");
		return;
	}
	if (ARRAY[0] == "help" && ARRAY[1] == "NULL") { id.system_write.TEXT = id.system_write.TEXT + HELP_MESSAGE + "\n"; return; }
	if (ARRAY[0] != "NULL") {
		if (terminal_ls(ARRAY, id.system_write, id.PWD)) command_find = true;
		if (terminal_clear(ARRAY, id.system_write)) command_find = true;
		var cd = terminal_cd(ARRAY, id.system_write, id.PWD, id.PATH); id.PWD = cd[0]; id.PATH = cd[2]; if (cd[1]) { command_find = true; }
		var mkdir = terminal_mkdir(ARRAY, id.system_write, id.PWD, COMMAND, id.PATH, id); id.PWD = mkdir[0]; if (mkdir[1]) { command_find = true; var SAVE_LIST = [global.USER, ON_MAIN_SCENE.PATH, "NULL"]; savegame_save("USER", SAVE_LIST);}
		var rm = terminal_rm(ARRAY, id.system_write, id.PWD, COMMAND, id.PATH, id); id.PWD = rm[0]; if (rm[1]) { command_find = true; var SAVE_LIST = [global.USER, ON_MAIN_SCENE.PATH, "NULL"]; savegame_save("USER", SAVE_LIST);}
		if (ARRAY[0] == "history" && ARRAY[1] == "NULL") { command_find = true; terminal_history(id); }
		if (ARRAY[0] == "getpid" && ARRAY[1] == "NULL") { command_find = true; terminal_getpid(id); }
		if (terminal_connect(ARRAY, id)) { command_find = true; }
		if (!command_find)
			id.system_write.TEXT = id.system_write.TEXT + COMMAND + ": command not found.\n";
	} else
		id.system_write.TEXT = id.system_write.TEXT + id.pwd.TEXT + "\n";
}

