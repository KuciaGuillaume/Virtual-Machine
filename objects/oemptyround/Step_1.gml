for (var i = 0; OPTION[i] != undefined; i++) {
	if (OPTION[i][0] == "FADE_IN" && !FADE_SATE) { 
		FADE_IN = true; FADE_POWER = OPTION[i][1];
		FADE_SATE = true; image_alpha = 0;
	}
	if (OPTION[i][0] == "INDEX_IMAGE")
		image_index = OPTION[i][1];
	if (OPTION[i][0] == "FADE_ON") {FADE_ON = true; FADE_ON_POWER = OPTION[i][1]; }
	if (OPTION[i][0] == "INFO") {INFO = true; INFO_NAME = OPTION[i][1]; }
	if (OPTION[i][0] == "SLIDE") {SLIDE = true; SLIDE_POWER = OPTION[i][1]; }
	if (OPTION[i][0] == "EXT") {EXT = true; EXT_COLOR = OPTION[i][1]; EXT_RADIUS = OPTION[i][2]; EXT_SIZE = OPTION[i][3];}
	if (OPTION[i][0] == "SHADOW") {SHADOW = true; SHADOW_COLOR = OPTION[i][1]; SHADOW_SIZE = OPTION[i][2]; SHADOW_ALPHA = OPTION[i][3];}
}