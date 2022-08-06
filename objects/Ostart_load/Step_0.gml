/// @Project by Kucia Guillaume* ///

// LOADING TIME
TIME += delta_time / 1000000;

if (TIME >= TIMER) {
	if (!REGISTER && MODE == "START")
		room = Rregister;
	else if (REGISTER && MODE == "START")
		room = RUserConnection;
	if (MODE == "END")
		game_end();
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

if (TIME >= 2 && MODE == "START") {
	TIME = 0;
	TIMER -= 2;
	var rand = random_range(0, array_size(LOADS_TEXT));
	LOADING_TEXT = LOADS_TEXT[rand];
}