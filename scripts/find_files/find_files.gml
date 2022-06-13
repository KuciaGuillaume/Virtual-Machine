



function find_files(PWD, PATH, SEARCH, i)
{
	show_debug_message("PWD : ");
	show_debug_message(PWD);
	show_debug_message("PATH : " + PATH);
	if (PWD[i] == undefined && PWD[0][0][0] == "~")
		return [false, undefined, undefined];
	else if (PWD[i] == undefined) {
		var actual_pwd = PWD;
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
		PWD = go_to_path(ON_MAIN_SCENE.PATH, PATH);
		for (var e = 1; PWD[e][0][0][0] != actual_pwd[0][0][0];) { e++; }
		e += 1;
		return find_files(PWD, PATH, SEARCH, e);
	}
	if (PWD[i] != undefined && PWD[i][0][0][0] == "..")
		return find_files(PWD, PATH, SEARCH, i + 1);
	if (PWD[i][0][0][0] != SEARCH) {
		PATH = PATH + "/" + PWD[i][0][0][0]
		PWD = go_to_path(ON_MAIN_SCENE.PATH, PATH);
		return find_files(PWD, PATH, SEARCH, 1);
	} else {
		return [true, PWD, PATH];
	}
}