// Les actifs du script ont changé pour v2.3.0 Voir
// https://help.yoyogames.com/hc/en-us/articles/360005277377 pour plus d’informations
function showmywindow(ID, SELF, DEPTH, MAIN_LAYER_ID) {
	var min_depth = 30000;
	var is = 0;
	for (var mac = 0; global.layer_depth[mac] != undefined; mac ++) {
		if (global.layer_depth[mac][2] == ID || global.layer_depth[mac][2] == SELF)
			continue;
		var test = layer_get_id(global.layer_depth[mac][1][6]);
		if (layer_get_depth(test) < min_depth) {
			is = mac;
			min_depth = layer_get_depth(test);
		}
	}
	for (; DEPTH > min_depth;) {
		for (var la = 0; global.layer_depth[la] != undefined && DEPTH > min_depth; la++) {
			if (global.layer_depth[la][2] == ID || global.layer_depth[la][2] == SELF)
				continue;
			for (var f = 0; global.layer_depth[MAIN_LAYER_ID][1][f] != undefined; f++) {
				var get = layer_get_id(global.layer_depth[MAIN_LAYER_ID][1][f]);
				layer_depth(get, layer_get_depth(get) - 7);
			}
			for (var f = 0; global.layer_depth[la][1][f] != undefined; f++) {
				var get = layer_get_id(global.layer_depth[la][1][f]);
				//var me = layer_get_id(global.layer_depth[MAIN_LAYER_ID][1][0]);
				///if (layer_get_depth(get) <= layer_get_depth(me))
					layer_depth(get, layer_get_depth(get) + 7);
			}
		}
		DEPTH = id.depth;
	}

}