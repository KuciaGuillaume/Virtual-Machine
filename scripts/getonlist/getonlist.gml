// Les actifs du script ont changé pour v2.3.0 Voir
// https://help.yoyogames.com/hc/en-us/articles/360005277377 pour plus d’informations
function getonlist(ARGUMENT, LIST) {

	for (var i = 0; LIST[i] != "NULL"; i++) {
		if (LIST[i] != undefined && instance_exists(LIST[i]) && ARGUMENT == LIST[i].TAG)
			return  LIST[i];
	}
	return "NULL";
}

function get_index_list(ARGUMENT, LIST) {
	for (var i = 0; LIST[i][0] != ARGUMENT; ) { i++; }
	return i;
}