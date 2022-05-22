/// @Project by Kucia Guillaume* ///

// CREATE OBJECTS
CreateObjects(960, 540, "Cursor",  Ocursor, "CURSOR", "CURSOR", ["NULL"]);
CreateObjectSprite(0, 0, "Gp1", Suser_connect_background, OJustGUI, "IMAGE", "USER_BACKGROUND", [["FADE_IN", 0.0000005], "NULL"]);
AddText(960, 240, "16:01", Segoe75, c_white, "Gp2", "CURRENT_TIME", [["CENTERED"],["FADE_IN", 0.0000005], "NULL"]);
AddText(960, 320, "dimanche 22 mai", Arial15, c_white, "Gp2", "CURRENT_DATE", [["CENTERED"],["FADE_IN", 0.0000005], "NULL"]);
CreateButtonBox(1737.5, 56.75, Sphoto, OboxText, "Do you like the displayed image ?", "Gp2", "Gp3", Arial10, c_white, "PHOTO", [["CENTERED"], ["POSITIONS", 1737.5, 90], "NULL"]);
