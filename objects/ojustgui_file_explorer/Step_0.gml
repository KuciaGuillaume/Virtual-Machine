/// @Project by Kucia Guillaume* ///

if (TAG == "NULL")
	return;

if (!FIRST_PASS && !FADE_IN) {image_alpha = 2; FIRST_PASS = true; } 

// FADE_IN

if (FADE_IN && image_alpha < 1)
	image_alpha += FADE_POWER * delta_time;
else
	FADE_IN = false;

if (CLOSE && string_count("FILE_EXPLORER", WINDOW_TAG)) {
	DestroyObject(TAG);
}

if ((WINDOW != "NULL" && instance_exists(WINDOW)) && !CLOSE && string_count("FILE_EXPLORER", WINDOW.TAG) ) {
	
	if (CREATE) {

	}
	if (!CREATE) {
		
		// ON CREATE
		
	} else if (CREATE && (WINDOW.ON || WINDOW.REDUCING || !WINDOW.FADE_MOVEMENT)) {
		
	}
	return;
}