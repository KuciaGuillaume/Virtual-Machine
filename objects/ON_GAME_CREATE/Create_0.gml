/// @Project by Kucia Guillaume* ///


// CREATE GLOBAL WINDOW LAYER
global.layer_depth = ["NULL"];
global.last_layer_id = 5000;

// CREATE ALL OBJECTS STOCKAGE

CLASS = ["NULL", "NULL", room];
global.OBJECTS = ["NULL"];

// CREATE GLOBAL WRITE

global.WRITE = ["NULL"];

// CREATE GLOBAL TEXT

global.TEXT = ["NULL"];

// CREATE GLOBAL START STATE VARIABLES

global.RstartMode = "START";

// INIT_TIMER

global.TIMER = 0;

// PATH AND FOLDERS

global.PATH = "NULL";
global.FOLDERS = ["NULL"];

// WINDOW'S PIN

global.WINDOWS_PIN = ["NULL"];

// CREATE USERS VARAIBLES

STATE = "NULL";
FIRST_NAME = "NULL";
LAST_NAME = "NULL";
EMAIL = "NULL";
AGE = "NULL";
PASSWORD = "NULL";
ICON = ["NULL", -1];
BACKGROUND = -1;
HELPING_PASSWORD = "NULL";
LIKE_LIST = ["NULL"];

global.USER = [STATE, FIRST_NAME, LAST_NAME, EMAIL, AGE, PASSWORD, ICON, BACKGROUND, HELPING_PASSWORD, LIKE_LIST];

// CREATE LOAD_LIST

LOAD_LIST = [global.USER, global.PATH, global.FOLDERS, global.WINDOWS_PIN, "NULL"];

// LOAD
LOAD_LIST = savegame_load("USER", LOAD_LIST);
global.USER = LOAD_LIST[0];
global.PATH = undefined;
global.FOLDERS = undefined;
global.WINDOWS_PIN = LOAD_LIST[3];



// LOAD GAME
room = RMainScene;
