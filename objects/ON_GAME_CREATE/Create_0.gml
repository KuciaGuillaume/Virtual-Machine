/// @Project by Kucia Guillaume* ///


randomize();

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

global.TIMER = 1;

// PATH AND FOLDERS

global.PATH = undefined;
global.FOLDERS = [undefined];

// WINDOW'S PIN

global.WINDOWS_PIN = [undefined];

// GAME VALUE
var STOCKAGE_SPACE = 10;
var STOCKAGE_USE = 0;
var PROCESSEUR = ["AGI Electron T3 @ ", 1.27];
var RAM = 2;
var GRAPHIC_CARD = ["Triton NI-50", 2];
var MOTHERBOARD = ["Master Z-300", 2];
var NETWORK = [1, 1];
global.GAME_VALUE = [STOCKAGE_SPACE, STOCKAGE_USE, PROCESSEUR, RAM, GRAPHIC_CARD, MOTHERBOARD, NETWORK, undefined];


// SETTINGS
var BRIGHTNESS = 100;
var NIGHT_VISION = false;
var WINDOW_SIZE = "1920 x 1080";
var CUSTOM_RES = ["1920", "1080", false];
var FULLSCREEN = true;
var FRAMERATE = false;
var CURSOR = "MAC";
var LANGUAGE = "ENGLISH";
global.SETTINGS = [BRIGHTNESS, NIGHT_VISION, WINDOW_SIZE, CUSTOM_RES, FULLSCREEN, FRAMERATE, CURSOR, LANGUAGE ,undefined];

// SOUND
var GENERAL_SOUND = 50;
var NOTIFICATION_SOUND = 50;
global.SOUNDS = [GENERAL_SOUND, NOTIFICATION_SOUND];

global.MegaLangue = 
[
/* A */ [undefined],
/* B */ [undefined],
/* C */ [undefined],
/* D */ [undefined],
/* E */ [undefined],
/* F */ [undefined],
/* G */ [undefined],
/* H */ [undefined],
/* I */ [undefined],
/* J */ [undefined],
/* K */ [undefined],
/* L */ [undefined],
/* M */ [undefined],
/* N */ [undefined],
/* O */ [undefined],
/* P */ [undefined],
/* K */ [undefined],
/* R */ [undefined],
/* S */ [undefined],
/* T */ [undefined],
/* U */ [undefined],
/* V */ [undefined],
/* W */ [undefined],
/* X */ [undefined],
/* Y */ [undefined],
/* Z */ [undefined],

];

// ADD LANGUAGE TRADUCTION
AddTraduction( [["Pin from taskbar", "ENGLISH"], ["Épingler à la barre des tâches", "FRENCH"]] );
AddTraduction( [["Unpin from taskbar", "ENGLISH"], ["Détacher de la barre des tâches", "FRENCH", "FRENCH"]] );
AddTraduction( [["Apply", "ENGLISH"], ["Appliquer", "FRENCH"]] );
AddTraduction( [["You do not have permission to modify this file/folder", "ENGLISH"], ["Vous n'êtes pas autorisé à modifier ce fichier/dossier", "FRENCH"]] );
AddTraduction( [["Stop", "ENGLISH"], ["Arrêt", "FRENCH"]] );
AddTraduction( [["Restart", "ENGLISH"], ["Redémarrer", "FRENCH"]] );
AddTraduction( [["Desk", "ENGLISH"], ["Bureau", "FRENCH"]] );
AddTraduction( [["Downloads", "ENGLISH"], ["Téléchargements", "FRENCH"]] );
AddTraduction( [["Newfolder", "ENGLISH"], ["Nouveau dossier", "FRENCH"]] );
AddTraduction( [["Currently select", "ENGLISH"], ["Sélectionnez actuellement", "FRENCH"]] );
AddTraduction( [["Select this one", "ENGLISH"], ["Sélectionnez celui-ci", "FRENCH"]] );
AddTraduction( [["I do not like", "ENGLISH"], ["Je n'aime pas", "FRENCH"]] );
AddTraduction( [["I love it", "ENGLISH"], ["Je l'aime", "FRENCH"]] );
AddTraduction( [["Perfect", "ENGLISH"], ["Parfait", "FRENCH"]] );
AddTraduction( [["we will now personalize your profile", "ENGLISH"], ["nous allons maintenant personnaliser votre profil", "FRENCH"]] );
AddTraduction( [["We create your registration environment...", "ENGLISH"], ["Nous créons votre environnement d'inscription", "FRENCH"]] );
AddTraduction( [["Please wait...", "ENGLISH"], ["S'il vous plaît, attendez...", "FRENCH"]] );
AddTraduction( [["I forgot my password", "ENGLISH"], ["J'ai oublié mon mot de passe", "FRENCH"]] );
AddTraduction( [["Documents", "ENGLISH"], ["Documents", "FRENCH"]] );
AddTraduction( [["Power-off", "ENGLISH"], ["Éteindre", "FRENCH"]] );
AddTraduction( [["Hello", "ENGLISH"], ["Bonjour", "FRENCH"]] );
AddTraduction( [["We prepare your system...", "ENGLISH"], ["Nous préparons votre système...", "FRENCH"]] );
AddTraduction( [["Let's go", "ENGLISH"], ["Allons-y", "FRENCH"]] );

// Jour de la semaine
AddTraduction( [["Monday", "ENGLISH"], ["lundi", "FRENCH"]] );
AddTraduction( [["Tuesday", "ENGLISH"], ["Mardi", "FRENCH"]] );
AddTraduction( [["Wednesday", "ENGLISH"], ["Mercredi", "FRENCH"]] );
AddTraduction( [["Thusday", "ENGLISH"], ["Jeudi", "FRENCH"]] );
AddTraduction( [["Friday", "ENGLISH"], ["Vendredi", "FRENCH"]] );
AddTraduction( [["Saturday", "ENGLISH"], ["Samedi", "FRENCH"]] );
AddTraduction( [["Sunday", "ENGLISH"], ["Dimanche", "FRENCH"]] );

// Mois de l'anee
AddTraduction( [["January", "ENGLISH"], ["Janvier", "FRENCH"]] );
AddTraduction( [["February", "ENGLISH"], ["Février", "FRENCH"]] );
AddTraduction( [["March", "ENGLISH"], ["Mars", "FRENCH"]] );
AddTraduction( [["April", "ENGLISH"], ["Avril", "FRENCH"]] );
AddTraduction( [["May", "ENGLISH"], ["Mai", "FRENCH"]] );
AddTraduction( [["June", "ENGLISH"], ["Juin", "FRENCH"]] );
AddTraduction( [["July", "ENGLISH"], ["Juillet", "FRENCH"]] );
AddTraduction( [["August", "ENGLISH"], ["Août", "FRENCH"]] );
AddTraduction( [["September", "ENGLISH"], ["Septembre", "FRENCH"]] );
AddTraduction( [["October", "ENGLISH"], ["Octobre", "FRENCH"]] );
AddTraduction( [["November", "ENGLISH"], ["Novembre", "FRENCH"]] );
AddTraduction( [["December", "ENGLISH"], ["Décembre", "FRENCH"]] );

AddTraduction( [["Your reminder phrase", "ENGLISH"], ["Votre phrase de rappel", "FRENCH"]] );
AddTraduction( [["Creation date", "ENGLISH"], ["Date de création", "FRENCH"]] );
AddTraduction( [["Warning", "ENGLISH"], ["Attention", "FRENCH"]] );
AddTraduction( [["Too many windows have already been created", "ENGLISH"], ["Trop de fenêtres ont déjà été créées", "FRENCH"]] );

AddTraduction( [["Create new folder", "ENGLISH"], ["Créer un nouveau dossier", "FRENCH"]] );
AddTraduction( [["Rename folder", "ENGLISH"], ["Renommer le dossier", "FRENCH"]] );
AddTraduction( [["Delete folder", "ENGLISH"], ["Supprimer le dossier", "FRENCH"]] );
AddTraduction( [["Open in another explorer", "ENGLISH"], ["Réouvrir un explorateur", "FRENCH"]] );
AddTraduction( [["Item(s)", "ENGLISH"], ["Elements", "FRENCH"]] );
AddTraduction( [["Folder is empty", "ENGLISH"], ["Le dossier est vide", "FRENCH"]] );
AddTraduction( [["Search", "ENGLISH"], ["Chercher", "FRENCH"]] );
AddTraduction( [["Refresh", "ENGLISH"], ["Rafraîchir", "FRENCH"]] );
AddTraduction( [["Back to root", "ENGLISH"], ["Retour à la racine", "FRENCH"]] );
AddTraduction( [["Back to previous path", "ENGLISH"], ["Retour au chemin précédent", "FRENCH"]] );
AddTraduction( [["New folder", "ENGLISH"], ["Nouveau dossier", "FRENCH"]] );
AddTraduction( [["This computer", "ENGLISH"], ["Ce pc", "FRENCH"]] );
AddTraduction( [["PC search", "ENGLISH"], ["Recherche sur le pc", "FRENCH"]] );
AddTraduction( [["Current path", "ENGLISH"], ["Chemin actuelle", "FRENCH"]] );
AddTraduction( [["Search on all files, folders on machine from root", "ENGLISH"], ["Recherche sur tous les fichiers/dossiers sur la machine à partir de la racine", "FRENCH"]] );
AddTraduction( [["Search on all files, folders from current path", "ENGLISH"], ["Recherche sur tous les fichiers/dossiers du chemin actuel", "FRENCH"]] );
AddTraduction( [["Returned to top", "ENGLISH"], ["Retour en haut", "FRENCH"]] );
AddTraduction( [["Power", "ENGLISH"], ["Marche/Arrêt", "FRENCH"]] );
AddTraduction( [["Type here to search", "ENGLISH"], ["Tapez ici pour rechercher", "FRENCH"]] );
AddTraduction( [["All Apps", "ENGLISH"], ["Toutes les applications", "FRENCH"]] );
AddTraduction( [["Recommanded", "ENGLISH"], ["Recommandé", "FRENCH"]] );
AddTraduction( [["File_explorers", "ENGLISH"], ["Explorateurs de fichiers", "FRENCH"]] );
AddTraduction( [["Terminal", "ENGLISH"], ["Terminal", "FRENCH"]] );
AddTraduction( [["Settings", "ENGLISH"], ["Paramètres", "FRENCH"]] );
AddTraduction( [["Search results", "ENGLISH"], ["Résultats de recherche", "FRENCH"]] );
AddTraduction( [["Change your passwords", "ENGLISH"], ["Changez votre mot de passe", "FRENCH"]] );
AddTraduction( [["New password", "ENGLISH"], ["Nouveau mot de passe", "FRENCH"]] );
AddTraduction( [["Choose your language", "ENGLISH"], ["Choisissez votre langue", "FRENCH"]] );
AddTraduction( [["French", "ENGLISH"], ["Français", "FRENCH"]] );
AddTraduction( [["English", "ENGLISH"], ["Anglais", "FRENCH"]] );
AddTraduction( [["Your current connection", "ENGLISH"], ["Votre connection actuelle", "FRENCH"]] );
AddTraduction( [["Welcome to system settings.\nCustomize your experience to the best!", "ENGLISH"], ["Bienvenue dans les paramètres système.\nPersonnalisez votre expérience au mieux !", "FRENCH"]] );
AddTraduction( [["Monitors, brightness, night light, display profile\nDISPLAY\n", "ENGLISH"], ["Moniteurs, luminosité, eclairage nocturne, profil d'affichage\nAffichage\n", "FRENCH"]] );
AddTraduction( [["Volume levels, output, input, sound devices\nSOUND", "ENGLISH"], ["Niveaux de volume, sortie, entrée, périphériques audio\nSON\n", "FRENCH"]] );
AddTraduction( [["Wallpaper, cursor, taskbars\nPERSONALIZE", "ENGLISH"], ["Fond d'écran, curseur, barre des tâches\nPERSONNALISER\n", "FRENCH"]] );
AddTraduction( [["Storage space\nSTORAGE", "ENGLISH"], ["Espace de stockage\nSTOCKAGE", "FRENCH"]] );
AddTraduction( [["Device specifications\nABOUT", "ENGLISH"], ["Spécifications de l'appareil\nÀ PROPOS", "FRENCH"]] );
AddTraduction( [["Open in file explorer", "ENGLISH"], ["Explorateur de fichiers", "FRENCH"]] );
AddTraduction( [["BACK", "ENGLISH"], ["RETOUR", "FRENCH"]] );
AddTraduction( [["Processor", "ENGLISH"], ["Processeur", "FRENCH"]] );
AddTraduction( [["Installed Ram", "ENGLISH"], ["Ram installé", "FRENCH"]] );
AddTraduction( [["GB", "ENGLISH"], ["Go", "FRENCH"]] );
AddTraduction( [["Graphic card", "ENGLISH"], ["Carte graphique", "FRENCH"]] );
AddTraduction( [["Motherboard", "ENGLISH"], ["Carte mère", "FRENCH"]] );
AddTraduction( [["Maximum RAM capacity", "ENGLISH"], ["Capacité maximale de RAM", "FRENCH"]] );
AddTraduction( [["Brightness & color", "ENGLISH"], ["Luminosité et couleur", "FRENCH"]] );
AddTraduction( [["Brightness", "ENGLISH"], ["Luminosité", "FRENCH"]] );
AddTraduction( [["Night light", "ENGLISH"], ["Eclairage nocturne", "FRENCH"]] );
AddTraduction( [["Resolution", "ENGLISH"], ["Résolution", "FRENCH"]] );
AddTraduction( [["Display", "ENGLISH"], ["Affichage", "FRENCH"]] );
AddTraduction( [["Custom", "ENGLISH"], ["Personnalisé", "FRENCH"]] );
AddTraduction( [["Fullscreen", "ENGLISH"], ["Plein Ecran", "FRENCH"]] );
AddTraduction( [["Display options", "ENGLISH"], ["Paramètres d'affichage", "FRENCH"]] );
AddTraduction( [["Show frames per second", "ENGLISH"], ["Afficher les images par seconde", "FRENCH"]] );
AddTraduction( [["Apply Changes", "ENGLISH"], ["Appliquer les modifications", "FRENCH"]] );
AddTraduction( [["Change your wallpaper", "ENGLISH"], ["Changez votre fond d'écran", "FRENCH"]] );
AddTraduction( [["Currently", "ENGLISH"], ["Actuellement", "FRENCH"]] );
AddTraduction( [["Change your cursor", "ENGLISH"], ["Changez votre curseur", "FRENCH"]] );
AddTraduction( [["Sounds", "ENGLISH"], ["Sons", "FRENCH"]] );
AddTraduction( [["General volume", "ENGLISH"], ["Volume général", "FRENCH"]] );
AddTraduction( [["Notification volumes", "ENGLISH"], ["Volume des notifications", "FRENCH"]] );
AddTraduction( [["This is your storage space", "ENGLISH"], ["Ceci est votre espace de stockage", "FRENCH"]] );
AddTraduction( [["Gb used", "ENGLISH"], ["Go utilisé(s)", "FRENCH"]] );
AddTraduction( [["Gb free", "ENGLISH"], ["Go libre(s)", "FRENCH"]] );
AddTraduction( [["Gb", "ENGLISH"], ["Go", "FRENCH"]] );

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
BACKGROUND = 0;
HELPING_PASSWORD = "NULL";
LIKE_LIST = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];

global.USER = [STATE, FIRST_NAME, LAST_NAME, EMAIL, AGE, PASSWORD, ICON, BACKGROUND, HELPING_PASSWORD, LIKE_LIST];

// CREATE LOAD_LIST

LOAD_LIST = [global.USER, global.PATH, global.FOLDERS, global.WINDOWS_PIN, global.SETTINGS, global.SOUNDS, global.GAME_VALUE, undefined];

// LOAD
savegame_clear("USER");
LOAD_LIST = savegame_load("USER", LOAD_LIST);
global.USER = LOAD_LIST[0];
global.PATH = LOAD_LIST[1];
global.FOLDERS = LOAD_LIST[2];
global.WINDOWS_PIN = LOAD_LIST[3];
global.SETTINGS = LOAD_LIST[4];
global.SOUNDS = LOAD_LIST[5];
global.GAME_VALUE = LOAD_LIST[6];


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
