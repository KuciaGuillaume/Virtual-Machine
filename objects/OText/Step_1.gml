// GET OPTION
for (var i = 0; OPTION[i] != undefined; i++) {
	if (OPTION[i][0] == "CENTERED")
		CENTERED = true;
	if (OPTION[i][0] == "BACK") { BACK = true; BACK_POWER = OPTION[i][1]; }
	if (OPTION[i][0] == "FADE_IN" && !FADE_SATE) { 
		FADE_IN = true; FADE_POWER = OPTION[i][1];
		FADE_SATE = true; image_alpha = 0;
	}
}