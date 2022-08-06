// Les actifs du script ont changé pour v2.3.0 Voir
// https://help.yoyogames.com/hc/en-us/articles/360005277377 pour plus d’informations
function CreateHome() {
	if (ON_MAIN_SCENE.HOME == undefined) {
		ON_MAIN_SCENE.HOME = CreateObjectSprite(960, 700, "Home_Gp0", S_Home_BK, OHomeBk, "IMAGE", "HOME_BK", [["FADE_IN", 0.000005], ["SLIDE", 0.0001], undefined]);
		CreateObjectSprite(1210, 973, "Home_Gp1", S_Home_power, OHomeBox, "BUTTON-NO-HAND", "HOME_POWER", [["INFO", AutoLanguage("Power")], ["FADE_IN", 0.000005], ["SLIDE", 0.0001], undefined]);
		var icon = undefined;
		if (global.USER[6][0] == 0)
			icon = CreateObjectSprite(710, 973, "Home_Gp1", Shomme, OJustGUI, "IMAGE", "HOME_USER_ICON", [["INDEX_IMAGE", global.USER[6][1]], ["SLIDE", 0.0001], ["FADE_IN", 0.000005], undefined]);
		else
			icon = CreateObjectSprite(710, 973, "Home_Gp1", Sfemme, OJustGUI, "IMAGE", "HOME_USER_ICON", [["INDEX_IMAGE", global.USER[6][1]], ["SLIDE", 0.0001], ["FADE_IN", 0.000005], undefined]);
		icon.image_xscale = 0.3;
		icon.image_yscale = 0.3;
		icon.TEXT_CONNECT = AddText(730, 973, global.USER[1], Segoe8, c_black, "Home_Gp1", "HOME_USER_NAME", [["BACK", 5], undefined]);
		var search = CreateTextButton(960, 450, S_Home_search, AutoLanguage("Type here to search"), "Home_Gp1", "Home_Gp2", c_black, Arial10, 45, "HOME_SEARCH", [["EDIT", 30, -4], ["SLIDE", 0.0001], ["FADE_IN", 0.000005], undefined]);
		search.write.BAR.image_index = 1;
		search.write.ON_WRITE = true;
		ON_MAIN_SCENE.HOME.SEARCH = search;
		ON_MAIN_SCENE.HOME.ALL_APPS = AddText(715, 490, AutoLanguage("All Apps"), Segoe10, c_black, "Home_Gp1", "HOME_TEXT_ALL_APS", [["SLIDE", 0.0001], ["FADE_IN", 0.000005], undefined]);
		ON_MAIN_SCENE.HOME.RECOMMANDED = AddText(715, 790, AutoLanguage("Recommanded"), Segoe10, c_black, "Home_Gp1", "HOME_TEXT_ALL_RECOMMANDED", [["SLIDE", 0.0001], ["FADE_IN", 0.000005], undefined]);
		var date = CreateEmptyRound(OHomeEmpty, 900, 963, #DFDFDF, 120, 20, "Home_Gp1", "HOME_DATE_BACK", [["SLIDE", 0.0001], ["FADE_IN", 0.000005], undefined]);
		date.TEXT_CONNECT = AddText(960, 973, "", Arial10, c_black, "Home_Gp2", "HOME_DATE", [["CENTERED"], undefined]);
		CreateHomeApps();
		
	} else if (ON_MAIN_SCENE.HOME.image_alpha >= 1) {
		DestroyHome();
		CreateHome();
	}

}

function CreateHomeApps() {
	if (ON_MAIN_SCENE.HOME == undefined)
		return;
		// CREATE EXPLORER
		
		var file_ex_txt = StrLimit(AutoLanguage("File_explorers"), 13);

		ON_MAIN_SCENE.HOME.ALL_APPS_LIST = [undefined];
		var empt = GetEmptLinked(790, 550, "Home_Gp2", S_File_explorer_icon, OJustGUI, "IMAGE");
		var empt_text = GetEmptText(790, 550, file_ex_txt, Arial10, c_black, c_white, "Home_Gp2");
		
		ON_MAIN_SCENE.HOME.ALL_EXPLORERS = CreateEmptyButton(OHomeEmpty, 790, 550, 150, 50, #EEEEEE, #9DBBD5, "Home_Gp1", empt, empt_text, "HOME_FILE_EXPLORERS", "EMPT_BUTTON-NO-HAND", [["AUTO_CLASS"], ["CENTERED"], ["SLIDE", 0.0001], ["FADE_IN", 0.000005], undefined]);
		ON_MAIN_SCENE.HOME.ALL_APPS_LIST = addtolist([file_ex_txt, ON_MAIN_SCENE.HOME.ALL_EXPLORERS, empt, empt_text, "HOME_FILE_EXPLORERS"], ON_MAIN_SCENE.HOME.ALL_APPS_LIST);
		
		// CREATE TERMINAL
		var empt = GetEmptLinked(790, 550, "Home_Gp2", S_terminal_icon, OJustGUI, "IMAGE");
		var empt_text = GetEmptText(790, 550, AutoLanguage("Terminal"), Arial10, c_black, c_white, "Home_Gp2");
		
		ON_MAIN_SCENE.HOME.ALL_TERMINAL = CreateEmptyButton(OHomeEmpty, 960, 550, 150, 50, #EEEEEE, #9DBBD5, "Home_Gp1", empt, empt_text, "HOME_FILE_TERMINAL", "EMPT_BUTTON-NO-HAND", [["AUTO_CLASS"], ["CENTERED"], ["SLIDE", 0.0001], ["FADE_IN", 0.000005], undefined]);
		ON_MAIN_SCENE.HOME.ALL_APPS_LIST = addtolist([AutoLanguage("Terminal"), ON_MAIN_SCENE.HOME.ALL_TERMINAL, empt, empt_text, "HOME_FILE_TERMINAL"], ON_MAIN_SCENE.HOME.ALL_APPS_LIST);

		// CREATE SETTINGS
		var empt = GetEmptLinked(790, 550, "Home_Gp2", S_Settings_Icon, OJustGUI, "IMAGE");
		var empt_text = GetEmptText(790, 550, AutoLanguage("Settings"), Arial10, c_black, c_white, "Home_Gp2");
		
		ON_MAIN_SCENE.HOME.ALL_SETTINGS = CreateEmptyButton(OHomeEmpty, 1130, 550, 150, 50, #EEEEEE, #9DBBD5, "Home_Gp1", empt, empt_text, "HOME_FILE_SETTINGS", "EMPT_BUTTON-NO-HAND", [["AUTO_CLASS"], ["CENTERED"], ["SLIDE", 0.0001], ["FADE_IN", 0.000005], undefined]);
		ON_MAIN_SCENE.HOME.ALL_APPS_LIST = addtolist([AutoLanguage("Settings"), ON_MAIN_SCENE.HOME.ALL_SETTINGS, empt, empt_text, "HOME_FILE_SETTINGS"], ON_MAIN_SCENE.HOME.ALL_APPS_LIST);
}

function DestroyHomeApps() {
	if (ON_MAIN_SCENE.HOME == undefined)
		return;
	if (ON_MAIN_SCENE.HOME.RECOMMANDED != undefined)
		DestroyText(ON_MAIN_SCENE.HOME.RECOMMANDED.TAG);
	ON_MAIN_SCENE.HOME.RECOMMANDED = undefined;
	if (ON_MAIN_SCENE.HOME.ALL_EXPLORERS != undefined) 
		DestroyEmptyButton(ON_MAIN_SCENE.HOME.ALL_EXPLORERS.TAG);
	ON_MAIN_SCENE.HOME.ALL_EXPLORERS = undefined;
	if (ON_MAIN_SCENE.HOME.ALL_TERMINAL != undefined)
		DestroyEmptyButton(ON_MAIN_SCENE.HOME.ALL_TERMINAL.TAG);
	ON_MAIN_SCENE.HOME.ALL_TERMINAL = undefined;
	if (ON_MAIN_SCENE.HOME.ALL_SETTINGS != undefined)
		DestroyEmptyButton(ON_MAIN_SCENE.HOME.ALL_SETTINGS.TAG);
	ON_MAIN_SCENE.HOME.ALL_SETTINGS = undefined;
	for (var i = 0; ALL_APPS_LIST[i] != undefined; i++)
		ALL_APPS_LIST[i][1] = undefined;
	for (var m = 0; ON_MAIN_SCENE.HOME.ALL_FILES_LIST[m] != undefined; m++)
		DestroyEmptyButton(ON_MAIN_SCENE.HOME.ALL_FILES_LIST[m].TAG);
	ON_MAIN_SCENE.HOME.ALL_FILES_LIST = [undefined];
}

function DestroyHome() {
	if (ON_MAIN_SCENE.HOME == undefined)
		return;
	ON_MAIN_SCENE.HOME.TIMER_OUT = true;
	ON_MAIN_SCENE.HOME.TIMER_TIME = 0.1;
	ON_MAIN_SCENE.HOME.CLOSE = true;
	var Files = ON_MAIN_SCENE.HOME.ALL_FILES_LIST;
	for (var z = 0; Files[z] != undefined; z++)
		DestroyEmptyButton(Files[z].TAG);
	ON_MAIN_SCENE.HOME.ALL_FILES_LIST = [undefined];
	var get = GetObject("HOME_POWER");
	if (get.OPTION_MENU != undefined) {
		for (var i = 0; get.OPTION_MENU.BUTTONS[i] != undefined; i++) {
			var btn = get.OPTION_MENU.BUTTONS[i];
			DestroyText(btn.TEXT_CONNECT.TAG);
			DestroyObject(btn.OBJECT_LINKED.TAG);
			DestroyObject(btn.TAG);
		}
		DestroyObject(get.OPTION_MENU.TAG); get.OPTION_MENU = undefined;
	}
	get.TIMER_OUT = true; get.TIMER_TIME = 0.1;
	var get = GetObject("HOME_USER_ICON"); get.TIMER_OUT = true; get.TIMER_TIME = 0.1;
	var get = GetObject("HOME_SEARCH"); get.write.ON_WRITE = false; get.TIMER_OUT = true; get.TIMER_TIME = 0.1;
	var get = GetText("HOME_TEXT_ALL_APS"); if (get != undefined) { get.TIMER_OUT = true;  get.TIMER_TIME = 0.1; }
	var get = GetText("HOME_TEXT_ALL_RECOMMANDED"); if (get != undefined) { get.TIMER_OUT = true;  get.TIMER_TIME = 0.1; }
	var get = GetObject("HOME_FILE_EXPLORERS"); if (get != undefined) { get.TIMER_OUT = true; get.TIMER_TIME = 0.1; get.OBJECT_LINKED.TIMER_OUT = true; get.OBJECT_LINKED.TIMER_TIME = 0.1; }
	var get = GetObject("HOME_FILE_TERMINAL"); if (get != undefined) { get.TIMER_OUT = true; get.TIMER_TIME = 0.1;get.OBJECT_LINKED.TIMER_OUT = true; get.OBJECT_LINKED.TIMER_TIME = 0.1; }
	var get = GetObject("HOME_FILE_SETTINGS"); if (get != undefined) { get.TIMER_OUT = true; get.TIMER_TIME = 0.1;get.OBJECT_LINKED.TIMER_OUT = true; get.OBJECT_LINKED.TIMER_TIME = 0.1; }
	var get = GetObject("HOME_DATE_BACK"); if (get != undefined) { get.TIMER_OUT = true;  get.TIMER_TIME = 0.1; }
}