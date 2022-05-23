/// @description Insert description here
// You can write your code in this editor

// GET OPTION
for (var i = 0; OPTION[i] != "NULL"; i++) {
	if (OPTION[i][0] == "CENTERED")
		CENTERED = true;
	if (OPTION[i][0] == "FADE_IN" && !FADE_SATE) { 
		FADE_IN = true; FADE_POWER = OPTION[i][1];
		FADE_SATE = true;
	}
}

if (!FIRST_PASS && !FADE_IN && TAG != "FINISH_MESSAGE") { FIRST_PASS = true; image_alpha = 1; } 

// FADE_IN

if (FADE_IN && image_alpha != 1)
	image_alpha += FADE_POWER * delta_time;
else
	FADE_IN = false;


// TAG FINISH_MESSAGE
if (TAG == "FINISH_MESSAGE") {
	FINISH_TIME += delta_time / 1000000;
	image_alpha += 0.000001 * delta_time;
	if (FINISH_TIME >= FINISH_TIMER) {
		FINISH_TIME = 0;
		image_alpha = 0;
		STEP += 1;
	}
	if (STEP == 0) { TEXT = "Hello"; }
	if (STEP == 1) { TEXT = "We prepare your system..."; }
	if (STEP == 2) { TEXT = "Let's go"; }
	if (STEP == 3) { room = RUserConnection; }
}

if (TAG == "CURRENT_TIME" || TAG == "CURRENT_DATE") {

	switch ((current_year + current_month + current_day) % 7) {
		case 6: DAY = "Monday"; break;
		case 0: DAY = "Tuesday"; break;
		case 1: DAY = "Wednesday"; break;
		case 2: DAY = "Thusday"; break;
		case 3: DAY = "Friday"; break;
		case 4: DAY = "Saturday"; break;
		case 5: DAY = "Sunday"; break;
	}

	switch (current_month) {
		case 1: MONTH = "January"; break;
		case 2: MONTH = "February"; break;
		case 3: MONTH = "March"; break;
		case 4: MONTH = "April"; break;
		case 5: MONTH = "May"; break;
		case 6: MONTH = "June"; break;
		case 7: MONTH = "July"; break;
		case 8: MONTH = "August"; break;
		case 9: MONTH = "September"; break;
		case 10: MONTH = "October"; break;
		case 11: MONTH = "November"; break;
		case 12: MONTH = "December"; break;
	}

	var CURRENT_MINUTE = string(current_minute);

	if (current_minute < 10)
		CURRENT_MINUTE = "0" + CURRENT_MINUTE;

	if (TAG == "CURRENT_TIME") TEXT = string(current_hour) + ":" + CURRENT_MINUTE;
	if (TAG == "CURRENT_DATE") TEXT = DAY + " " + string(current_day) + " " + MONTH;

}
