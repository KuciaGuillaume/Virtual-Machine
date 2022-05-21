/// @Project by Kucia Guillaume* ///

// CREATE TYPE
TYPE = "NULL";

// CREATE TIMER

TIME = 0;
TIMER = global.TIMER
MODE = global.RstartMode;
LOADING_TEXT = "NULL";
REGISTER = false;


// SELECT MODE TYPE

if (MODE == "START") {
	if (global.USER[0] == "NULL") {
		LOADING_TEXT = "Your machine is being initialized...";
		REGISTER = false;
	} else {
		LOADING_TEXT = "Hi " +  global.USER[1] + ", your machine is loading...";
		TIMER /= 4;
		REGISTER = true;
	}
}
if (MODE == "END")
	LOADING_TEXT = "Your machine is about to shutdown";
if (MODE == "RESTART")
	LOADING_TEXT = "Restarting the machine...";

