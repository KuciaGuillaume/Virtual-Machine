

/// @description Insert description here
// You can write your code in this editor

DevKit(id);


// TAG FINISH_MESSAGE
if (TAG == "FINISH_MESSAGE") {
	FINISH_TIME += delta_time / 1000000;
	image_alpha += 0.000001 * delta_time;
	if (FINISH_TIME >= FINISH_TIMER) {
		FINISH_TIME = 0;
		image_alpha = 0;
		STEP += 1;
	}
	if (STEP == 0) { TEXT = AutoLanguage("Hello"); }
	if (STEP == 1) { TEXT = AutoLanguage("We prepare your system..."); }
	if (STEP == 2) { TEXT = AutoLanguage("Let's go"); }
	if (STEP == 3) { room = RUserConnection; }
}

if (TAG == "CURRENT_TIME" || TAG == "CURRENT_DATE") {

	switch ((current_year + current_month + current_day) % 7) {
		case 6: DAY = AutoLanguage("Monday"); break;
		case 0: DAY = AutoLanguage("Tuesday"); break;
		case 1: DAY = AutoLanguage("Wednesday"); break;
		case 2: DAY = AutoLanguage("Thusday"); break;
		case 3: DAY = AutoLanguage("Friday"); break;
		case 4: DAY = AutoLanguage("Saturday"); break;
		case 5: DAY = AutoLanguage("Sunday"); break;
	}

	switch (current_month) {
		case 1: MONTH = AutoLanguage("January"); break;
		case 2: MONTH = AutoLanguage("February"); break;
		case 3: MONTH = AutoLanguage("March"); break;
		case 4: MONTH = AutoLanguage("April"); break;
		case 5: MONTH = AutoLanguage("May"); break;
		case 6: MONTH = AutoLanguage("June"); break;
		case 7: MONTH = AutoLanguage("July"); break;
		case 8: MONTH = AutoLanguage("August"); break;
		case 9: MONTH = AutoLanguage("September"); break;
		case 10: MONTH = AutoLanguage("October"); break;
		case 11: MONTH = AutoLanguage("November"); break;
		case 12: MONTH = AutoLanguage("December"); break;
	}

	var CURRENT_MINUTE = string(current_minute);

	if (current_minute < 10)
		CURRENT_MINUTE = "0" + CURRENT_MINUTE;

	if (TAG == "CURRENT_TIME") TEXT = string(current_hour) + ":" + CURRENT_MINUTE;
	if (TAG == "CURRENT_DATE") TEXT = DAY + " " + string(current_day) + " " + MONTH;

}

if (TAG == "HOME_DATE")
	TEXT = global.DATE.DAY + "/" + global.DATE.MONTH + "/" + global.DATE.YEAR + " | " + global.DATE.TIME[0] + ":" + global.DATE.TIME[1];
	
if (TAG == "FRAMERATE_TEXT")
	TEXT = string(fps);

if (mouse_x < x - (TEXT_WIDTH / 2) || mouse_x > x + (TEXT_WIDTH/2) ||
	mouse_y < y - (TEXT_HEIGHT/2) || mouse_y > y + (TEXT_HEIGHT/2))
		return;

if (!mouse_check_button_pressed(mb_left))
	return;

if (TAG == "FORGOT")
	CreateNotification(Ssystem_icon, AutoLanguage("Your reminder phrase"), global.USER[8], "REMEMBER_SENTENCE");
