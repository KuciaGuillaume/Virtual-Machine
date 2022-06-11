/// @Project by Kucia Guillaume* ///


if (!UPDATE_STATE)
	return;

/// UPDATE REGISTER ERROR

var REGISTER = GetText("REGISTER ERROR");

if (REGISTER != undefined) {
	
	// INIT¨PASSWORD STATE
	REGISTER_STATE = true;
	
	// GET TEXT
	var PASSWORD1 = GetWrite("Password 1");
	var PASSWORD2 = GetWrite("Password 2");
	var PASS1 = PASSWORD1.TEXT_OUTPUT;
	var PASS2 = PASSWORD2.TEXT_OUTPUT;

	// PASSWORD ERROR 
	if (PASS1 != PASS2) { REGISTER_STATE = false; REGISTER.TEXT = "Passwords are not the same"; }
	if (string_byte_length(PASS1) < 5 || string_byte_length(PASS2) < 5) { REGISTER_STATE = false; REGISTER.TEXT = "Password too short"; }
	
	// AGE ERROR
	var get_age = GetWrite("AGE");
	var age = get_age.TEXT_OUTPUT;
	if (!is_numeric(CharToNum(string_char_at(age, 1))) || (!is_numeric(CharToNum(string_char_at(age, 2))) && string_char_at(age, 2) != "")) { REGISTER_STATE = false; REGISTER.TEXT = "Age can only be number"; }
	
	
	// MAIL ERROR
	var get_mail = GetWrite("EMAIL");
	var mail = get_mail.TEXT_OUTPUT;
	var num_a = 0;
	var size = string_byte_length(mail);
	var end_mail = "";
	var all_end = ["gmail.com", "yahoo.com", "hotmail.com", "aol.com", "hotmail.co.uk", "hotmail.fr", "msn.com", "yahoo.fr", "wanadoo.fr", "orange.fr", "comcast.net", "yahoo.co.uk", "yahoo.com.br", "yahoo.co.in", "live.com", "rediffmail.com", "free.fr", "gmx.de", "web.de", "yandex.ru", "ymail.com", "libero.it", "outlook.com", "icloud.com", "icloud.fr", "epitech.eu", undefined];
	var find = false;
	
	// MAIL LOOP
	for (var i = 0; i < size; i++) {
		var char = string_char_at(mail, i + 1);
		if (char == "@")
			num_a += 1;
	}
	for (var i = size; i != 0 && string_char_at(mail, i) != "@";) i--;
	if (i == 0) { find = true; REGISTER_STATE = false; REGISTER.TEXT = "You did not enter the domain.\n   Example: '.com', '.fr'..."; }
	for (var e = 1; i - 2 != size; i++) {
		var char = string_char_at(mail, i + 1);
		end_mail = string_insert(end_mail, char, e);
		e += 1;
	}
	end_mail = ReverseStr(end_mail);
	// FINAL MAIL
	for (var i = 0; all_end[i] != undefined; i++)
		if (end_mail == all_end[i])
			find = true;
	if (!find) { REGISTER_STATE = false; REGISTER.TEXT = "Your domain name is invalid : ' " + end_mail + " '"; }
	if (string_char_at(mail, 1) == "@") { REGISTER_STATE = false; REGISTER.TEXT = "Please fill in the information before the '@'"; }
	if (num_a > 1) { REGISTER_STATE = false; REGISTER.TEXT = "you can only insert '@' once"; }
	if (num_a < 1) { REGISTER_STATE = false; REGISTER.TEXT = "Your email does not contain '@'"; }
	if (size < 5) { REGISTER_STATE = false; REGISTER.TEXT = "Your email address is too short"; }
	
	
	// NAME ERROR
	var full_name = GetWrite("FULL_NAME");
	var last_name = GetWrite("LAST_NAME");
	var helper = GetWrite("HELP TEXT");
	var not_registe = undefined;
	var g = 0;

	if (helper != undefined) global.USER[8] = helper.TEXT_OUTPUT;
	if (helper.TEXT_OUTPUT == PASSWORD1.TEXT_OUTPUT || helper.TEXT_OUTPUT == PASSWORD2.TEXT_OUTPUT ) { REGISTER_STATE = false; REGISTER.TEXT = "Your 'help sentence' cannot be the same\n               as the password"; }
	if (helper.TEXT_OUTPUT == helper.INITIAL_TEXT) { REGISTER_STATE = false; not_registe = helper.INITIAL_TEXT; g++; }
	if (PASSWORD2.TEXT_OUTPUT == PASSWORD2.INITIAL_TEXT) { REGISTER_STATE = false; not_registe = PASSWORD2.INITIAL_TEXT; g++; }
	if (PASSWORD1.TEXT_OUTPUT == PASSWORD1.INITIAL_TEXT) { REGISTER_STATE = false; not_registe = PASSWORD1.INITIAL_TEXT; g++; }
	if (get_age.TEXT_OUTPUT == get_age.INITIAL_TEXT) { REGISTER_STATE = false; not_registe = get_age.INITIAL_TEXT; g++; }
	if (get_mail.TEXT_OUTPUT == get_mail.INITIAL_TEXT) { REGISTER_STATE = false; not_registe = get_mail.INITIAL_TEXT; g++; }
	if (last_name.TEXT_OUTPUT == last_name.INITIAL_TEXT) { REGISTER_STATE = false; not_registe = last_name.INITIAL_TEXT; g++; }
	if (full_name.TEXT_OUTPUT == full_name.INITIAL_TEXT) { REGISTER_STATE = false; not_registe = full_name.INITIAL_TEXT; g++; }
	if (not_registe != undefined)
		REGISTER.TEXT = "' " + not_registe + " ' was not filled in";
	
	if (g == 6) REGISTER.TEXT = "";
	
	LOCK_STATE = REGISTER_STATE;
	if (REGISTER_STATE)
		REGISTER.visible = false;
	else
		REGISTER.visible = true;
}

if (global.USER[6][0] != undefined && global.USER[7] >= 0) {
	var next = GetText("EDIT_FINISH");
	if (next != undefined) { next.image_alpha = 1; LOCK_STATE = true; }
}

