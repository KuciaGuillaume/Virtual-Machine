// Les actifs du script ont changé pour v2.3.0 Voir
// https://help.yoyogames.com/hc/en-us/articles/360005277377 pour plus d’informations
function terminal_update(id) {

		y = id.y;
		x = id.x;
		id.write_text.ON_WRITE = false;
		id.system_write.x = x - sprite_width / 2 + 10; id.system_write.y = y + 30; id.system_write.image_alpha = image_alpha;
		id.pwd.x = x - sprite_width / 2 + 10; id.user_enter.x = x - sprite_width / 2 + 10 + id.pwd.TEXT_WIDTH + 5;
		id.user_enter.y = y + (id.USER_WRITE_POSITION * string_count("\n", id.system_write.TEXT)) + 30; id.pwd.y =  y + (id.USER_WRITE_POSITION * string_count("\n", id.system_write.TEXT)) + 30;
		id.user_enter.image_alpha = image_alpha; id.pwd.image_alpha = image_alpha;
		id.write_text.BAR.image_alpha = image_alpha;
		id.user_enter.TEXT = id.write_text.TEXT_OUTPUT

		id.BTN_HELP.x = x + 349; id.BTN_HELP.y = y + 9; id.BTN_HELP.TEXT_CONNECT.x = id.BTN_HELP.x; id.BTN_HELP.TEXT_CONNECT.y = id.BTN_HELP.y;
		id.BTN_HELP.image_alpha = image_alpha;

		//BUTTON HISTORY
		id.BTN_HISTORY.x = x + 249; id.BTN_HISTORY.y = y + 9; id.BTN_HISTORY.TEXT_CONNECT.x = id.BTN_HISTORY.x; id.BTN_HISTORY.TEXT_CONNECT.y = id.BTN_HISTORY.y;
		id.BTN_HISTORY.image_alpha = image_alpha;

		//BUTTON CLEAR
		id.BTN_CLEAR.x = x + 149; id.BTN_CLEAR.y = y + 9; id.BTN_CLEAR.TEXT_CONNECT.x = id.BTN_CLEAR.x; id.BTN_CLEAR.TEXT_CONNECT.y = id.BTN_CLEAR.y;
		id.BTN_CLEAR.image_alpha = image_alpha;
		
		id.pwd.TEXT = "[ " + global.USER[1] + id.PATH + " ]";
		id.system_write.x = x - sprite_width / 2 + 10; id.system_write.y = y + 30; id.system_write.image_alpha = image_alpha;
		id.pwd.x = x - sprite_width / 2 + 10; id.user_enter.x = x - sprite_width / 2 + 10 + id.pwd.TEXT_WIDTH + 5;
		id.user_enter.y = y + (id.USER_WRITE_POSITION * string_count("\n", id.system_write.TEXT)) + 30; id.pwd.y =  y + (id.USER_WRITE_POSITION * string_count("\n", id.system_write.TEXT)) + 30;
		id.user_enter.image_alpha = image_alpha; id.pwd.image_alpha = image_alpha;
		id.write_text.BAR.image_alpha = image_alpha;
		id.user_enter.TEXT = id.write_text.TEXT_OUTPUT;

		//CONNECT_AT
		if (id.CONNECT_AT_IMAGE != undefined) {
			id.CONNECT_AT_IMAGE.x = x + 250; id.CONNECT_AT_IMAGE.y = y - 15;
			id.CONNECT_AT_IMAGE.image_alpha = image_alpha;
			id.CONNECT_AT_TEXT.x = x + 250; id.CONNECT_AT_TEXT.y = y - 15;
			id.CONNECT_AT_TEXT.image_alpha = image_alpha;
		}

		//CONNECT_TO_YOU
		if (id.CONNECT_TO_YOU != undefined) {
			id.CONNECT_TO_YOU.x = x + 300; id.CONNECT_TO_YOU.y = y + 40;
			id.CONNECT_TO_YOU.image_alpha = image_alpha;
			id.CONNECT_TO_YOU_TEXT.x = x + 300; id.CONNECT_TO_YOU_TEXT.y = y + 40;
			if (id.CLOSE)
				id.CONNECT_TO_YOU_TEXT.image_alpha = image_alpha;
		}

		//SAVING
		if (id.SAVING_LOAD != undefined) {
			id.SAVING_LOAD.x = x + 380; id.SAVING_LOAD.y = y + 580;
			id.SAVING_LOAD.image_alpha = image_alpha;
			id.SAVING_LOAD.image_angle += 0.001 * delta_time;
			id.SAVING_TIME += delta_time / 1000000;
			if (id.SAVING_TIME >= id.SAVING_TIMER) {
				DestroyObject(id.SAVING_LOAD.TAG);
				id.SAVING_LOAD = undefined;
				id.SAVING_TIME = 0;
				id.SAVING_TIMER = random_range(0, 3);
			}
		}
		if (id.CONNECTION) {
			id.CONNECTION_TIME += delta_time / 1000000;
			if (CONNECTION_TIME >= 1) { id.write_text.TEXT = [AutoLanguage("Connection") + ".", undefined]; } if (CONNECTION_TIME >= 3) { id.write_text.TEXT = [AutoLanguage("Connection") + "...", undefined]; }
			if (CONNECTION_TIME >= 2) { id.write_text.TEXT = [AutoLanguage("Connection") + "..", undefined]; } if (CONNECTION_TIME >= 4 || CONNECTION_TIME < 1) { id.write_text.TEXT = [AutoLanguage("Connection"), undefined]; }
			id.write_text.TEXT_INDEX = 1;
			id.write_text.TEXT_INDEX_MAX = 1;
			if (id.CONNECTION_TIME >= id.SAVING_TIMER) {
				
				var find = false;
				// GESTION D'ERREUR de l'id de connection
				if (instance_exists(id.CONNECT_ID)) {
					var get = GetObject(id.CONNECT_ID.TAG);
					if (string_count("_BK", get.TAG) > 0 && get.image_alpha >= 1)
						find = true;
				}
				if (find && (!id.CATCH && !get.CATCH) && !get.CONNECT) {
					if (id.CONNECT_AT_IMAGE == undefined) {
						addtolist(AddText(x, y, AutoLanguage("CONNECT ID") + ": " + string(id.CONNECT_ID), Arial10, c_black, id.WINDOW.LAYERS[1], id.TAG + "CONNECT_AT_TEXT", [["CENTERED"], undefined]), id.WINDOW.list_objects);
						addtolist(CreateObjectSprite(x, y, id.WINDOW.LAYERS[0], S_connect_at, OJustGUI, "BUTTON-NO-HAND", id.TAG + "CONNECT_AT_IMAGE" , [["INFO", AutoLanguage("This means that your terminal\nis connected to another process,\nthey are now possible for\nyou to control this process\nremotely")], undefined]), id.WINDOW.list_objects);
						if (GetObject(get.TAG + "CONNECT_TO_YOU") == undefined) {
							addtolist(CreateObjectSprite(get.x + 300, get.y + 40, get.WINDOW.LAYERS[0], S_connect_to_you, OJustGUI, "BUTTON-NO-HAND", get.TAG + "CONNECT_TO_YOU" , [["INFO", AutoLanguage("This means that a process is connecting to the terminal\n")], undefined]), get.WINDOW.list_objects);
							addtolist(AddText(get.x + 300, get.y + 40, AutoLanguage("A process is connecting to you"), Segoe8, c_white, get.WINDOW.LAYERS[1], get.TAG + "CONNECT_TO_YOU_TEXT", [["FADE_IN", 0.0001], ["CENTERED"], undefined]), get.WINDOW.list_objects);
						}
							
					}
					id.CONNECT = true;
					id.CONNECTION = false;
					id.CONNECTION_TIME = 0;
					id.write_text.TEXT = ["", undefined];
					get.CATCH = true;
					display_result(id.system_write, AutoLanguage("Connect status") + " : " + AutoLanguage("true") + "\n" + AutoLanguage("Connect at") + " " + string(id.CONNECT_ID));
				} else {
					id.CONNECT = false;
					id.CONNECTION = false;
					id.CONNECTION_TIME = 0;
					id.write_text.TEXT = ["", undefined];
					if (id.CATCH || (get != undefined && instance_exists(get) && get.object_index == OJustGUITerminal && get.CATCH))
						 { display_result(id.system_write, AutoLanguage("Connect status") + " : " + AutoLanguage("false") + "\n" + AutoLanguage("A process is connected to your terminal\nor the process you are trying to reach is already connected to another process.\nYou can only connect two processes together")); return; }
					if (get != undefined && instance_exists(get) && get.object_index == OJustGUITerminal && get.CONNECT)
						{ display_result(id.system_write, AutoLanguage("Connect status") + " : " + AutoLanguage("false") + "\n" + AutoLanguage("The target is already connected to another process") + "."); return; }
					display_result(id.system_write, AutoLanguage("Connect status") + " : "  + AutoLanguage("false") + "\n" + string(id.CONNECT_ID) + " " + AutoLanguage("not found") + ".");
				}
			}
		}
}