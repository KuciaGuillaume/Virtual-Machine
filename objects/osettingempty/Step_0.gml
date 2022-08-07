/// @Project by Kucia Guillaume* ///

IMAGE_WIDTH = SIZE_X;
IMAGE_HEIGHT = SIZE_Y;
DevKit(id);


if (PARENT != undefined && AUTO_PLACE) {
	x = PARENT.x + REF_X;
	y = PARENT.y + REF_Y;
	if (TEXT_CONNECT != undefined) {
		TEXT_CONNECT.x = x + TEXT_REF_X; TEXT_CONNECT.y = y + TEXT_REF_Y; }
	if (OBJECT_LINKED != undefined) {
		OBJECT_LINKED.x = x + OBJ_REF_X; OBJECT_LINKED.y = y + OBJ_REF_Y; }
	image_alpha = PARENT.image_alpha;
	if (OBJECT_LINKED != undefined)
		OBJECT_LINKED.image_alpha = PARENT.image_alpha;
	if (TEXT_CONNECT != undefined)
		TEXT_CONNECT.image_alpha = PARENT.image_alpha;
}

if (PARENT != undefined) {
	if (PARENT.TAG + "BAR_CURRENT_NETWORK_SPEED" == TAG) {
		var objective = MathPercentOf2(global.GAME_VALUE[6][0], global.GAME_VALUE[6][1], 370);
		
		if (objective > SIZE_X)
			SIZE_X += (Diff(x + SIZE_X, x + objective) * (delta_time * 0.000005));
		else
			SIZE_X -= (Diff(x + SIZE_X, x + objective) * (delta_time * 0.000005));
			
		PARENT.SNETWORK_OBJECT[OBJECT_LINKED][1] = Diff(id.x, ((x + SIZE_X) - string_width(TEXT_CONNECT.TEXT)) - 50);
		TEXT_CONNECT.TEXT = string(global.GAME_VALUE[6][0]) + " Mb/s"; 
	}
}

if (PARENT != undefined && string_count("EDIT_LANGUAGE_CHANGE", TAG) > 0) {
	
	var pressed = false;
	if (LANGUAGE_BUTTON_SELECT == undefined && MouseInsideRound(id) && global.SETTINGS[7] != LANGUAGE && PARENT.WINDOW.ON) {
	
		var pos_x = Diff(PARENT.x, (x + SIZE_X) - 110);
		var pos_y = Diff(PARENT.y, y + 10);
		var word = AutoLanguage("Select");
		var empt_text = GetEmptText(CenterStr((x + SIZE_X) - 60, word), MidleStr( y + 26, word), word, Segoe10, c_gray, #262626, PARENT.WINDOW.LAYERS[2]);
		LANGUAGE_BUTTON_SELECT = CreateEmptyButton(OSettingEmpty, pos_x, pos_y, 100, 30, #F8FAFF, #F8FAFF, PARENT.WINDOW.LAYERS[1], undefined, empt_text, PARENT.TAG + "ACCOUNT_EDIT_LANGUAGE_SELECT" + TAG, "EMPT_BUTTON", [undefined]);
		LANGUAGE_BUTTON_SELECT.REF_X = pos_x;
		LANGUAGE_BUTTON_SELECT.REF_Y = pos_y;
		LANGUAGE_BUTTON_SELECT.EXT = true;
		LANGUAGE_BUTTON_SELECT.EXT_COLOR = #EAEEF1;
		PARENT.WINDOW.list_objects = addtolist(LANGUAGE_BUTTON_SELECT, PARENT.WINDOW.list_objects);
		PARENT.SACCOUNT_OBJECT = addtolist([LANGUAGE_BUTTON_SELECT, pos_x, pos_y, 1], PARENT.SACCOUNT_OBJECT);
	} else if (LANGUAGE_BUTTON_SELECT != undefined && (!MouseInsideRound(id) || global.SETTINGS[7] == LANGUAGE)) {
		PARENT.SACCOUNT_OBJECT = remove_findlist_index(LANGUAGE_BUTTON_SELECT, PARENT.SACCOUNT_OBJECT, 0);
		PARENT.WINDOW.list_objects = remove_findlist(LANGUAGE_BUTTON_SELECT, PARENT.WINDOW.list_objects);
		DestroyEmptyButton(LANGUAGE_BUTTON_SELECT.TAG);
		LANGUAGE_BUTTON_SELECT = undefined;
	}
	
	if (LANGUAGE_BUTTON_SELECT != undefined && mouse_check_button_pressed(mb_left) && MouseInsideRound(LANGUAGE_BUTTON_SELECT)) {
		global.SETTINGS[7] = LANGUAGE;
		pressed = true;
	}
	
	if (global.SETTINGS[7] == LANGUAGE && LANGUAGE_CHECKER == undefined) {
		LANGUAGE_CHECKER = CreateObjectSprite(x, y, PARENT.WINDOW.LAYERS[2], S_SAccount_Check, OJustGUI, "IMAGE", PARENT.TAG + "LANGUAGE_SELECT" + TAG, [undefined]);
		PARENT.WINDOW.list_objects = addtolist(LANGUAGE_CHECKER, PARENT.WINDOW.list_objects);
		PARENT.SACCOUNT_OBJECT = addtolist([LANGUAGE_CHECKER, Diff(PARENT.x, (x + SIZE_X) - 40), Diff(PARENT.y, (y + 10)), 1], PARENT.SACCOUNT_OBJECT);
		if (pressed)
			CreateAdminRequirement( AutoLanguage("Language change"), AutoLanguage("A change of language during the execution of the machine can\ncause some bugs. We advise you to do a restart."),  AutoLanguage("To restart") ,  AutoLanguage("Do not restart") , S_SAccount_EDIT_LANGUAGE, "EDIT_LANGUAGE");
	} else if (global.SETTINGS[7] != LANGUAGE && LANGUAGE_CHECKER != undefined) {
		PARENT.SACCOUNT_OBJECT = remove_findlist_index(LANGUAGE_CHECKER, PARENT.SACCOUNT_OBJECT, 0);
		PARENT.WINDOW.list_objects = remove_findlist(LANGUAGE_CHECKER, PARENT.WINDOW.list_objects);
		DestroyObject(LANGUAGE_CHECKER.TAG);
		LANGUAGE_CHECKER = undefined;
	}
	
	if (global.Requirement.state == "FINISH" && global.Requirement.type == "EDIT_LANGUAGE" && global.Requirement.response == true) {
		global.Requirement.state = "OFF";
		global.Requirement.type = undefined;
		global.Requirement.response = false;
		Machine("RESTART");
	}
	
} 

if (string_count("UPDATE_BUTTON", TAG) > 0 && PARENT != undefined && TAG != "UPDATE_BUTTON_MOVER" && PARENT.WINDOW.ON) {
	
	if (mouse_check_button_pressed(mb_left) && MouseInsideRound(id)) {
		CLICK = true;
		if (PARENT.TAG + "NEWS_UPDATE_BUTTON" != TAG) {
			PARENT.SUPDATE_OBJECT = remove_findlist_index(GetObject(PARENT.TAG + "UPDATE_NEWS_ARTICLE"), PARENT.SUPDATE_OBJECT, 0);
			DestroyObject(PARENT.TAG + "UPDATE_NEWS_ARTICLE");
		} else {
			// CREATE ARTCILE NEWS
			var NEWS = CreateObjectSprite(PARENT.x, PARENT.y, PARENT.WINDOW.LAYERS[0], News_Article_Update, OJustButtonSettings, "IMAGE", PARENT.TAG + "UPDATE_NEWS_ARTICLE", [undefined]);
			PARENT.WINDOW.list_objects = addtolist(NEWS, PARENT.WINDOW.list_objects);
			PARENT.SUPDATE_OBJECT = addtolist([NEWS, -100, 180, 1], PARENT.SUPDATE_OBJECT);
			NEWS.SET_DISPLAY_LEFT = true;
			NEWS.IMAGE_TOP = 0;
			NEWS.IMAGE_HEIGHT = 370;
			NEWS.IMAGE_LEFT = 0;
			NEWS.IMAGE_WIDTH = 450;
			NEWS.PARENT = PARENT;
			if (global.SETTINGS[7] == "ENGLISH")
				NEWS.image_index = 0;
			else if (global.SETTINGS[7] == "FRENCH")
				NEWS.image_index = 1;
		}
	} else if (mouse_check_button_pressed(mb_left) && !MouseInsideRound(id) && MouseInside(PARENT.x - 100, PARENT.x + 350, PARENT.y + 120, PARENT.y + 160)) {
		CLICK = false;
		TEXT_COLOR_1 = c_gray;
		TEXT_COLOR_2 = #262626;
	}
		
	if (CLICK && instance_exists(OBJECT_LINKED)) {
		var self_index = FindListIndex(id, PARENT.SUPDATE_OBJECT, 0);
		self_index = PARENT.SUPDATE_OBJECT[self_index][1];
		var index = FindListIndex(OBJECT_LINKED, PARENT.SUPDATE_OBJECT, 0);
		var distance = Diff(PARENT.SUPDATE_OBJECT[index][1], self_index);
		if (PARENT.SUPDATE_OBJECT[index][1] > self_index)
			PARENT.SUPDATE_OBJECT[index][1] -= (distance) * (delta_time * 0.00001);
		else if (PARENT.SUPDATE_OBJECT[index][1] < self_index)
			PARENT.SUPDATE_OBJECT[index][1] += (distance) * (delta_time * 0.00001);
		if (distance < 5) {
			TEXT_COLOR_1 = #262626;
			TEXT_COLOR_2 = #262626;
		}
	}
	
}

// CLICK
if (!mouse_check_button_pressed(mb_left) || !MouseInsideRound(id) || !ON) return;

if (PARENT != undefined && PARENT.TAG + "ACCOUNT_EDIT_PASSWORD_APPLY" == TAG) {
	if (OBJECT_LINKED.write.TEXT_OUTPUT == OBJECT_LINKED.write.INITIAL_TEXT)
		return;
	if (string_byte_length(OBJECT_LINKED.write.TEXT_OUTPUT) < 5) {  CreateNotification(Ssystem_icon, AutoLanguage("Error"), AutoLanguage("Password too short"), PARENT.TAG + "PASSWORD_EDIT_ERROR"); return; }
	if (OBJECT_LINKED.write.TEXT_OUTPUT == global.USER[5]) {  CreateNotification(Ssystem_icon, AutoLanguage("Error"), AutoLanguage("Your password must be\ndifferent from the old one"), PARENT.TAG + "PASSWORD_EDIT_ERROR=="); return; }
	global.USER[5] = OBJECT_LINKED.write.TEXT_OUTPUT;
	OBJECT_LINKED.write.TEXT = [OBJECT_LINKED.write.INITIAL_TEXT, undefined];
	OBJECT_LINKED.write.TEXT_INDEX = 1;
	OBJECT_LINKED.write.TEXT_INDEX_MAX = 1;
	CreateNotification(Ssystem_icon, AutoLanguage("Success"), AutoLanguage("Your passwords have been changed"), PARENT.TAG + "PASSWORD_EDIT_SUCCESS");
}

if (PARENT != undefined && PARENT.TAG + "ACCOUNT_NAME_APPLY" == TAG) {
	if (OBJECT_LINKED.write.TEXT_OUTPUT == OBJECT_LINKED.write.INITIAL_TEXT)
		return;
	if (string_byte_length(OBJECT_LINKED.write.TEXT_OUTPUT) < 2) {  CreateNotification(Ssystem_icon, AutoLanguage("Error"), AutoLanguage("Name too short"), PARENT.TAG + "ACCOUNT_NAME_EDIT_ERROR"); return; }
	
	var name = "";
	var last_name = "";
	var output = OBJECT_LINKED.write.TEXT_OUTPUT;
	for (var i = 0; i < string_byte_length(output) && string_char_at(output, i + 1) != "\n"; i++)
		name = name + string_char_at(output, i + 1);
	i += 1;
	for (; i < string_byte_length(output); i++)
		last_name = last_name + string_char_at(output, i + 1);
	if (OBJECT_LINKED.write.TEXT_OUTPUT == name + " " + last_name) {  CreateNotification(Ssystem_icon, AutoLanguage("Error"), AutoLanguage("Your name must be\ndifferent from the old one"), PARENT.TAG + "ACCOUNT_NAME_EDIT_ERROR"); return; }
	global.USER[1] = name;
	global.USER[2] = last_name;
	OBJECT_LINKED.write.INITIAL_TEXT = name + " " + last_name;
	OBJECT_LINKED.write.TEXT = [OBJECT_LINKED.write.INITIAL_TEXT, undefined];
	OBJECT_LINKED.write.TEXT_INDEX = 1;
	OBJECT_LINKED.write.TEXT_INDEX_MAX = 1;
	CreateNotification(Ssystem_icon, AutoLanguage("Success"), AutoLanguage("Your name account have been changed"), PARENT.TAG + "ACCOUNT_NAME_EDIT_SUCCESS");
	
	DestroySAccount(PARENT);
	CreateSAccount(PARENT);
}

if (PARENT != undefined && PARENT.TAG + "ACCOUNT_EMAIL_APPLY" == TAG) {
	if (OBJECT_LINKED.write.TEXT_OUTPUT == OBJECT_LINKED.write.INITIAL_TEXT)
		return;
		
	// MAIL ERROR
	var mail =  OBJECT_LINKED.write.TEXT_OUTPUT;
	var num_a = 0;
	var size = string_byte_length(mail);
	var end_mail = "";
	var all_end = ["gmail.com", "yahoo.com", "hotmail.com", "aol.com", "hotmail.co.uk", "hotmail.fr", "msn.com", "yahoo.fr", "wanadoo.fr", "orange.fr", "comcast.net", "yahoo.co.uk", "yahoo.com.br", "yahoo.co.in", "live.com", "rediffmail.com", "free.fr", "gmx.de", "web.de", "yandex.ru", "ymail.com", "libero.it", "outlook.com", "icloud.com", "icloud.fr", "epitech.eu", undefined];
	var find = false;
	
	// MAIL LOOP
	for (var i = 0; i < size; i++) {
		var char = string_char_at(mail, i + 1);
		if (char == "@")
			num_a += 1;
	}
	for (var i = size; i != 0 && string_char_at(mail, i) != "@";) i--;
	if (i == 0) { CreateNotification(Ssystem_icon, AutoLanguage("Error"), AutoLanguage("You did not enter the domain") + ".\n   Example: '.com', '.fr'...", PARENT.TAG + "ACCOUNT_EMAIL_EDIT_ERROR"); return; }
	for (var e = 1; i - 2 != size; i++) {
		var char = string_char_at(mail, i + 1);
		end_mail = string_insert(end_mail, char, e);
		e += 1;
	}
	end_mail = ReverseStr(end_mail);
	// FINAL MAIL
	for (var i = 0; all_end[i] != undefined; i++)
		if (end_mail == all_end[i])
			find = true;
	if (!find) {CreateNotification(Ssystem_icon, AutoLanguage("Error"), AutoLanguage("Your domain name is invalid") + " : ' " + end_mail + " '", PARENT.TAG + "ACCOUNT_EMAIL_EDIT_ERROR"); return; }
	if (string_char_at(mail, 1) == "@") {CreateNotification(Ssystem_icon, AutoLanguage("Error"), AutoLanguage("Please fill in the information before the") + " '@'", PARENT.TAG + "ACCOUNT_EMAIL_EDIT_ERROR"); return; }
	if (num_a > 1) {CreateNotification(Ssystem_icon, AutoLanguage("Error"), AutoLanguage("you can only insert '@' once"), PARENT.TAG + "ACCOUNT_EMAIL_EDIT_ERROR"); return; }
	if (num_a < 1) {CreateNotification(Ssystem_icon, AutoLanguage("Error"), AutoLanguage("Your email does not contain '@'"), PARENT.TAG + "ACCOUNT_EMAIL_EDIT_ERROR"); return; }
	if (size < 5) {CreateNotification(Ssystem_icon, AutoLanguage("Error"), AutoLanguage("Your email address is too short"), PARENT.TAG + "ACCOUNT_EMAIL_EDIT_ERROR"); return; }
		
	global.USER[3] = mail;
	OBJECT_LINKED.write.INITIAL_TEXT = mail;
	OBJECT_LINKED.write.TEXT = [OBJECT_LINKED.write.INITIAL_TEXT, undefined];
	OBJECT_LINKED.write.TEXT_INDEX = 1;
	OBJECT_LINKED.write.TEXT_INDEX_MAX = 1;
	CreateNotification(Ssystem_icon, AutoLanguage("Success"), AutoLanguage("Your email address have been changed"), PARENT.TAG + "ACCOUNT_NAME_EDIT_SUCCESS");
	
	DestroySAccount(PARENT);
	CreateSAccount(PARENT);
}

if (string_count("SET-ING", TAG) > 0) {
	for (var i = 0; PARENT.all_settings[i] != undefined; i++)
		PARENT.all_settings[i].SETTING_SELECT = false;
	SETTING_SELECT = true;
	PARENT.OBJECT_SELECT_INDEX = id;
	PARENT.SETTING_TITLE.TEXT = string_upper(TEXT_CONNECT.TEXT);
	PARENT.OBJECT_SELECT_RUN = true;

	DestroySSystemDisplay(PARENT);
	DestroySSystemSound(PARENT);
	DestroySSystemPersonalize(PARENT);
	DestroySSystemStorage(PARENT);
	DestroySSystemAbout(PARENT);
	DestroySSystem(PARENT);

	DestroySNetwork(PARENT);
	
	DestroySAccount(PARENT);
	
	DestroySUpdate(PARENT);

	if (string_count("SYSTEM", TAG) > 0 && string_count("POWER", TAG) == 0)
		CreateSSystem(PARENT);
	
	if (string_count("NETWORK", TAG) > 0)
		CreateSNetwork(PARENT);
		
	if (string_count("ACCOUNT", TAG) > 0)
		CreateSAccount(PARENT);
		
	if (string_count("UPDATE", TAG) > 0)
		CreateSUpdate(PARENT);
}

if (PARENT != undefined && PARENT.TAG + "SSDISPLAY" == TAG) {
	PARENT.SETTING_TITLE.TEXT = PARENT.SETTING_TITLE.TEXT + "/" +  AutoLanguage("DISPLAY");
	PARENT.SETTING_TITLE_FX = 20;
	DestroySSystemDisplay(PARENT);
	DestroySSystem(PARENT);
	CreateSystemDisplay(PARENT);
}

if (PARENT != undefined && PARENT.TAG + "SSSOUND" == TAG) {
	PARENT.SETTING_TITLE.TEXT = PARENT.SETTING_TITLE.TEXT + "/" + AutoLanguage("SOUND");
	PARENT.SETTING_TITLE_FX = 20;
	DestroySSystemSound(PARENT);
	DestroySSystem(PARENT);
	CreateSystemSound(PARENT);
}

if (PARENT != undefined && PARENT.TAG + "SSPERSONALIZE" == TAG) {
	PARENT.SETTING_TITLE.TEXT = PARENT.SETTING_TITLE.TEXT + "/" + AutoLanguage("PERSONALIZE");
	PARENT.SETTING_TITLE_FX = 20;
	DestroySSystemPersonalize(PARENT);
	DestroySSystem(PARENT);
	CreateSystemPersonalize(PARENT);
}

if (PARENT != undefined && PARENT.TAG + "SSSTORAGE" == TAG) {
	PARENT.SETTING_TITLE.TEXT = PARENT.SETTING_TITLE.TEXT + "/" + AutoLanguage("STORAGE");
	PARENT.SETTING_TITLE_FX = 20;
	DestroySSystemStorage(PARENT);
	DestroySSystem(PARENT);
	CreateSystemStorage(PARENT);
}

if (PARENT != undefined && PARENT.TAG + "SSABOUT" == TAG) {
	PARENT.SETTING_TITLE.TEXT = PARENT.SETTING_TITLE.TEXT + "/" + AutoLanguage("ABOUT");
	PARENT.SETTING_TITLE_FX = 20;
	DestroySSystemAbout(PARENT);
	DestroySSystem(PARENT);
	CreateSystemAbout(PARENT);
}

if (PARENT != undefined && PARENT.TAG + "SYSTEM_BACK" == TAG) {
	if (PARENT.SETTING_TITLE.TEXT == AutoLanguage("SYSTEM") + "/" + AutoLanguage("DISPLAY")) {
		PARENT.SETTING_TITLE.TEXT = AutoLanguage("SYSTEM");
		DestroySSystemDisplay(PARENT);
		DestroySSystem(PARENT);
		CreateSSystem(PARENT);
	}
	if (PARENT.SETTING_TITLE.TEXT == AutoLanguage("SYSTEM") + "/" + AutoLanguage("SOUND")) {
		PARENT.SETTING_TITLE.TEXT = AutoLanguage("SYSTEM");
		DestroySSystemSound(PARENT);
		DestroySSystem(PARENT);
		CreateSSystem(PARENT);
	}
	if (PARENT.SETTING_TITLE.TEXT == AutoLanguage("SYSTEM") + "/" + AutoLanguage("PERSONALIZE")) {
		PARENT.SETTING_TITLE.TEXT = AutoLanguage("SYSTEM");
		DestroySSystemPersonalize(PARENT);
		DestroySSystem(PARENT);
		CreateSSystem(PARENT);
	}
	if (PARENT.SETTING_TITLE.TEXT == AutoLanguage("SYSTEM") + "/" + AutoLanguage("STORAGE")) {
		PARENT.SETTING_TITLE.TEXT = AutoLanguage("SYSTEM");
		DestroySSystemStorage(PARENT);
		DestroySSystem(PARENT);
		CreateSSystem(PARENT);
	}
	if (PARENT.SETTING_TITLE.TEXT == AutoLanguage("SYSTEM") + "/" + AutoLanguage("ABOUT")) {
		PARENT.SETTING_TITLE.TEXT = AutoLanguage("SYSTEM");
		DestroySSystemAbout(PARENT);
		DestroySSystem(PARENT);
		CreateSSystem(PARENT);
	}

}

if (PARENT != undefined && PARENT.TAG + "DISPLAY_APPLY_CHANGES" == TAG) {

// "2715 x 1527"

	var res = SELECTV2_CONNECT.TEXT_CONNECT.TEXT;
	global.SETTINGS[2] = res;

	var left = "";
	for (var i = 1; string_char_at(res, i) != " "; i++)
		left = left + string_char_at(res, i);
	
	var right = "";
	i += 3;
	for (; i < string_byte_length(res) + 1 && string_char_at(res, i) != "(" && string_char_at(res, i) != " "; i++)
		right = right + string_char_at(res, i);
		
	var width = real(left);
	var height = real(right);

	var custom = GetObject(PARENT.TAG + "CUSTOM_CHECKER" + "CHECKER_SELECTOR");
	
	window_set_fullscreen(global.SETTINGS[4]);
	if (!custom.CHECKER_STATE)
		window_set_size(width, height);
	else {
		var left = GetObject(PARENT.TAG +  "CUSTOM_LEFT");
		var right = GetObject(PARENT.TAG +  "CUSTOM_RIGHT");
		
		left = left.TEXT;
		right = right.TEXT;
		global.SETTINGS[3] = [left, right, true];
		window_set_size(real(left), real(right));
	}
}

