/// @Project by Kucia Guillaume* ///


// ROTATE IMG
image_angle += (0.0005 * delta_time);

// LOADING TIME
TIME += delta_time / 1000000;
if (TIME >= TIMER) {
	if (!REGISTER && MODE == "START")
		room = Rregister;
	if (MODE == "END")
		game_end(0);
	if (MODE == "RESTART") {
		if (TIMER == 5.1)
			game_restart();
		visible = false;
		Ostart_background.visible = false;
		LOADING_TEXT = "";
		TIMER = 5.1;
		TIME = 0;
	}
}
