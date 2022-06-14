// Les actifs du script ont changé pour v2.3.0 Voir
// https://help.yoyogames.com/hc/en-us/articles/360005277377 pour plus d’informations

function no_one_here(X, Y, LIST) {
	
	var one = true;
	for (var i = 0; LIST[i] != undefined; i++)
		if (LIST[i].x == X && LIST[i].y == Y)
			one = false;
	return one;
}

function AddFolders(NAME, MODE) {

	static ID = 0;
	// ICON DESK
	if (MODE == "START") {
		var folder = CreateObjectSprite(NAME[1], NAME[2], "Gp0", S_Folder, OJustGUI, "BUTTON-NO-HAND", NAME[0] + "FOLDERS" + string(ID), [undefined]);
		folder.TEXT_CONNECT = AddText(NAME[1], NAME[2] + 30, NAME[0], Arial10, c_white, "Gp1", NAME[0] + "FOLDERS_TEXT" + string(ID), [["CENTERED"], undefined]);
		folder.WRITE = CreateWrite(NAME[0] + "WRITE" + string(ID), 20, "Gp2", NAME[0]);
		folder.WRITE.ON_WRITE = false;
		ID += 1;
		return folder;
	}
	var path = ON_MAIN_SCENE.FOLDERS;
	var X = 100;
	var Y = 100;
	for (var i = 0; !no_one_here(X, Y, path); i++)
		if (Y >= 900) {Y = 100; X += 100; } else { Y += 100; }
	class = [NAME, X, Y];
	var folder = CreateObjectSprite(X, Y, "Gp0", S_Folder, OJustGUI, "BUTTON-NO-HAND", NAME + "FOLDERS" + string(ID), [undefined]);
	ON_MAIN_SCENE.FOLDERS = addtolist(folder, ON_MAIN_SCENE.FOLDERS);
	folder.TEXT_CONNECT = AddText(X, Y + 30, NAME, Arial10, c_white, "Gp1", NAME + "FOLDERS_TEXT" + string(ID), [["CENTERED"], undefined]);
	folder.WRITE = CreateWrite(NAME + "WRITE" + string(ID), 20, "Gp2", NAME);
	folder.WRITE.ON_WRITE = false;
	ON_MAIN_SCENE.NAME_FOLDERS = addtolist(class, ON_MAIN_SCENE.NAME_FOLDERS);
	ID += 1;
	return folder;
}

function AddFileEplorerFloder(NAME, LIST, PARENT, CreationDate) {
	static ID = 500;
	if (LIST[0] == undefined) {
		X = PARENT.x + 117;
		Y = PARENT.y + 90;
	} else {
		X = LIST[0].x;
		Y = LIST[0].y;
	}
	LAYER1 = PARENT.WINDOW.LAYERS[0];
	LAYER2 = PARENT.WINDOW.LAYERS[1];
	var type_name = "file folder";
	var path = LIST;
	for (var i = 0; path[i] != undefined && !instance_exists(path[i]);) { i++; }
	for (; path[i] != undefined; i++)
		Y += 24;
	var folder = CreateObjectSprite(X, Y, LAYER1, S_FILES_buton, Obox, "BUTTON-NO-HAND", NAME + "FILE_EXPLORERS" + string(ID) + PARENT.TAG, [["INFO", "Creation date: " + CreationDate], undefined]);
	addtolist(folder, LIST);
	folder.TEXT_CONNECT = AddText(X, Y, NAME, Arial10, c_black, LAYER2, NAME + "FILE_EXPLORER_TEXT" + string(ID) + PARENT.TAG, [undefined]);
	folder.DOCK_TYPE_TEXT = AddText(X, Y, type_name, Arial10, c_black, LAYER2, NAME + "FILE_TYPE" + type_name + string(ID) + PARENT.TAG, [undefined]);
	folder.WRITE = CreateWrite(NAME + "FILE_EXPLORER_WRITE" + string(ID) + PARENT.TAG, 20, LAYER2, NAME);
	folder.WRITE.ON_WRITE = false;
	folder.NAME = NAME;
	folder.PARENT = PARENT;
	folder.OBJECT_LINKED = CreateObjectSprite(X, Y, LAYER2, S_Explorer_folder, OJustGUI, "IMAGE", NAME + "FILE_ICON" + string(ID) + PARENT.TAG, [undefined]);
	if (X > PARENT.x)
		folder.PARENT_DIFF_X = X - PARENT.x;
	else
		folder.PARENT_DIFF_X = (PARENT.x - X) * (-1);
	if (Y > PARENT.y)
		folder.PARENT_DIFF_Y = Y - PARENT.y;
	else
		folder.PARENT_DIFF_Y = (PARENT.y - Y) * (-1);
	addtolist(folder, PARENT.WINDOW.list_objects);
	return LIST;
}

function UpdateFileExplorer(PWD, PATH, LIST, PARENT) {
	PWD = go_to_path(ON_MAIN_SCENE.PATH, PATH);
	
	
	// DELETE
	var deleted = [undefined];
	for (var e = 0; LIST[e] != undefined; e++) {
		for (var i = 1; PWD[i] != undefined; i++) {
			if (PWD[i][0][0][0] == LIST[e].NAME)
				break;
		}
		if (PWD[i] == undefined) {
			DestroyText(LIST[e].TEXT_CONNECT.TAG);
			DestroyText(LIST[e].DOCK_TYPE_TEXT.TAG);
			DestroyObject(LIST[e].OBJECT_LINKED.TAG);
			DestroyObject(LIST[e].TAG);
			PARENT.N_ELEMENTS -= 1;
			var save = e;
			for (; LIST[e] != undefined; e++)
				LIST[e] = LIST[e + 1];
			e = save - 1;
		}
	}

	// CREATE
	for (var i = 1; PWD[i] != undefined; i++) {
		var check = true;
		for (var e = 0; LIST[e] != undefined; e++) {
			if (PWD[i][0][0][0] == LIST[e].NAME)
				check = false;
		}
		if (check && PWD[i][0][0][0] != "..") {
			LIST = AddFileEplorerFloder(PWD[i][0][0][0], LIST, PARENT, PWD[i][0][0][3]);
			PARENT.N_ELEMENTS += 1;
			rectsape_folder(PARENT.id, undefined);
		}
	}
	
	var previous = undefined;
	for (var i = 0; LIST[i] != undefined; i++) {
		var obj = LIST[i];
		if (i == 0)
			previous = obj.y;
		else {
			var Y = previous + 24;
			obj.PARENT_DIFF_Y = (PARENT.y - Y) * (-1);
			previous = Y;
		}
	}
	return LIST;
}
