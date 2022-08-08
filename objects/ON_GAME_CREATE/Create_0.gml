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

global.Requirement = {
	
	type : undefined,
	state : "OFF",
	response : false
	
};

// INIT_TIMER

global.TIMER = 2;

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
var AMBIANT_SOUND = 50;
global.SOUNDS = [GENERAL_SOUND, NOTIFICATION_SOUND, AMBIANT_SOUND];

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
AddTraduction( [["File_explorer", "ENGLISH"], ["Explorateur de fichiers", "FRENCH"]] );
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
AddTraduction( [["DISPLAY\nMonitors, brightness, night light, display profile", "ENGLISH"], ["AFFICHAGE\nMoniteurs, luminosité, eclairage nocturne, profil d'affichage", "FRENCH"]] );
AddTraduction( [["SOUND\nVolume levels, output, input, sound devices", "ENGLISH"], ["SON\nNiveaux de volume, sortie, entrée, périphériques audio", "FRENCH"]] );
AddTraduction( [["PERSONALIZE\nWallpaper, cursor, taskbars", "ENGLISH"], ["PERSONNALISER\nFond d'écran, curseur, barre des tâches", "FRENCH"]] );
AddTraduction( [["STORAGE\nStorage space", "ENGLISH"], ["STOCKAGE\nEspace de stockage", "FRENCH"]] );
AddTraduction( [["ABOUT\nDevice specifications", "ENGLISH"], ["À PROPOS\nSpécifications de l'appareil", "FRENCH"]] );
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
AddTraduction( [["Local Account", "ENGLISH"], ["Compte local", "FRENCH"]] );
AddTraduction( [["System", "ENGLISH"], ["Système", "FRENCH"]] );
AddTraduction( [["Network & internet", "ENGLISH"], ["Réseau & internet", "FRENCH"]] );
AddTraduction( [["Account", "ENGLISH"], ["Compte", "FRENCH"]] );
AddTraduction( [["Update", "ENGLISH"], ["Mise à jour", "FRENCH"]] );
AddTraduction( [["Power system", "ENGLISH"], ["Alimentation", "FRENCH"]] );
AddTraduction( [["Select", "ENGLISH"], ["Sélectionner", "FRENCH"]] );
AddTraduction( [["Errors", "ENGLISH"], ["Erreurs", "FRENCH"]] );
AddTraduction( [["Error", "ENGLISH"], ["Erreur", "FRENCH"]] );
AddTraduction( [["Password too short", "ENGLISH"], ["Mot de passe trop court", "FRENCH"]] );
AddTraduction( [["Your password must be\ndifferent from the old one", "ENGLISH"], ["Votre mot de passe doit être\ndifférent de l'ancien", "FRENCH"]] );
AddTraduction( [["Success", "ENGLISH"], ["Succès", "FRENCH"]] );
AddTraduction( [["Your passwords have been changed", "ENGLISH"], ["Votre mot de passe à été modifié", "FRENCH"]] );
AddTraduction( [["Success", "ENGLISH"], ["Succès", "FRENCH"]] );
AddTraduction( [["DISPLAY", "ENGLISH"], ["AFFICHAGE", "FRENCH"]] );
AddTraduction( [["SOUND", "ENGLISH"], ["SON", "FRENCH"]] );
AddTraduction( [["PERSONALIZE", "ENGLISH"], ["PERSONALIZE", "FRENCH"]] );
AddTraduction( [["STORAGE", "ENGLISH"], ["STOCKAGE", "FRENCH"]] );
AddTraduction( [["ABOUT", "ENGLISH"], ["A PROPOS", "FRENCH"]] );
AddTraduction( [["SYSTEM", "ENGLISH"], ["SYSTÈME", "FRENCH"]] );
AddTraduction( [["Folder is empty", "ENGLISH"], ["Le dossier est vide", "FRENCH"]] );
AddTraduction( [["folder", "ENGLISH"], ["dossier", "FRENCH"]] );
AddTraduction( [["not found", "ENGLISH"], ["introuvable", "FRENCH"]] );
AddTraduction( [["You are already at the root", "ENGLISH"], ["Vous êtes déjà à la racine", "FRENCH"]] );
AddTraduction( [["was not found", "ENGLISH"], ["n'a pas été trouvé", "FRENCH"]] );
AddTraduction( [["No arguments", "ENGLISH"], ["Aucun argument", "FRENCH"]] );
AddTraduction( [["Folder already exists", "ENGLISH"], ["Le dossier existe déjà", "FRENCH"]] );
AddTraduction( [["was created", "ENGLISH"], ["a été créé", "FRENCH"]] );
AddTraduction( [["You don't have permission to rename it", "ENGLISH"], ["Vous n'êtes pas autorisé à le renommer", "FRENCH"]] );
AddTraduction( [["was deleted", "ENGLISH"], ["à été supprimée", "FRENCH"]] );
AddTraduction( [["Here is the list of your keyboard commands", "ENGLISH"], ["Voici la liste de vos commandes clavier", "FRENCH"]] );
AddTraduction( [["Your keyboard command history is empty !", "ENGLISH"], ["Votre historique des commandes clavier est vide !", "FRENCH"]] );
AddTraduction( [["End of connection", "ENGLISH"], ["Fin de connexion", "FRENCH"]] );
AddTraduction( [["You are not connected to anything", "ENGLISH"], ["Vous n'êtes connecté à rien", "FRENCH"]] );
AddTraduction( [["command not found", "ENGLISH"], ["commande non trouvée", "FRENCH"]] );
AddTraduction( [["too few arguments", "ENGLISH"], ["trop peu d'arguments", "FRENCH"]] );
AddTraduction( [["has been successfully renamed to", "ENGLISH"], ["a été renommé avec succès en", "FRENCH"]] );
AddTraduction( [["is not found", "ENGLISH"], ["n'est pas trouvé", "FRENCH"]] );
AddTraduction( [["Connection", "ENGLISH"], ["Connexion", "FRENCH"]] );
AddTraduction( [["CONNECT ID", "ENGLISH"], ["ID DE CONNEXION", "FRENCH"]] );
AddTraduction( [["This means that your terminal\nis connected to another process,\nthey are now possible for\nyou to control this process\nremotely", "ENGLISH"], ["Cela signifie que votre terminal\nest connecté à un autre processus,\nil vous est désormais possible\nde contrôler ce processus\nà distance", "FRENCH"]] );
AddTraduction( [["This means that a process is connecting to the terminal\n", "ENGLISH"], ["Cela signifie qu'un processus est connecté au terminal\n", "FRENCH"]] );
AddTraduction( [["A process is connecting to you", "ENGLISH"], ["Un processus se connecte à vous", "FRENCH"]] );
AddTraduction( [["Connect status", "ENGLISH"], ["État de la connexion", "FRENCH"]] );
AddTraduction( [["true", "ENGLISH"], ["ok", "FRENCH"]] );
AddTraduction( [["Connect at", "ENGLISH"], ["Connecté à", "FRENCH"]] );
AddTraduction( [["false", "ENGLISH"], ["echec", "FRENCH"]] );
AddTraduction( [["A process is connected to your terminal\nor the process you are trying to reach is already connected to another process.\nYou can only connect two processes together", "ENGLISH"], ["Un processus est connecté à votre terminal\nou le processus que vous essayez d'atteindre est déjà connecté à un autre processus.\nVous ne pouvez connecter que deux processus ensemble", "FRENCH"]] );
AddTraduction( [["The target is already connected to another process", "ENGLISH"], ["La cible est déjà connectée à un autre processus", "FRENCH"]] );
AddTraduction( [["Help", "ENGLISH"], ["Aide", "FRENCH"]] );
AddTraduction( [["HELP", "ENGLISH"], ["AIDE", "FRENCH"]] );
AddTraduction( [["History", "ENGLISH"], ["Historique", "FRENCH"]] );
AddTraduction( [["Clear", "ENGLISH"], ["Effacer", "FRENCH"]] );
AddTraduction( [["List of commands that may be useful to you", "ENGLISH"], ["Liste des commandes qui peuvent vous être utiles", "FRENCH"]] );

// TERMINAL HELP
AddTraduction( [["help : View this post\n", "ENGLISH"], ["help : afficher ce message\n", "FRENCH"]] );
AddTraduction( [["ls : Allows you to see the contents of the current folder or a specific folder\n", "ENGLISH"], ["ls : Permet de voir le contenu du dossier courant ou d'un dossier spécifique\n", "FRENCH"]] );
AddTraduction( [["cd : Allows you to move to the desired directory\n", "ENGLISH"], ["cd : Permet de se déplacer vers le répertoire souhaité\n", "FRENCH"]] );
AddTraduction( [["cd [..] : Move to the back directory\n", "ENGLISH"], ["cd [..] : Déplacer vers le répertoire précédant\n", "FRENCH"]] );
AddTraduction( [["mkdir : Allows you to create a directory\n", "ENGLISH"], ["mkdir : Permet de créer un répertoire\n", "FRENCH"]] );
AddTraduction( [["rm : Allows you to delete a directory\n", "ENGLISH"], ["rm : permet de supprimer un répertoire\n", "FRENCH"]] );
AddTraduction( [["exit : To close the window\n", "ENGLISH"], ["exit : Pour fermer la fenêtre\n", "FRENCH"]] );
AddTraduction( [["getpid : Informs the process id\n", "ENGLISH"], ["getpid : renseigne l'identifiant du processus\n", "FRENCH"]] );
AddTraduction( [["connect : Allows you to connect to a specified id\n", "ENGLISH"], ["connect : vous permet de vous connecter à un identifiant spécifié\n", "FRENCH"]] );
AddTraduction( [["close : End of connection\n", "ENGLISH"], ["close : Fin de connexion\n", "FRENCH"]] );
AddTraduction( [["rename : Allows you to rename a folder or file\n", "ENGLISH"], ["rename : permet de renommer un dossier ou un fichier\n", "FRENCH"]] );

AddTraduction( [["Close all windows", "ENGLISH"], ["Fermez toutes les fenêtres", "FRENCH"]] );
AddTraduction( [["Pin to taskbar", "ENGLISH"], ["Épingle à la barre des tâches", "FRENCH"]] );
AddTraduction( [["Passwords are not the same", "ENGLISH"], ["les mots de passe ne sont pas les mêmes", "FRENCH"]] );
AddTraduction( [["Age can only be number", "ENGLISH"], ["L'âge ne peut être qu'un nombre", "FRENCH"]] );
AddTraduction( [["You did not enter the domain", "ENGLISH"], ["Vous n'avez pas entré de domaine", "FRENCH"]] );
AddTraduction( [["Your domain name is invalid", "ENGLISH"], ["Votre nom de domaine est invalide", "FRENCH"]] );
AddTraduction( [["Please fill in the information before the", "ENGLISH"], ["Veuillez remplir les informations avant le", "FRENCH"]] );
AddTraduction( [["you can only insert '@' once", "ENGLISH"], ["vous ne pouvez insérer '@' qu'une seule fois", "FRENCH"]] );
AddTraduction( [["Your email does not contain '@'", "ENGLISH"], ["Votre email ne contient pas de '@'", "FRENCH"]] );
AddTraduction( [["Your email address is too short", "ENGLISH"], ["Votre adresse e-mail est trop courte", "FRENCH"]] );
AddTraduction( [["Your 'help sentence' cannot be the same\n               as the password", "ENGLISH"], ["Votre 'phrase d'aide' ne peut pas être la même\n               que le mot de passe", "FRENCH"]] );
AddTraduction( [["was not filled in", "ENGLISH"], ["n'a pas été rempli", "FRENCH"]] );
AddTraduction( [["First Name", "ENGLISH"], ["Prénom", "FRENCH"]] );
AddTraduction( [["Last Name", "ENGLISH"], ["Nom de famille", "FRENCH"]] );
AddTraduction( [["E-mail address", "ENGLISH"], ["Adresse e-mail", "FRENCH"]] );
AddTraduction( [["Age", "ENGLISH"], ["Âge", "FRENCH"]] );
AddTraduction( [["Password", "ENGLISH"], ["Mot de passe", "FRENCH"]] );
AddTraduction( [["Password again", "ENGLISH"], ["Mot de passe à nouveau", "FRENCH"]] );
AddTraduction( [["Help sentence", "ENGLISH"], ["Phrase d'aide", "FRENCH"]] );
AddTraduction( [["Turn off the machine", "ENGLISH"], ["Éteignez la machine", "FRENCH"]] );
AddTraduction( [["Register", "ENGLISH"], ["S'inscrire", "FRENCH"]] );
AddTraduction( [["Passwords are not the same !", "ENGLISH"], ["Les mots de passe ne sont pas les mêmes !", "FRENCH"]] );
AddTraduction( [["Please fill in your information", "ENGLISH"], ["Merci de renseigner vos informations", "FRENCH"]] );
AddTraduction( [["Your data is personal and will not be shared with anyone.\nCreate your account without fear", "ENGLISH"], ["Vos données sont personnelles et ne seront partagées avec personne.\nCréez votre compte sans crainte", "FRENCH"]] );
AddTraduction( [["here you can edit your experience", "ENGLISH"], ["ici vous pouvez modifier votre expérience", "FRENCH"]] );
AddTraduction( [["Choose a profile picture that defines you!\nAs well as wallpapers to your tastes", "ENGLISH"], ["Choisissez une photo de profil qui vous définit !\nAinsi qu'un fond d'écran à votre goût", "FRENCH"]] );
AddTraduction( [["Restart the machine", "ENGLISH"], ["Redémarrez la machine", "FRENCH"]] );
AddTraduction( [["Previous", "ENGLISH"], ["Précédent", "FRENCH"]] );
AddTraduction( [["Select this one", "ENGLISH"], ["Sélectionnez celui-ci", "FRENCH"]] );
AddTraduction( [["Finish", "ENGLISH"], ["Finir", "FRENCH"]] );

AddTraduction( [["Data recovery", "ENGLISH"], ["Récupération de données", "FRENCH"]] );
AddTraduction( [["Inventory retrieval", "ENGLISH"], ["Récupération d'inventaire", "FRENCH"]] );
AddTraduction( [["Server initialization", "ENGLISH"], ["Initialisation du serveur", "FRENCH"]] );
AddTraduction( [["Connection to instances", "ENGLISH"], ["Connexion aux instances", "FRENCH"]] );
AddTraduction( [["Creation of temporary files", "ENGLISH"], ["Création de fichiers temporaires", "FRENCH"]] );
AddTraduction( [["Component checks", "ENGLISH"], ["Vérifications des composants", "FRENCH"]] );
AddTraduction( [["Securing overheating", "ENGLISH"], ["Sécurisation de la surchauffe", "FRENCH"]] );
AddTraduction( [["Desktop initialization", "ENGLISH"], ["Initialisation du bureau", "FRENCH"]] );
AddTraduction( [["Your machine is being initialized...", "ENGLISH"], ["Votre machine est en cours d'initialisation...", "FRENCH"]] );
AddTraduction( [["Hi", "ENGLISH"], ["Salut", "FRENCH"]] );
AddTraduction( [["your machine is loading...", "ENGLISH"], ["votre machine est en cours de chargement...", "FRENCH"]] );
AddTraduction( [["Your machine is about to shutdown", "ENGLISH"], ["Votre machine est sur le point de s'arrêter", "FRENCH"]] );
AddTraduction( [["Restarting the machine...", "ENGLISH"], ["Redémarrage de la machine...", "FRENCH"]] );
AddTraduction( [["Do you like the displayed image ?", "ENGLISH"], ["Aimez-vous l'image affichée ?", "FRENCH"]] );
AddTraduction( [["The password is incorrect, please try again", "ENGLISH"], ["Le mot de passe est incorrect. Veuillez réessayer", "FRENCH"]] );
AddTraduction( [["Login to your session..", "ENGLISH"], ["Connection à votre session..", "FRENCH"]] );
AddTraduction( [["I forgot my password", "ENGLISH"], ["j'ai oublié mon mot de passe", "FRENCH"]] );

AddTraduction( [["Turn off", "ENGLISH"], ["Éteindre", "FRENCH"]] );
AddTraduction( [["Restart", "ENGLISH"], ["Redémarrer", "FRENCH"]] );
AddTraduction( [["Standby", "ENGLISH"], ["Veille", "FRENCH"]] );

AddTraduction( [["Home", "ENGLISH"], ["Démarrer", "FRENCH"]] );
AddTraduction( [["Administrator", "ENGLISH"], ["Administrateur", "FRENCH"]] );
AddTraduction( [["Change your account name", "ENGLISH"], ["Modifier le nom de votre compte", "FRENCH"]] );
AddTraduction( [["Name too short", "ENGLISH"], ["Nom trop court", "FRENCH"]] );
AddTraduction( [["Your name must be\ndifferent from the old one", "ENGLISH"], ["Votre nom doit être\ndifférent de l'ancien", "FRENCH"]] );
AddTraduction( [["Your name account have been changed", "ENGLISH"], ["Votre nom de compte a été modifié", "FRENCH"]] );
AddTraduction( [["Change your account information", "ENGLISH"], ["Changer vos informations de compte", "FRENCH"]] );
AddTraduction( [["Your email address have been changed", "ENGLISH"], ["Votre adresse e-mail a été modifiée", "FRENCH"]] );
AddTraduction( [["Patch notes", "ENGLISH"], ["Notes de mise à jour", "FRENCH"]] );
AddTraduction( [["News", "ENGLISH"], ["Nouveautés", "FRENCH"]] );
AddTraduction( [["Patchs", "ENGLISH"], ["Correctifs", "FRENCH"]] );
AddTraduction( [["Others", "ENGLISH"], ["Autres", "FRENCH"]] );
AddTraduction( [["Language change", "ENGLISH"], ["Changement de langue", "FRENCH"]] );
AddTraduction( [["A change of language during the execution of the machine can\ncause some bugs. We advise you to do a restart.", "ENGLISH"], ["Un changement de langue durant l'exécution de la machine peut\nprovoquer quelques bugs. Nous vous conseillons de faire un\nredémarrage.", "FRENCH"]] );
AddTraduction( [["Language change", "ENGLISH"], ["Changement de langue", "FRENCH"]] );
AddTraduction( [["To restart", "ENGLISH"], ["Redémarrer", "FRENCH"]] );
AddTraduction( [["Do not restart", "ENGLISH"], ["Ne pas redémarrer", "FRENCH"]] );
AddTraduction( [["Open in document viewer", "ENGLISH"], ["Ouvrire dans la visionneuse de documents", "FRENCH"]] );
AddTraduction( [["Document viewer", "ENGLISH"], ["Visionneuse de documents", "FRENCH"]] );
AddTraduction( [["Ambient volume", "ENGLISH"], ["Volume ambiant", "FRENCH"]] );



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
