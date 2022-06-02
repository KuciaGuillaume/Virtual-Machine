
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
						show_debug_message(ls[e]);
						show_debug_message(PWD[f]);
						if (PWD[f][0] == ls[e]) { break; }
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
				show_debug_message("PATH = " + PATH);
				var get = terminal_cd(["cd", "..", "NULL"], ID_RESULT, PWD, PATH);
				PWD = get[0];
				show_debug_message(PWD[0]);
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
					show_debug_message("PATH RECU = " + PATH);
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
		ID_RESULT.TEXT = ID_RESULT.TEXT + "|-> " + COMMAND + "\n" + "cd: " + cd[1] + " was not found.\n";
		return [PWD, true, PATH];
	}
	return [PWD, false, PATH];
}

function terminal_mkdir(ARRAY, ID_RESULT, PWD, COMMAND, PATH) {
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
			if (ID_RESULT != "NULL")
				ID_RESULT.TEXT = ID_RESULT.TEXT + "[ " + mkdir[i] + " ] was created.\n";
		}
		return [PWD, true];
	}
	return [PWD, false];
}
function terminal_rm(ARRAY, ID_RESULT, PWD, COMMAND, PATH) {
	var rm = ARRAY;
	if (rm[0] == "rm" && rm[1] == "NULL") {
		ID_RESULT.TEXT = ID_RESULT.TEXT + "|-> " + COMMAND + "\n" + "rm: No arguments.\n";
		return [PWD, true];
	} else if (rm[0] == "rm") {
		ID_RESULT.TEXT = ID_RESULT.TEXT + "|-> " + COMMAND + "\n";
		var find = false;
		for (var i = 1; rm[i] != "NULL"; i++) {
			ON_MAIN_SCENE.PATH = go_to_path(ON_MAIN_SCENE.PATH, PATH);
			for (var e = 0; ON_MAIN_SCENE.PATH[e] != "NULL"; e++) { 
				if (is_array(ON_MAIN_SCENE.PATH[e]) && ON_MAIN_SCENE.PATH[e][0] == rm[i]) {
					for (; ON_MAIN_SCENE.PATH[e] != "NULL"; e++)
						ON_MAIN_SCENE.PATH[e] = ON_MAIN_SCENE.PATH[e + 1];
					ID_RESULT.TEXT = ID_RESULT.TEXT + "[ " + rm[i] + " ] was deleted.\n";
					find = true;
					break;
				}
			}
		}
		if (!find)
			ID_RESULT.TEXT = ID_RESULT.TEXT + "rm: " + rm[1] + " was not found.\n";
		var copy = PATH;
		var get = terminal_cd(["cd", "NULL"], "NULL", ON_MAIN_SCENE.PATH, copy);
		ON_MAIN_SCENE.PATH = get[0];
		return [PWD, true];
	}
	return [PWD, false];
}


