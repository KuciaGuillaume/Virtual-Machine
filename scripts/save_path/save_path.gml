// Les actifs du script ont changé pour v2.3.0 Voir
// https://help.yoyogames.com/hc/en-us/articles/360005277377 pour plus d’informations
function save_path(){
	var NEW = ON_MAIN_SCENE.PATH;
	var PREVIOUS = ON_MAIN_SCENE.PATH;
	
	PATH = "/~";
	for (var i = 1; NEW[i] != "NULL";) {
		if (NEW[i] != "NULL" && is_array(NEW[i]) && NEW[i][0] == "..") { i++ };
		for (; NEW[i] != "NULL" && is_array(NEW[i]) && NEW[i][1][1] == "*";) { i++ };
		show_message("ARRAY ACTUAL");
		show_message(NEW);
		show_message("TARGET");
		if (NEW[i] != "NULL" && is_array(NEW[i]))
			show_message(NEW[i][0]);
		if (NEW[i] != "NULL" && is_array(NEW[i])) {var get = terminal_cd(["cd", NEW[i][0] , "NULL"], "NULL", NEW, PATH); if (get[0] != NEW) {i = 1; PREVIOUS = NEW; NEW = get[0]; show_message("NEW"); show_message(NEW)} else { i++; }; PATH = get[2];} 
		else if (NEW[1] != "NULL" && is_array(NEW[1]) && NEW[1][0] == "..") { NEW[1][1] = "*"; NEW = PREVIOUS; i = 1;} else { if (NEW[i] == "NULL") break; else i++; }
	}
	show_message("END_PRINT = ");
	show_message(NEW);
	return NEW;
}