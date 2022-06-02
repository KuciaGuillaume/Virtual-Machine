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

function list_n(LIST) {
	var i = 0;
	for (; LIST[i] != "NULL";) { i++ }
	return i;
}

function addtolist_limited(OBJECT, LIST, MAX) {
	
	for (var i = 0; LIST[i] != "NULL" && i != MAX; ) { i++; }
	if (i != MAX) {
		LIST[i] = OBJECT;
		LIST[i + 1] = "NULL";
	} else {
		for (var e = 0; e != i; e++)
			LIST[e] = LIST[e + 1];
		e--;
		LIST[e] = OBJECT;
	}
	return LIST;
}