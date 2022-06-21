



function Home_find_files(PWD, PATH, SEARCH, i, ALL_FINDED)
{
	if (PWD[i] == undefined && PWD[0][0][0] == "~")
		return ALL_FINDED;
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
		return Home_find_files(PWD, PATH, SEARCH, e, ALL_FINDED);
	}
	if (PWD[i] != undefined && PWD[i][0][0][0] == "..")
		return Home_find_files(PWD, PATH, SEARCH, i + 1, ALL_FINDED);
	if (string_count(SEARCH,PWD[i][0][0][0]) <= 0) {
		PATH = PATH + "/" + PWD[i][0][0][0]
		PWD = go_to_path(ON_MAIN_SCENE.PATH, PATH);
		return Home_find_files(PWD, PATH, SEARCH, 1, ALL_FINDED);
	} else {
		ALL_FINDED = addtolist([PWD, PATH, PWD[i][0][0][0], PWD[i], PATH + "/" + PWD[i][0][0][0]], ALL_FINDED);
		PATH = PATH + "/" + PWD[i][0][0][0]
		PWD = go_to_path(ON_MAIN_SCENE.PATH, PATH);
		return Home_find_files(PWD, PATH, SEARCH, 1, ALL_FINDED);
	}
}