/// @Project by Kucia Guillaume* ///

if (TAG == "NULL")
	return;
for (var i = 0; OPTION[i] != "NULL"; i++) {
	if (OPTION[i][0] == "FADE_IN" && !FADE_SATE) { 
		FADE_IN = true; FADE_POWER = OPTION[i][1];
		FADE_SATE = true; image_alpha = 0;
	}
	if (OPTION[i][0] == "INDEX_IMAGE")
		image_index = OPTION[i][1];
	if (OPTION[i][0] == "FADE_ON") {FADE_ON = true; FADE_ON_POWER = OPTION[i][1]; }
	if (OPTION[i][0] == "INFO") {INFO = true; INFO_NAME = OPTION[i][1]; }
}

if (!FIRST_PASS && !FADE_IN) {image_alpha = 2; FIRST_PASS = true; } 

// FADE_IN

if (FADE_IN && image_alpha < 1)
	image_alpha += FADE_POWER * delta_time;
else
	FADE_IN = false;

if (WINDOW != "NULL" && instance_exists(WINDOW)) {
	if (string_count("TERMINAL", WINDOW.TAG) && !CREATE) {
		
		CREATE = true;
	} else if (string_count("TERMINAL", WINDOW.TAG) && CREATE && WINDOW.ON) {
		
	}
}