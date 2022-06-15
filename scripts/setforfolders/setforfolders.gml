// Les actifs du script ont changé pour v2.3.0 Voir
// https://help.yoyogames.com/hc/en-us/articles/360005277377 pour plus d’informations
function setforfolders(LIST, BOOL) {
	
	for (var i = 0; LIST[i] != undefined; i++)
		LIST[i].ON = BOOL;
}

function check_all_off() {
	var home = ON_MAIN_SCENE.HOME;
	var all_off = true;
	for (var i = 0; ON_MAIN_SCENE.TASKS[i] != undefined; i++) {
		for (var e = 0; ON_MAIN_SCENE.TASKS[i][3][e] != undefined; e++)
			if (ON_MAIN_SCENE.TASKS[i][3][e].ON == true || MouseInsideObject(ON_MAIN_SCENE.TASKS[i][3][e].ICON) || MouseInsideObject(GetObject("MAIN_TASKBAR")) || (home != undefined && MouseInsideObject(home)))
				all_off = false;
		if (ON_MAIN_SCENE.TASKS[i][3][0] != undefined && ON_MAIN_SCENE.TASKS[i][3][0].ICON != undefined) {
			var visio = GetObject(ON_MAIN_SCENE.TASKS[i][3][0].ICON.TAG + "VISIO");
			if (visio != undefined)
				for (var d = 0; visio.COMPONENTS[d] != undefined; d++)
					if (visio.COMPONENTS[d] != undefined && instance_exists(visio.COMPONENTS[d]) && MouseInsideObject(visio.COMPONENTS[d]))
						all_off = false;
			var right_opt = GetObject(ON_MAIN_SCENE.TASKS[i][3][0].ICON.TAG + "RIGHT_OPT");
			if (right_opt != undefined)
				if (instance_exists(right_opt) && MouseInside(right_opt.x, right_opt.x + right_opt.SIZE_X, right_opt.y, right_opt.y + right_opt.SIZE_Y))
					all_off = false;
		}
	}
	// FOLDERS
	if (all_off) {
		setforfolders(ON_MAIN_SCENE.FOLDERS, true);
		ON_MAIN_SCENE.ON_DESK = true;	
		for (var i = 0; ON_MAIN_SCENE.TASKS[i] != undefined; i++) {
			for (var e = 0; ON_MAIN_SCENE.TASKS[i][3][e] != undefined; e++) {
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