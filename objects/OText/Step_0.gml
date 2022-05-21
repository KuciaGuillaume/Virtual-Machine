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

if (!FIRST_PASS && !FADE_IN) { FIRST_PASS = true; image_alpha = 1; } 

// FADE_IN

if (FADE_IN && image_alpha != 1)
	image_alpha += FADE_POWER * delta_time;
else
	FADE_IN = false;
