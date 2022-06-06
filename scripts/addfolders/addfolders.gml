// Les actifs du script ont changé pour v2.3.0 Voir
// https://help.yoyogames.com/hc/en-us/articles/360005277377 pour plus d’informations

function no_one_here(X, Y, LIST) {
	
	var one = true;
	for (var i = 0; LIST[i] != "NULL"; i++)
		if (LIST[i].x == X && LIST[i].y == Y)
			one = false;
	return one;
}

function AddFolders(NAME, MODE) {

	// ICON DESK
	if (MODE == "START") {
		var folder = CreateObjectSprite(NAME[1], NAME[2], "Gp0", S_Folder, OJustGUI, "BUTTON-NO-HAND", NAME[0] + "FOLDERS", ["NULL"]);
		folder.TEXT_CONNECT = AddText(NAME[1], NAME[2] + 30, NAME[0], Arial10, c_white, "Gp1", NAME[0] + "FOLDERS_TEXT", [["CENTERED"], "NULL"]);
		folder.WRITE = CreateWrite(NAME[0] + "WRITE", 20, "Gp2", NAME[0]);
		folder.WRITE.ON_WRITE = false;
		return folder;
	}
	var path = ON_MAIN_SCENE.FOLDERS;
	var X = 100;
	var Y = 100;
	for (var i = 0; !no_one_here(X, Y, path); i++)
		if (Y >= 900) {Y = 100; X += 100; } else { Y += 100; }
	class = [NAME, X, Y];
	var folder = CreateObjectSprite(X, Y, "Gp0", S_Folder, OJustGUI, "BUTTON-NO-HAND", NAME + "FOLDERS", ["NULL"]);
	ON_MAIN_SCENE.FOLDERS = addtolist(folder, ON_MAIN_SCENE.FOLDERS);
	folder.TEXT_CONNECT = AddText(X, Y + 30, NAME, Arial10, c_white, "Gp1", NAME + "FOLDERS_TEXT", [["CENTERED"], "NULL"]);
	folder.WRITE = CreateWrite(NAME + "WRITE", 20, "Gp2", NAME);
	folder.WRITE.ON_WRITE = false;
	ON_MAIN_SCENE.NAME_FOLDERS = addtolist(class, ON_MAIN_SCENE.NAME_FOLDERS);
	return folder;
}
