// Les actifs du script ont changé pour v2.3.0 Voir
// https://help.yoyogames.com/hc/en-us/articles/360005277377 pour plus d’informations
function addtolist(OBJECT, LIST) {
	
	for (var i = 0; LIST[i] != "NULL"; ) { i++; }
	LIST[i] = OBJECT;
	LIST[i + 1] = "NULL";
	return LIST;
}

function remove_list(i, LIST) {
	
	for (; LIST[i] != "NULL"; i++)
		LIST[i] = LIST[i + 1];
	return LIST;
}