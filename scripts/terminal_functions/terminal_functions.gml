
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

function display_result(system, text) {

	var ID = system.PARENT;
	var value = system.TEXT + text + "\n";
	for (;ID.pwd.y + ID.pwd.TEXT_HEIGHT + 30 + string_height(value) - 500 >= bbox_bottom;) {
		var replace = "";
		for (var i = 1; string_char_at(ID.system_write.TEXT, i - 1) != "\n";) { i++; }
		for (; string_char_at(ID.system_write.TEXT, i - 1) == "\n";) { i++; }
		for (; i != string_length(ID.system_write.TEXT); i++)
			replace = replace + string_char_at(ID.system_write.TEXT, i);
		ID.system_write.TEXT = replace + "\n";
		ID.pwd.TEXT_HEIGHT = string_height(ID.pwd.TEXT)
		ID.pwd.y =  ID.y + (ID.USER_WRITE_POSITION * string_count("\n", ID.system_write.TEXT)) + 30;
	}
	system.TEXT = system.TEXT + text + "\n";
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
	array[i] = undefined;
	return array;
}

function go_to_path(PWD, PATH) {
	var array = get_array(PATH, "/");
	for (var i = 1; array[i] != undefined; i++) {
		var get = terminal_cd(["cd", array[i], undefined], undefined, PWD, PATH);
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
		if (PWD[1] != undefined && ls[1] == undefined)
			display_result(ID_RESULT, "|->" + COMMAND);
		if (PWD[1] == undefined || (PWD[1][0][0][0] == ".." && PWD[2] == undefined)) {
			display_result(ID_RESULT, "Folder is empty");
			return find;
		}
		for (var i = 1; PWD[i] != undefined; i++) {
			if (ls[1] == undefined) {
				if (PWD[i] != undefined)
					display_result(ID_RESULT, PWD[i][0][0][0]);
			} else {
				for (var e = 1; ls[e] != undefined; e++) {
					for (var f = 1; PWD[f] != undefined; f++) {
						if (PWD[f][0][0] == "~") { continue; }
						if (is_array(PWD[f]) && PWD[f][0][0][0] == ls[e]) { break; }
					}
					if (PWD[f] == undefined) {
						display_result(ID_RESULT, "ls: folder [ " + ls[e] + " ] not found.");
						return find;
					} else {
						terminal_ls(["ls", undefined], ID_RESULT,  PWD[f]);
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
	if (clear[0] == undefined || clear[1] != undefined)
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
		if (cd[1] == undefined) {
			if (PWD[0][0][0] == "~") {
				if (ID_RESULT != undefined)
					display_result(ID_RESULT, "|-> " + COMMAND + "\n" + "cd: You are already at the root.");
				return [PWD, true, PATH];
			}
			for (; PWD[0][0][0] != "~"; ) {
				var get = terminal_cd(["cd", "..", undefined], ID_RESULT, PWD, PATH);
				PWD = get[0];
				PATH = get[2];
			}
			return [PWD, true, PATH];
		}
		for (var i = 1; PWD[i] != undefined; i++)
			if (PWD[i][0][0][0] == cd[1]) {
				if (ID_RESULT != undefined)
					display_result(ID_RESULT, "|-> " + COMMAND);
				if (cd[1] != "..") {
					PWD = PWD[i];
					PATH = PATH + "/" + PWD[0][0][0];
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
		if (ID_RESULT != undefined)
			display_result(ID_RESULT, "|-> " + COMMAND + "\n" + "cd: " + cd[1] + " was not found.");
		return [PWD, true, PATH];
	}
	return [PWD, false, PATH];
}

function terminal_mkdir(ARRAY, ID_RESULT, PWD, COMMAND, PATH, PARENT) {
	var mkdir = ARRAY;
	var folder = undefined;
	if (mkdir[0] == "mkdir" && mkdir[1] == undefined) {
		if (ID_RESULT != undefined)
			display_result(ID_RESULT, "|-> " + COMMAND + "\n" + "mkdir: No arguments.");
		return [PWD, true, folder];
	} else if (mkdir[0] == "mkdir") {
		if (ID_RESULT != undefined)
			ID_RESULT.TEXT = ID_RESULT.TEXT + "|-> " + COMMAND + "\n";
		for (var i = 1; mkdir[i] != undefined; i++) {
			var exists_already = false;
			for (var e = 1; PWD[e] != undefined; e++) {
				if (PWD[e] != undefined && is_array(PWD[e]) && PWD[e][0][0] == mkdir[i]) {
					if (ID_RESULT != undefined)
						display_result(ID_RESULT, mkdir[i] + ": Folder already exists.");
					exists_already = true;
				}
			}
			if (exists_already)
				continue;
			var save = ON_MAIN_SCENE.PATH;
			ON_MAIN_SCENE.PATH = go_to_path(ON_MAIN_SCENE.PATH, PATH);
			for (var e = 0; ON_MAIN_SCENE.PATH[e] != undefined; ) { e++; }
			ON_MAIN_SCENE.PATH[e + 1] = undefined;
			if (current_day < 10) var day = "0" + string(current_day); else var day = string(current_day);
			if (current_month < 10) var month = "0" + string(current_month); else var month = string(current_month);
			var DateOfCreation = day + "/" + month + "/" + string(current_year);
			if (ON_MAIN_SCENE.PATH[0][0][0] == "Desk") {
				var folder = AddFolders(mkdir[i], undefined);
				ON_MAIN_SCENE.PATH[e] = [[[mkdir[i], "FOLDER", folder, DateOfCreation]], [[["..", "PREVIOUS"], "*", undefined]],undefined];
			} else
				ON_MAIN_SCENE.PATH[e] = [[[mkdir[i], "FOLDER", undefined, DateOfCreation]], [[["..", "PREVIOUS"], "*", undefined]],undefined];
			var copy = PATH;
			ON_MAIN_SCENE.PATH = save;
			var SAVE_LIST = [global.USER, ON_MAIN_SCENE.PATH, ON_MAIN_SCENE.NAME_FOLDERS, global.WINDOWS_PIN,undefined];
			savegame_save("USER", SAVE_LIST);
			if (ID_RESULT != undefined) {
				terminal_saving(PARENT);
				display_result(ID_RESULT, "[ " + mkdir[i] + " ] was created.");
			}
		}
		return [PWD, true, folder];
	}
	return [PWD, false, folder];
}

function terminal_rm(ARRAY, ID_RESULT, PWD, COMMAND, PATH, PARENT) {
	var rm = ARRAY;
	if (rm[0] == "rm" && rm[1] == undefined) {
		if (ID_RESULT != undefined)
			display_result(ID_RESULT, "|-> " + COMMAND + "\n" + "rm: No arguments.");
		return [PWD, true];
	} else if (rm[0] == "rm") {
		if (ID_RESULT != undefined)
			display_result(ID_RESULT, "|-> " + COMMAND);
		var find = false;
		var save = ON_MAIN_SCENE.PATH;
		for (var i = 1; rm[i] != undefined; i++) {
			if (rm[i] == ".." || ((rm[i] == "Desk" || rm[i] == "Documents") && PWD[0][0][0] == "~")) {
				display_result(ID_RESULT, "[ " + rm[i] + " ] You do not have permission to delete it.");
				find = true;
				continue;
			}
			ON_MAIN_SCENE.PATH = go_to_path(ON_MAIN_SCENE.PATH, PATH);
			for (var e = 0; ON_MAIN_SCENE.PATH[e] != undefined; e++) { 
				if (is_array(ON_MAIN_SCENE.PATH[e]) && is_array(ON_MAIN_SCENE.PATH[e][0][0]) && ON_MAIN_SCENE.PATH[e][0][0][0] == rm[i]) {
					if (ON_MAIN_SCENE.PATH[0][0][0] == "Desk") {
						ON_MAIN_SCENE.FOLDERS = remove_findlist(ON_MAIN_SCENE.PATH[e][0][0][2], ON_MAIN_SCENE.FOLDERS);
						ON_MAIN_SCENE.NAME_FOLDERS = remove_findlist_index(ON_MAIN_SCENE.PATH[e][0][0][0], ON_MAIN_SCENE.NAME_FOLDERS, 0);
						var folder = ON_MAIN_SCENE.PATH[e][0][0][2];
						DestroyWrite(folder.WRITE.TAG);
						DestroyText(folder.TEXT_CONNECT.TAG);
						DestroyObject(folder.TAG);
					}
					for (; ON_MAIN_SCENE.PATH[e] != undefined; e++)
						ON_MAIN_SCENE.PATH[e] = ON_MAIN_SCENE.PATH[e + 1];
					if (PARENT != undefined)
						terminal_saving(PARENT);
					if (ID_RESULT != undefined)
						display_result(ID_RESULT, "[ " + rm[i] + " ] was deleted.");
					find = true;
					break;
				}
			}
		}
		if (!find) {
			if (ID_RESULT != undefined)
				display_result(ID_RESULT, "rm: " + rm[1] + " was not found.");
		}
		var copy = PATH;
		ON_MAIN_SCENE.PATH = save;
		return [PWD, true];
	}
	return [PWD, false];
}

function terminal_history(PARENT) {
	display_result(PARENT.system_write, "Here is the list of your keyboard commands: ");
	for (var e = 0; PARENT.COMMAND_HISTORY[e] != undefined; e++) {
		display_result(PARENT.system_write, "- " + PARENT.COMMAND_HISTORY[e]);
	}
	if (e == 0)
		display_result(PARENT.system_write, "Your keyboard command history is empty !");
}


function terminal_getpid(PARENT) {
	display_result(PARENT.system_write, "PID : " + string(PARENT.id));
}

function terminal_connect(ARRAY, PARENT) {
	
	if (ARRAY[0] == "connect" && ARRAY[1] != undefined) {
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
	if (ARRAY[0] == "exit" && ARRAY[1] == undefined) {
		id.CLOSE = true;
		id.CATCH = false;
		id.WINDOW.FADE_END = true;
		id.WINDOW.CLOSING = true;
		send.CONNECT = false;
		DestroyObject(send.TAG + "CONNECT_AT_IMAGE"); send.CONNECT_AT_IMAGE = undefined;
		DestroyText(send.TAG + "CONNECT_AT_TEXT"); send.CONNECT_AT_TEXT = undefined;
		DestroyObject(id.TAG + "CONNECT_TO_YOU"); id.CONNECT_TO_YOU = undefined;
		DestroyText(id.TAG + "CONNECT_TO_YOU_TEXT"); id.CONNECT_TO_YOU_TEXT = undefined;
		display_result(send.system_write, "End of connection.");
		return;
	}
	if (ARRAY[0] == "close" && ARRAY[1] == undefined) {
		command_find = true;
		if (send.CONNECT == false)
			display_result(send.system_write, "You are not connected to anything.");
		else {
			DestroyObject(send.TAG + "CONNECT_AT_IMAGE"); send.CONNECT_AT_IMAGE = undefined;
			DestroyText(send.TAG + "CONNECT_AT_TEXT"); send.CONNECT_AT_TEXT = undefined;
			DestroyObject(id.TAG + "CONNECT_TO_YOU"); id.CONNECT_TO_YOU = undefined;
			DestroyText(id.TAG + "CONNECT_TO_YOU_TEXT"); id.CONNECT_TO_YOU_TEXT = undefined;
			send.CONNECT = false;
			display_result(send.system_write, "End of connection.");
			var ID = GetObject(send.CONNECT_ID.TAG);
			id.CATCH = false;
		}
	}
	if (ARRAY[0] == "help" && ARRAY[1] == undefined) { display_result(id.system_write, HELP_MESSAGE); return; }
	if (ARRAY[0] != undefined) {
		if (terminal_ls(ARRAY, id.system_write, id.PWD)) command_find = true;
		if (terminal_clear(ARRAY, id.system_write)) command_find = true;
		var cd = terminal_cd(ARRAY, id.system_write, id.PWD, id.PATH); id.PWD = cd[0]; id.PATH = cd[2]; if (cd[1]) { command_find = true; }
		var mkdir = terminal_mkdir(ARRAY, id.system_write, id.PWD, COMMAND, id.PATH, id); id.PWD = mkdir[0]; if (mkdir[1]) { command_find = true; var SAVE_LIST = [global.USER, ON_MAIN_SCENE.PATH, ON_MAIN_SCENE.NAME_FOLDERS, global.WINDOWS_PIN,undefined]; savegame_save("USER", SAVE_LIST);}
		var rm = terminal_rm(ARRAY, id.system_write, id.PWD, COMMAND, id.PATH, id); id.PWD = rm[0]; if (rm[1]) { command_find = true; var SAVE_LIST = [global.USER, ON_MAIN_SCENE.PATH, ON_MAIN_SCENE.NAME_FOLDERS, global.WINDOWS_PIN,undefined]; savegame_save("USER", SAVE_LIST);}
		if (ARRAY[0] == "history" && ARRAY[1] == undefined) { command_find = true; terminal_history(id); }
		if (ARRAY[0] == "getpid" && ARRAY[1] == undefined) { command_find = true; terminal_getpid(id); }
		if (terminal_connect(ARRAY, id)) { command_find = true; }
		if (terminal_rename(ARRAY, id.system_write, id.PWD, id)) { command_find = true; }
		if (!command_find)
			display_result(id.system_write, COMMAND + ": command not found.");
	} else
		display_result(id.system_write, id.pwd.TEXT);
}

function array_size(array) {
	var size = 0;
	for (; array[size] != undefined;) { size++; }
	return size;
}

function terminal_rename(ARRAY, ID_RESULT, PWD, PARENT) {
	if (ARRAY[0] == "rename" && array_size(ARRAY) < 3) {
		if (ID_RESULT != undefined)
			display_result(ID_RESULT, "Rename: too few arguments");
		return true;
	}
	if (ARRAY[0] != "rename")
		return false;
	for (var i = 1; PWD[i] != undefined; i++) {
		if (is_array(PWD[i]) && PWD[i][0][0][0] == ARRAY[1]) {
			if ((ARRAY[1] == "Desk" || ARRAY[1] == "Documents") && PWD[0][0][0] == "~") {
				if (ID_RESULT != undefined)
					display_result(ID_RESULT,  "[" + ARRAY[1] + "] You don't have permission to rename it.");
				return true;
			}
			PWD[i][0][0][0] = ARRAY[2];
			if (ID_RESULT != undefined)
				display_result(ID_RESULT,  "[" + ARRAY[1] + "] has been successfully renamed to [" + ARRAY[2] + "]");
			for (var e = 0; ON_MAIN_SCENE.FOLDERS[e] != undefined; e++) {
				if (ON_MAIN_SCENE.NAME_FOLDERS[e][0] == ARRAY[1]) {
					var folder = ON_MAIN_SCENE.FOLDERS[e];
					if (folder != undefined) {
						folder.TEXT_CONNECT.TEXT = ARRAY[2];
						if (!folder.WRITE.ON_WRITE) {
							folder.WRITE.TEXT_INDEX_MAX = 1;
							folder.WRITE.TEXT_INDEX = 1;
							folder.WRITE.INITIAL_TEXT = ARRAY[2];
							folder.WRITE.TEXT = [ARRAY[2], "", undefined];
						}
					}
					ON_MAIN_SCENE.NAME_FOLDERS[e][0] = ARRAY[2];
					if (ID_RESULT != undefined) {
						SAVE_LIST = [global.USER, ON_MAIN_SCENE.PATH, ON_MAIN_SCENE.NAME_FOLDERS, global.WINDOWS_PIN, undefined];
						savegame_save("USER", SAVE_LIST);
					}
					if (PARENT != undefined)
						terminal_saving(PARENT);
				}
			}
			return true;
		}
	}
	if (ID_RESULT != undefined)
		display_result(ID_RESULT,  "[" + ARRAY[1] + "] is not found.");
	return true;
}


