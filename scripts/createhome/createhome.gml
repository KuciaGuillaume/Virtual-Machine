// Les actifs du script ont changé pour v2.3.0 Voir
// https://help.yoyogames.com/hc/en-us/articles/360005277377 pour plus d’informations
function CreateHome() {
	if (ON_MAIN_SCENE.HOME == undefined) {
		ON_MAIN_SCENE.HOME = CreateObjectSprite(960, 700, "Home_Gp0", S_Home_BK, OHomeBk, "IMAGE", "HOME_BK", [["FADE_IN", 0.000005], ["SLIDE", 0.0001], undefined]);
		CreateObjectSprite(1210, 973, "Home_Gp1", S_Home_power, OHomeBox, "BUTTON-NO-HAND", "HOME_POWER", [["INFO", "Power"], ["FADE_IN", 0.000005], ["SLIDE", 0.0001], undefined]);
		var icon = undefined;
		if (global.USER[6][0] == 0)
			icon = CreateObjectSprite(710, 973, "Gp2", Shomme, OJustGUI, "IMAGE", "HOME_USER_ICON", [["INDEX_IMAGE", global.USER[6][1]], ["FADE_IN", 0.00001], undefined]);
		else
			icon = CreateObjectSprite(710, 973, "Gp2", Sfemme, OJustGUI, "IMAGE", "HOME_USER_ICON", [["INDEX_IMAGE", global.USER[6][1]], ["FADE_IN", 0.00001], undefined]);
		icon.image_xscale = 0.3;
		icon.image_yscale = 0.3;
	} else if (ON_MAIN_SCENE.HOME.image_alpha >= 1) {
		DestroyHome();
		CreateHome();
	}

}

function DestroyHome() {
	ON_MAIN_SCENE.HOME.TIMER_OUT = true;
	ON_MAIN_SCENE.HOME.TIMER_TIME = 0.1;
	var get = GetObject("HOME_POWER"); get.TIMER_OUT = true; get.TIMER_TIME = 0.1;
	var get = GetObject("HOME_USER_ICON"); get.TIMER_OUT = true; get.TIMER_TIME = 0.1;
}