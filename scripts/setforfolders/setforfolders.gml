// Les actifs du script ont changé pour v2.3.0 Voir
// https://help.yoyogames.com/hc/en-us/articles/360005277377 pour plus d’informations
function setforfolders(LIST, BOOL) {
	
	for (var i = 0; LIST[i] != "NULL"; i++)
		LIST[i].ON = BOOL;
}

function check_all_off() {
	var all_off = true;
	for (var i = 0; ON_MAIN_SCENE.TASKS[i] != "NULL"; i++) {
		for (var e = 0; ON_MAIN_SCENE.TASKS[i][3][e] != "NULL"; e++)
			if (ON_MAIN_SCENE.TASKS[i][3][e].ON == true || MouseInsideObject(ON_MAIN_SCENE.TASKS[i][3][e].ICON) || ON_MAIN_SCENE.TASKS[i][3][e].image_alpha < 1)
				all_off = false;
		if (ON_MAIN_SCENE.TASKS[i][3][0] != "NULL" && ON_MAIN_SCENE.TASKS[i][3][0].ICON != "NULL") {
			var visio = GetObject(ON_MAIN_SCENE.TASKS[i][3][0].ICON.TAG + "VISIO");
			if (visio == "NULL")
				continue;
			for (var d = 0; visio.COMPONENTS[d] != "NULL"; d++)
				if (visio.COMPONENTS[d] != undefined && instance_exists(visio.COMPONENTS[d]) && MouseInsideObject(visio.COMPONENTS[d]))
					all_off = false;
		}
	}
	// FOLDERS
	if (all_off) {
		setforfolders(ON_MAIN_SCENE.FOLDERS, true);
		ON_MAIN_SCENE.ON_DESK = true;	
		for (var i = 0; ON_MAIN_SCENE.TASKS[i] != "NULL"; i++) {
			for (var e = 0; ON_MAIN_SCENE.TASKS[i][3][e] != "NULL"; e++) {
				if (!ON_MAIN_SCENE.TASKS[i][3][e].IS_REDUCE) {
					ON_MAIN_SCENE.TASKS[i][3][e].REDUCING = true;
					ON_MAIN_SCENE.TASKS[i][3][e].FADE_END = true;
				}
			}
		}
	} else {
		setforfolders(ON_MAIN_SCENE.FOLDERS, false);
		ON_MAIN_SCENE.ON_DESK = false;
	}
}