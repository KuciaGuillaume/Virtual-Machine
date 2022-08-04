/// @Project by Kucia Guillaume* ///


// CREATE VARIABLES
TYPE = undefined;
OPTION = undefined;
TAG = undefined;
image_alpha = 0;
CLOSE = false;

// INIT OPTION VARIABLES
FADE_IN = false;
FADE_SATE = false;
FADE_POWER = 0;
FIRST_PASS = false;

//FADE ON
FADE_ON = false;
FADE_ON_POWER = 0;

// INFO
INFO = false;
INFO_NAME = undefined;

// window
WINDOW = undefined;
Y_TARGET = 0;
OPT_CLOSING = false;
OBJECT_LINKED = undefined;
CREATE = false;

// VARIABLES FOR TERMINAL
USER_WRITE_POSITION = 16;
PWD = ON_MAIN_SCENE.PATH;
COMMAND = undefined;
WINDOW_TAG = undefined;
PATH = "/~";
COMMAND_HISTORY =   [undefined];
SAVING_TIME = 0;
SAVING_TIMER = 1.5;
CONNECT = false;
CONNECT_ID = 0;
CONNECTION = false;
CONNECTION_TIME = 0;
CATCH = false;
user_enter = undefined;
write_text = undefined;
pwd = undefined;
system_write = undefined;
BTN_HELP = undefined;
BTN_HISTORY = undefined;
BTN_CLEAR = undefined;
SAVING_LOAD = undefined;
CONNECT_AT_IMAGE = undefined;
CONNECT_AT_TEXT = undefined;
CONNECT_TO_YOU = undefined;
CONNECT_TO_YOU_TEXT = undefined;
// TERMINAL HELP MESSAGE
HELP_MESSAGE = "[" + AutoLanguage("HELP") + "] " + AutoLanguage("List of commands that may be useful to you") + ":\n\n";
HELP_MESSAGE = HELP_MESSAGE + "-" + AutoLanguage("help : View this post\n");
HELP_MESSAGE = HELP_MESSAGE + "-" + AutoLanguage("ls : Allows you to see the contents of the current folder or a specific folder\n");
HELP_MESSAGE = HELP_MESSAGE + "-" + AutoLanguage("cd : Allows you to move to the desired directory\n");
HELP_MESSAGE = HELP_MESSAGE + "-" + AutoLanguage("cd [..] : Move to the back directory\n");
HELP_MESSAGE = HELP_MESSAGE + "-" + AutoLanguage("mkdir : Allows you to create a directory\n");
HELP_MESSAGE = HELP_MESSAGE + "-" + AutoLanguage("rm : Allows you to delete a directory\n");
HELP_MESSAGE = HELP_MESSAGE + "-" + AutoLanguage("exit : To close the window\n");
HELP_MESSAGE = HELP_MESSAGE + "-" + AutoLanguage("getpid : Informs the process id\n");
HELP_MESSAGE = HELP_MESSAGE + "-" + AutoLanguage("connect : Allows you to connect to a specified id\n");
HELP_MESSAGE = HELP_MESSAGE + "-" + AutoLanguage("close : End of connection\n");
HELP_MESSAGE = HELP_MESSAGE + "-" + AutoLanguage("rename : Allows you to rename a folder or file\n");

// VARIABLES 