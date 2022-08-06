// Les actifs du script ont changé pour v2.3.0 Voir
// https://help.yoyogames.com/hc/en-us/articles/360005277377 pour plus d’informations

function Destroy_search_apps(ID, i, get) {
	DestroyEmptyButton(get[1].TAG);
	if (get[0] == AutoLanguage("Terminal"))
		ID.ALL_TERMINAL = undefined;
	if (get[0] == StrLimit(AutoLanguage("File_explorers"), 13))
		ID.ALL_EXPLORERS = undefined;
	if (get[0] == AutoLanguage("Settings"))
		ID.ALL_SETTINGS = undefined;
	ID.ALL_APPS_LIST[i][1] = undefined;
}

function position_clalc_apps(X, Y, nb, e, size) {
	if (nb == 2) {
		X = 790;
		Y += 60;
		nb = 0;
	} else {
		X += 170;
		nb += 1;
	}
	e = size - 1;
	return [X, Y, nb, e];
}

function Create_search_apps(ID, X, Y, get, i) {
	if (get[0] == AutoLanguage("Terminal")) {
		ID.ALL_TERMINAL = CreateEmptyButton(OHomeEmpty, X, Y, 150, 50, #EEEEEE, #9DBBD5, "Home_Gp1", get[2], get[3], get[4], "EMPT_BUTTON-NO-HAND", [["AUTO_CLASS"], ["CENTERED"], ["SLIDE", 0.0001], ["FADE_IN", 0.000005], undefined]);
		ID.ALL_APPS_LIST[i][1] = ID.ALL_TERMINAL;
	}
	if (get[0] == StrLimit(AutoLanguage("File_explorers"), 13)) {
		ID.ALL_EXPLORERS = CreateEmptyButton(OHomeEmpty, X, Y, 150, 50, #EEEEEE, #9DBBD5, "Home_Gp1", get[2], get[3], get[4], "EMPT_BUTTON-NO-HAND", [["AUTO_CLASS"], ["CENTERED"], ["SLIDE", 0.0001], ["FADE_IN", 0.000005], undefined]);
		ID.ALL_APPS_LIST[i][1] = ID.ALL_EXPLORERS;
	}
	if (get[0] == AutoLanguage("Settings")) {
		ID.ALL_SETTINGS = CreateEmptyButton(OHomeEmpty, X, Y, 150, 50, #EEEEEE, #9DBBD5, "Home_Gp1", get[2], get[3], get[4], "EMPT_BUTTON-NO-HAND", [["AUTO_CLASS"], ["CENTERED"], ["SLIDE", 0.0001], ["FADE_IN", 0.000005], undefined]);
		ID.ALL_APPS_LIST[i][1] = ID.ALL_SETTINGS;
	}
}

function Home_search_apps(ID, search) {
	var word = search.TEXT_OUTPUT;
	var size = string_byte_length(word);
	var X = 790;
	var Y = 550;
	var nb = 0;
	for (var i = 0; ID.ALL_APPS_LIST[i] != undefined; i++) {
			var get = ID.ALL_APPS_LIST[i];
			for (var e = 1; e != size; e++) {
				var find = "";
				for (var f = e; f < size; f++)
					find = find + string_char_at(word, f);
				if (string_count(find, get[0]) > 0 && (string_byte_length(find) > 1 || string_byte_length(word) <= 2)) {
				var button = get[1];
			
				// SEARCH APPS 
				if (button == undefined) {
					Create_search_apps(ID,X,Y, get, i);
					var pos = position_clalc_apps(X,Y,nb,e,size);
					X = pos[0]; Y = pos[1]; nb = pos[2]; e = pos[3];
				} else if (instance_exists(get[1])){
					Destroy_search_apps(ID, i, get);
					Create_search_apps(ID,X,Y, get, i);
					var pos = position_clalc_apps(X,Y,nb,e,size);
					X = pos[0]; Y = pos[1]; nb = pos[2]; e = pos[3];
				}
			} else if (get[1] != undefined)
				Destroy_search_apps(ID, i, get);
		}
	}


// SEARCH FILES

	// PRE INIT
	var save_x = X, save_y = Y;
	var save_nb = nb;

	
	// MAIN LOOP
	for (var e = 0; e != size; e++) {
		var find = "";
		for (var f = e; f < size; f++)
			find = find + string_char_at(word, f + 1);
		var results = Home_find_files(ON_MAIN_SCENE.PATH, "/~", find, 1, [undefined]);
		if (results[0] != undefined && (string_length(find) >= 3 || string_length(results[0][2]) <= 3)) {
			for (var g = 0; results[g] != undefined; g++) {
				var PWD = results[g][0];
				for (var h = 1; results[g][2] != PWD[h][0][0][0]; ) { h++; }
				var name = PWD[h][0][0][0];
				var files = GetObject(name + "HOME_FIND");
				
				// CREATE
				if (files == undefined) {
					Create_find_files(name, X, Y, ID, results[g][3], results[g][4]);
					var pos = position_clalc_apps(X,Y,nb,e,size);
					X = pos[0]; Y = pos[1]; nb = pos[2]; e = pos[3];
				}
			}
		}
	}

	// RESET ALL
	var ALL = [undefined];
	for (var z = 0; ID.ALL_FILES_LIST[z] != undefined; z++) {
		var btn = ID.ALL_FILES_LIST[z];
		ALL = addtolist([btn.TEXT_CONNECT.TEXT, btn.FOLDER_PWD, btn.FOLDER_PWD_PATH], ALL);
		DestroyEmptyButton(btn.TAG);
	}
	X = save_x; Y = save_y;
	nb = save_nb;
	ID.ALL_FILES_LIST = [undefined];
	for (var z = 0; ALL[z] != undefined; z++) {
		Create_find_files(ALL[z][0], X, Y, ID, ALL[z][1], ALL[z][2]);
		var pos = position_clalc_apps(X,Y,nb,e,size);
		X = pos[0]; Y = pos[1]; nb = pos[2]; e = pos[3];
	}
	
	// UPDATE FILES
	Update_home_files(ID);
}

function Create_find_files(name, X, Y, ID, PWD, PATH) {
	var empt = GetEmptLinked(790, 550, "Home_Gp2", S_Folde_icon, OJustGUI, "IMAGE");
	var empt_text = GetEmptText(790, 550, name, Arial10, c_black, c_white, "Home_Gp2");
	var button = CreateEmptyButton(OHomeEmpty, X, Y, 150, 50, #EEEEEE, #9DBBD5, "Home_Gp1", empt, empt_text, name + "HOME_FIND", "EMPT_BUTTON-NO-HAND", [["AUTO_CLASS"], ["CENTERED"], ["SLIDE", 0.0001], ["FADE_IN", 0.000005], undefined]);
	button.IS_FOLDER = true;
	button.FOLDER_PWD = PWD;
	button.FOLDER_PWD_PATH = PATH;
	ID.ALL_FILES_LIST = addtolist(button, ID.ALL_FILES_LIST);
}

function Update_home_files(ID) {
	for (var i = 0; ID.ALL_FILES_LIST[i] != undefined; i++)
		home_buttons_rect(ID.ALL_FILES_LIST[i]);
	for (var i = 0; ID.ALL_APPS_LIST[i] != undefined; i++) {
		var get = ID.ALL_APPS_LIST[i];
		if (get[0] == StrLimit(AutoLanguage("File_explorers"), 13) && ID.ALL_EXPLORERS != undefined)
			home_buttons_rect(ID.ALL_EXPLORERS);
		if (get[0] == AutoLanguage("Terminal") && ID.ALL_TERMINAL != undefined)
			home_buttons_rect(ID.ALL_TERMINAL);
	}
}

function home_buttons_rect(object) {
	var image_bottom = object.OBJECT_LINKED.y;
	var image_top = object.OBJECT_LINKED.y;
	var linked = object.OBJECT_LINKED;
	// BUTTON
	if (object.y + 25 > 938) {
		object.SIZE_Y = 50 - (((object.y + 25) + object.SIZE_Y) - 938);
		if (object.y + 50 > 938)
			object.SIZE_Y = 0;
	} else if (object.y < 492) {
		object.OTHER_DRAWING = true;
		object.OTHER_DRAWING_Y = 492 - object.y;
		object.SIZE_Y = 50 - object.OTHER_DRAWING_Y;
		if (object.SIZE_Y < 0)
			object.SIZE_Y = 0;
	} else {
		object.OTHER_DRAWING = false;
		object.SIZE_Y = 938 - (object.y + 25);
		if (object.SIZE_Y > 50 || object.SIZE_Y < 0) { object.SIZE_Y = 50; }
	}
		
	// OBJECT_LINKED
	linked.SET_DISPLAY = true;
	linked.IMAGE_WIDTH = 34;
	linked.IMAGE_HEIGHT = 34;
	linked.IMAGE_TOP = 0;
	if (image_bottom > 910 || image_top < 505)
		object.TEXT_CONNECT.visible = false;
	else
		object.TEXT_CONNECT.visible = true;
	if (image_bottom > 930) {
		linked.SET_DISPLAY = true;
		linked.IMAGE_HEIGHT = 34 - ((image_top + linked.IMAGE_HEIGHT) - 930);
	} else if (image_top < 510) {
		linked.SET_DISPLAY = true;
		linked.IMAGE_TOP = 510 - image_top;
	} else {
		linked.IMAGE_HEIGHT = 930 - image_top;
		if (linked.IMAGE_HEIGHT > 50 || linked.IMAGE_HEIGHT < 0) { linked.IMAGE_HEIGHT = 50; }
	}
}