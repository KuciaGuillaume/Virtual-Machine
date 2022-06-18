/// @Project by Kucia Guillaume* ///



// ROTATE IMG
image_angle += (0.0005 * delta_time);

// UPDATE TIMER

if (visible)
	TIME += delta_time / 1000000;

if (TIME < TIMER)
	return;

if (STATE == 0) {
	// CREATE REGISTER
	CreateObjects(960, 540, "Cursor", Ocursor, "CURSOR", "REGISTER_CURSOR", [undefined]);
	CreateTextButton(300, 400, Sregister_textbutton, "First Name", "Gp2", "Gp3", c_gray, Arial15, 20, "FULL_NAME", [undefined]);
	CreateTextButton(300, 460, Sregister_textbutton, "Last Name", "Gp2", "Gp3", c_gray, Arial15, 20, "LAST_NAME", [undefined]);
	CreateTextButton(300, 520, Sregister_textbutton, "E-mail address", "Gp2", "Gp3", c_gray, Arial15, 30, "EMAIL", [undefined]);
	CreateTextButton(300, 580, Sregister_textbutton, "Age", "Gp2", "Gp3", c_gray, Arial15, 2, "AGE", [undefined]);
	CreateTextButton(300, 640, Sregister_textbutton, "Password", "Gp2", "Gp3", c_gray, Arial15, 20, "Password 1", [["SECRET"], undefined]);
	CreateTextButton(300, 700, Sregister_textbutton, "Password again", "Gp2", "Gp3", c_gray, Arial15, 20, "Password 2", [["SECRET"], undefined]);
	CreateTextButton(300, 760, Sregister_textbutton, "Help sentence", "Gp2", "Gp3", c_gray, Arial10, 55, "HELP TEXT", [undefined]);
	CreateButtonBox(205, 1000, Sbox, OboxText, "Turn off the machine", "Gp2", "Gp3", Arial15, c_white, "TURN OFF", [["CENTERED"], undefined]);
	CreateButtonBox(450, 1000, Sbox, OboxText, "Restart the machine", "Gp2", "Gp3", Arial15, c_white, "RESTART MACHINE", [["CENTERED"], undefined]);
	CreateButtonBox(1700, 1000, Sbox_active, OboxText, "Register", "Gp2", "Gp3", Arial15, c_white, "REGISTER", [["CENTERED"], ["LOCK", ON_REGISTER_UPDATE], undefined]);
	AddText(300, 810, "Passwords are not the same !", Arial15, c_white, "Gp2", "REGISTER ERROR", [["CENTERED"], undefined]);
	DestroyText("LAUNCH_REGISTER");
	AddText(95, 200, "Please fill in your information", Arial35, c_white, "Gp2", "FILL", [undefined]);
	AddText(95, 280, "Your data is personal and will not be shared with anyone.\nCreate your account without fear.", Arial15, c_white, "Gp2", "FILL_DESCRIPTION", [undefined]);
	DestroyObject("REGISTER_LOAD");
}

if (STATE == 1) {
	DestroyText("TEXT_P_PROFILE");
	CreateObjectSprite(140, 397, "Gp2", Sicon_box, OJustGUI, "IMAGE", "GUI_ICON_BOX", [undefined]);
	CreateObjectSprite(440, 397, "Gp2", Sbackground_box, OJustGUI, "IMAGE", "GUI_BACKGROUND_BOX", [undefined]);
	AddText(140, 200, global.USER[1] + ", here you can edit your experience", Arial35, c_white, "Gp2", "EDIT_EXPERIENCE", [undefined]);
	AddText(140, 280, "Choose a profile picture that defines you!\nAs well as wallpapers to your tastes.", Arial15, c_white, "Gp2", "EDIT_EXPERIENCE_DESCRIPTION", [undefined]);
	CreateButtonBox(245, 1010, Sbox, OboxText, "Turn off the machine", "Gp2", "Gp3", Arial15, c_white, "TURN OFF", [["CENTERED"], undefined]);
	CreateButtonBox(490, 1010, Sbox, OboxText, "Restart the machine", "Gp2", "Gp3", Arial15, c_white, "RESTART MACHINE", [["CENTERED"], undefined]);
	CreateButtonBox(1450, 1010, Sbox, OboxText, "Previous", "Gp2", "Gp3", Arial15, c_white, "EDIT PREVIOUS", [["CENTERED"], undefined]); 
	CreateButtonImage(202.5, 464.5, SiconBox, Obox, "Gp3", "Gp4", Sfemme, OJustGUI, "EDIT_ICON_1", [["IMAGE_INDEX", 0], undefined]);
	CreateButtonImage(327.5, 464.5, SiconBox, Obox, "Gp3", "Gp4", Sfemme, OJustGUI, "EDIT_ICON_2", [["IMAGE_INDEX", 1], undefined]);
	CreateButtonImage(202.5, 600.2, SiconBox, Obox, "Gp3", "Gp4", Sfemme, OJustGUI, "EDIT_ICON_3", [["IMAGE_INDEX", 2], undefined]);
	CreateButtonImage(327.5, 600.2, SiconBox, Obox, "Gp3", "Gp4", Sfemme, OJustGUI, "EDIT_ICON_4", [["IMAGE_INDEX", 3], undefined]);
	CreateButtonImage(202.5, 735.9, SiconBox, Obox, "Gp3", "Gp4", Shomme, OJustGUI, "EDIT_ICON_5", [["IMAGE_INDEX", 0], undefined]);
	CreateButtonImage(327.5, 735.9, SiconBox, Obox, "Gp3", "Gp4", Shomme, OJustGUI, "EDIT_ICON_6", [["IMAGE_INDEX", 1], undefined]);
	CreateButtonImage(202.5, 871.6, SiconBox, Obox, "Gp3", "Gp4", Shomme, OJustGUI, "EDIT_ICON_7", [["IMAGE_INDEX", 2], undefined]);
	CreateButtonImage(327.5, 871.6, SiconBox, Obox, "Gp3", "Gp4", Shomme, OJustGUI, "EDIT_ICON_8", [["IMAGE_INDEX", 3], undefined]);
	CreateObjectSprite(506, 456, "Gp3", Sbackgrounds, OJustGUI, "IMAGE", "GUI_SELECT_BACKGROUNDS", [undefined]);
	var scrollbar = CreateObjectSprite(540, 670, "Gp4", Sscroll_image_bar, OJustGUI, "IMAGE", "SCROLL_IMAGE_BAR", [undefined]);
	scrollbar.image_alpha = 0;
	AddText(1520, 490, "BACKGROUND_TITLE", Arial25, c_white, "Gp4", "BACKGROUND_TITLE", [["CENTERED"], undefined]);
	AddText(1550, 680, "BACKGROUND_DESCRIPTION", Arial10, c_white, "Gp4", "BACKGROUND_DESCRIPTION", [["CENTERED"], undefined]);
	CreateButtonBox(1530, 850, Sselector, OboxText, "Select this one", "Gp3", "Gp4", Arial15, c_white, "BACKGROUND_SELECTOR", [["CENTERED"], undefined]);
	CreateButtonBox(1680, 1010, Sbox, OboxText, "Finish", "Gp2", "Gp3", Arial15, c_white, "EDIT_FINISH", [["CENTERED"], ["LOCK", ON_REGISTER_UPDATE], undefined]);
	CreateObjects(x, y, "Gp4", OnDraw, "DRAW", "ON_BACKGROUNDS", [undefined]);
	DestroyObject("LOAD_P_PROFILE");
}

if (STATE == 2) {
	DestroyObject("REGISTER_BACKGROUND");
	AddText(960, 540, "Hello", Arial25, c_white, "Gp1", "FINISH_MESSAGE", [["CENTERED"], undefined]);
	DestroyText("WAIT");
	DestroyObject("FINISH_LOAD");
}
