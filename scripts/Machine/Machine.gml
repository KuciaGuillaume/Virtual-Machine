
function Machine(OPTION){
	if (OPTION == "RESTART") {	global.RstartMode = "RESTART"; room = Rstart; }
	if (OPTION == "END") {	global.RstartMode = "END"; room = Rstart; }
	if (OPTION == "STANDBY") {
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

		global.TIMER = 0.5;

		// PATH AND FOLDERS

		global.PATH = undefined;
		global.FOLDERS = [undefined];

		// WINDOW'S PIN

		global.WINDOWS_PIN = [undefined];

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

		LOAD_LIST = [global.USER, global.PATH, global.FOLDERS, global.WINDOWS_PIN, global.SETTINGS, global.SOUNDS, global.GAME_VALUE, undefined];

		// LOAD
		LOAD_LIST = savegame_load("USER", LOAD_LIST);
		global.USER = LOAD_LIST[0];
		global.PATH = LOAD_LIST[1];
		global.FOLDERS = LOAD_LIST[2];
		global.WINDOWS_PIN = LOAD_LIST[3];
		global.SETTINGS = LOAD_LIST[4];
		global.SOUNDS = LOAD_LIST[5];
		room = RUserConnection;
	}
}