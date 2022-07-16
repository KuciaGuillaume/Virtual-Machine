/// @Project by Kucia Guillaume* ///


// CREATE GLOBAL WINDOW LAYER
global.layer_depth = [undefined];
global.last_layer_id = 5000;

// CREATE ALL OBJECTS STOCKAGE

CLASS = [undefined, undefined, room];
global.OBJECTS = [undefined];
global.BUTTONS = [undefined];

// CREATE GLOBAL WRITE

global.WRITE = [undefined];

// CREATE GLOBAL TEXT

global.TEXT = [undefined];

// CREATE GLOBAL START STATE VARIABLES

global.RstartMode = "START";

// INIT_TIMER

global.TIMER = 2;

// PATH AND FOLDERS

global.PATH = undefined;
global.FOLDERS = [undefined];

// WINDOW'S PIN

global.WINDOWS_PIN = [undefined];


// SETTINGS
var BRIGHTNESS = 100;
var NIGHT_VISION = false;
var WINDOW_SIZE = "1920 x 1080";
var CUSTOM_RES = ["1920", "1080", false];
var FULLSCREEN = true;
var FRAMERATE = false;
global.SETTINGS = [BRIGHTNESS, NIGHT_VISION, WINDOW_SIZE, CUSTOM_RES, FULLSCREEN, FRAMERATE, undefined];


// CREATE DATE
global.DATE = {
	DAY : undefined,
	MONTH : undefined,
	YEAR : undefined,
	TIME : [undefined, undefined]
};

// CREATE USERS VARAIBLES

STATE = undefined;
FIRST_NAME = "NULL";
LAST_NAME = "NULL";
EMAIL = "NULL";
AGE = "NULL";
PASSWORD = "NULL";
ICON = [undefined, -1];
BACKGROUND = -1;
HELPING_PASSWORD = "NULL";
LIKE_LIST = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];

global.USER = [STATE, FIRST_NAME, LAST_NAME, EMAIL, AGE, PASSWORD, ICON, BACKGROUND, HELPING_PASSWORD, LIKE_LIST];

// CREATE LOAD_LIST

LOAD_LIST = [global.USER, global.PATH, global.FOLDERS, global.WINDOWS_PIN, global.SETTINGS, undefined];

// LOAD
LOAD_LIST = savegame_load("USER", LOAD_LIST);
global.USER = LOAD_LIST[0];
global.PATH = LOAD_LIST[1];
global.FOLDERS = LOAD_LIST[2];
global.WINDOWS_PIN = LOAD_LIST[3];
global.SETTINGS = LOAD_LIST[4];


window_set_fullscreen(global.SETTINGS[4]);


// SCREEN LOAD

	var res = global.SETTINGS[2];

	var left = "";
	for (var i = 1; string_char_at(res, i) != " "; i++)
		left = left + string_char_at(res, i);
	
	var right = "";
	i += 3;
	for (; i < string_byte_length(res) + 1 && string_char_at(res, i) != "(" && string_char_at(res, i) != " "; i++)
		right = right + string_char_at(res, i);
		
	var width = real(left);
	var height = real(right);
	
	if (!global.SETTINGS[3][2])
		window_set_size(width, height);
	else {
		var left = global.SETTINGS[3][0];
		var right = global.SETTINGS[3][1];

		window_set_size(real(left), real(right));
	}

// LOAD GAME
room = RMainScene;
