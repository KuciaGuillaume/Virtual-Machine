
function strlen(STR, TYPE) {
	var arguments = 0;
	var size = string_byte_length(STR);
	
	for (var i = 1; i < size; i++) {
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

function terminal_ls(COMMAND, ID_RESULT, PWD) {
	var ls = get_array(COMMAND, " ");
	if (ls[0] == "ls") {
		if (PWD[0] != "NULL")
			ID_RESULT.TEXT = ID_RESULT.TEXT + "|-> " + COMMAND + "\n";
		for (var i = 0; PWD[i] != "NULL"; i++) {
			if (PWD[i] != "~" && ls[1] == "NULL") {
				ID_RESULT.TEXT = ID_RESULT.TEXT + PWD[i][0] + "\n";
			} else {
				for (var e = 1; ls[e] != "NULL"; e++) {
					for (var f = 0; PWD[f] != "NULL"; f++) {
						if (PWD[f] == "~") continue;
						if (PWD[f][0] == ls[e]) break;
					}
					if (PWD[f] == "NULL") {
						ID_RESULT.TEXT = ID_RESULT.TEXT + "Path not found: " + ls[e] + "\n";
						continue;
					}
					terminal_ls("ls", ID_RESULT,  PWD[f][1]);
				}
			}
		}
	}
}
