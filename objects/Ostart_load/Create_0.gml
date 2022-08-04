/// @Project by Kucia Guillaume* ///

// CREATE TYPE
TYPE = undefined;

// CREATE TIMER

TIME = 0;
TIMER = global.TIMER
MODE = global.RstartMode;
LOADING_TEXT = undefined;
REGISTER = false;

LOADS_TEXT = [AutoLanguage("Data recovery"), AutoLanguage("Inventory retrieval"),
AutoLanguage("Server initialization"), AutoLanguage("Connection to instances"),
AutoLanguage("Creation of temporary files"), AutoLanguage("Component checks"),
AutoLanguage("Securing overheating"), AutoLanguage("Desktop initialization"), undefined];

// SELECT MODE TYPE

if (MODE == "START") {
	if (global.USER[0] == undefined) {
		LOADING_TEXT = AutoLanguage("Your machine is being initialized...");
		REGISTER = false;
	} else {
		LOADING_TEXT = AutoLanguage("Hi") + " " +  global.USER[1] + ", " + AutoLanguage("your machine is loading...");
		TIMER /= 4;
		REGISTER = true;
	}
}
if (MODE == "END")
	LOADING_TEXT = AutoLanguage("Your machine is about to shutdown");
if (MODE == "RESTART")
	LOADING_TEXT = AutoLanguage("Restarting the machine...");

