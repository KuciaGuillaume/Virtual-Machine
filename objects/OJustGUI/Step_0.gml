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

// GUI SELECt
if (TAG == "GUI_SELECT_BACKGROUNDS") {

	var scroll_bar = GetObject("SCROLL_IMAGE_BAR");
	var Title = GetText("BACKGROUND_TITLE");
	var Description = GetText("BACKGROUND_DESCRIPTION");
	var button = GetObject("BACKGROUND_SELECTOR");

	if (MouseInside(bbox_left, bbox_right, bbox_top, bbox_bottom)) {
		if (mouse_wheel_down() && image_alpha >= 1)
			if (TARGET_INDEX < 5) TARGET_INDEX += 1 else TARGET_INDEX = 0;
		if (mouse_wheel_up() && image_alpha >= 1)
			if (TARGET_INDEX > 0) TARGET_INDEX -= 1 else TARGET_INDEX = 5;
		if (scroll_bar.image_alpha < 1)
			scroll_bar.image_alpha += 0.000005 * delta_time;
		if (scroll_bar.x < 540)
			scroll_bar.x += 0.00005 * delta_time;
		B_INSIDE = true;
	} else {
		if (scroll_bar.image_alpha > 0) {
			scroll_bar.image_alpha -= 0.000005 * delta_time;
			if (scroll_bar.x > 520)
				scroll_bar.x -= 0.00005 * delta_time;
		}
		B_INSIDE = false;
	}

	if (image_index != TARGET_INDEX && !PASS && image_alpha > 0)
		image_alpha -= 0.000003 * delta_time;
	else
		PASS = true;
	if (PASS && image_alpha < 1) {
		image_index = TARGET_INDEX;
		image_alpha += 0.000003 * delta_time;
	} else
		PASS = false
	// SET TEXT
	if (image_index == 0)
	{
		TITLE = "Windows 11 wallpaper";
		DESCRIPTION = "On June 15, 2021, nine days before the operating\nsystem was unveiled to the general public\nan internal build of the operating system\n(namely build 21996) was shared onto the Internet.\nIt introduced an entirely new wallpaper\nset consisting of CGI wallpapers, all of which are\nin 3840x2400 (or similar) as opposed to the 1920x1200 used\nin earlier versions, as 4K displays\nare more widespread now. Along with having default wallpapers\nfor both light and dark modes, there are four themes with\nfour wallpapers in each of them. Six N. Five\nhave confirmed themselves as the creators of\nthe two default wallpapers, as well as theme wallpapers\nalthough it is uncertain if they created all of those. XK studio\nare also known to have created the wallpapers\nof the Captured Motion theme.";
	}
	if (image_index == 1)
	{
		TITLE = "Ubuntu";
		DESCRIPTION = "Ubuntu is a Linux distribution based on Debian and\ncomposed mostly of free and open-source software.\nUbuntu is officially released in three editions:\nDesktop, Server, and Core for Internet of things devices\nand robots. All the editions can run on the computer alone\nor in a virtual machine. Ubuntu is a popular operating\nsystem for cloud computing, with support for OpenStack\nUbuntu's default desktop has been GNOME since version 17.10.";
	}
	if (image_index == 2)
	{
		TITLE = "Kali linux";
		DESCRIPTION = "Kali Linux is a Debian-derived Linux\ndistribution designed for digital forensics and\npenetration testing. It is maintained and funded by\nOffensive Security. Kali Linux has around 600\npenetration-testing programs (tools), including Armitage\n(a graphical cyber attack management tool), Nmap\n(a port scanner), Wireshark (a packet analyzer), metasploit\n(penetration testing framework), John the Ripper\n(a password cracker), sqlmap (automatic SQL\ninjection and database takeover tool), Aircrack-ng\n(a software suite for penetration-testing\nwireless LANs), Burp suite and OWASP ZAP web application\nsecurity scanners, etc.";
	}
	if (image_index == 3)
	{
		TITLE= "Win's Star wallpaper";
		DESCRIPTION = "Win's Start is the machine you are currently on!\nThe creation of the machine began in May 2022\nby Guillaume Kucia, who was then 19 years old\nYou should know that this\nmachine aims to look like the Windows OS while being\ndeveloped on a game engine! The goal here and\ntherefore to create a virtual machine that will\nact as a game environment.";
	}
	if (image_index == 4)
	{
		TITLE = "MacOs";
		DESCRIPTION = "macOS previously Mac OS X and later OS X) is\na Unix operating system developed and\nmarketed by Apple Inc. since 2001. It is the primary operating\nsystem for Apple's Mac computers. Within the market of desktop and\nlaptop computers it is the second most widely used\ndesktop OS, after Microsoft Windows\nand ahead of Chrome OS.macOS succeeded\nthe classic Mac OS, a Macintosh\noperating system with nine releases from 198\nto 1999. During this time, Apple cofounder Steve Jobs\nhad left Apple and started another company\nNeXT, developing the NeXTSTEP platform that would\nlater be acquired by\nApple to form the basis of macOS\nThe first desktop version, Mac OS X\n10.0, was released in March 2001, with\nits first update, 10.1,\narriving later that year.";
	}
	if (image_index == 5)
	{
		TITLE = "Wallpaper";
		DESCRIPTION = "This is a simple background";
	}

	scroll_bar.image_index = image_index;
	button.image_alpha = image_alpha;
	button.TEXT_CONNECT.image_alpha = image_alpha;
	button.WALLPAPER_INDEX = image_index;
	
	Title.TEXT = TITLE;
	Description.TEXT = DESCRIPTION; Description.image_alpha = image_alpha - 0.3;
}


// USER BACKGROUND
if (TAG == "USER_BACKGROUND" && !SKIP) {
	USER_TIME += delta_time / 1000000;
	if (!FIRST_PASS || USER_TIME >= USER_TIMER) {
		USER_TIME = 0;
		FIRST_PASS = true;
		randomize();
		var i = random_range(0, 15);
		var all_negative = true;
		for (; i == image_index || global.USER[9][i] < 0;) {
			i = random_range(0, 15);
			for (var e = 0; e != 15; e++)
				if (global.USER[9][e] >= 0) { all_negative = false; }
			if (all_negative) { i = 0; break; }
				
		}
		image_index = i;
		SAVE_LIST = [global.USER, "NULL"];
		savegame_save("USER", SAVE_LIST);
		var like = GetObject("LIKE");
		var dislike = GetObject("DISLIKE");
		if (like != "NULL" && dislike != "NULL") {
			like.image_index = 0;
			dislike.image_index = 0;
		}
	}
} else if (TAG == "USER_BACKGROUND") {
	FIRST_PASS = true;
	SKIP = false;
}

if (TAG == "IMAGE_WIFI" && ON_USER_INPUT.MODE == 1) {
	var power_off = GetObject("POWER_OFF");
	if (x > 1815)
		x -= 0.0001 * delta_time;
	else if (power_off == "NULL")
		CreateObjectSprite(1866, 1041.15, "Gp2", Spower_off, Obox, "BUTTON-NO-HAND", "POWER_OFF", [["INFO", "Power-off"], ["FADE_IN", 0.000001], "NULL"]);
}

if (TAG == "POWER_OPTION") {
	if (y > 912)
		y -= 0.0001 * delta_time;
}

if (TAG == "SYSTEM_LOAD") {
	image_angle += 0.001 * delta_time;
	image_xscale = 0.5;
	image_yscale = 0.5;
}
