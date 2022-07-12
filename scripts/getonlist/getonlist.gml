// Les actifs du script ont changé pour v2.3.0 Voir
// https://help.yoyogames.com/hc/en-us/articles/360005277377 pour plus d’informations
function getonlist(ARGUMENT, LIST) {

	for (var i = 0; LIST[i] != undefined; i++) {
		if (LIST[i] != undefined && instance_exists(LIST[i]) && ARGUMENT == LIST[i].TAG)
			return  LIST[i];
	}
	return undefined;
}


function getonlist_index(ARGUMENT, LIST) {
	for (var i = 0; LIST[i] != undefined; i++) {
		if (LIST[i] == ARGUMENT)
			return  i;
	}
	return 0;
}

function get_index_list(ARGUMENT, LIST) {
	for (var i = 0; LIST[i] != undefined && is_array(LIST[i]) && LIST[i][0] != ARGUMENT; ) { i++; }
	return i;
}

function get_index_list_explorer(ARGUMENT, LIST) {
	for (var i = 0; LIST[i] != undefined && LIST[i].NAME != ARGUMENT; ) { i++; }
	return i;
}