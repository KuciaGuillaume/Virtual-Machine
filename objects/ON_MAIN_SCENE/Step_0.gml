/// @description Insert description here
// You can write your code in this editor

var CTRL = KeyPress(vk_control);

if (CTRL && KeyPressed(ord("T"))) {
	CreateWindow(Sterminal_bk, "TERMINAL", S_terminal_icon, "Terminal");
	setforfolders(FOLDERS, false);
	ON_DESK = false;
}
if (mouse_check_button_pressed(mb_left))
	check_all_off()
