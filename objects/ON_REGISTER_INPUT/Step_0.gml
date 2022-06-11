/// @Project by Kucia Guillaume* ///



// EXIT GAME

if (KeyPressed(vk_escape))
	game_end(0);
if (KeyPressed(vk_insert)) {
	var g_name = GetWrite("FULL_NAME");
	var g_last = GetWrite("LAST_NAME");
	var g_email = GetWrite("EMAIL");
	var g_age = GetWrite("AGE");
	var g_password = GetWrite("Password 1");
	var g_password2 = GetWrite("Password 2");
	var g_help = GetWrite("HELP TEXT");
	
	g_name.TEXT = ["ADMIN", undefined];
	g_last.TEXT = ["ADMIN", undefined];
	g_email.TEXT = ["ADMIN@gmail.com", undefined];
	g_age.TEXT = ["55", undefined];
	g_password.TEXT = ["ADMIN55", undefined];
	g_password2.TEXT = ["ADMIN55", undefined];
	g_help.TEXT = ["ADMIN PASSWORD", undefined];
}
