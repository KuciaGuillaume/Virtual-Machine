// Les actifs du script ont changé pour v2.3.0 Voir
// https://help.yoyogames.com/hc/en-us/articles/360005277377 pour plus d’informations
function terminal_update(id) {

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
		if (id.CONNECT_AT_IMAGE != "NULL") {
			id.CONNECT_AT_IMAGE.x = x + 300; id.CONNECT_AT_IMAGE.y = y - 15;
			id.CONNECT_AT_IMAGE.image_alpha = image_alpha;
			id.CONNECT_AT_TEXT.x = x + 300; id.CONNECT_AT_TEXT.y = y - 15;
			id.CONNECT_AT_TEXT.image_alpha = image_alpha;
		}

		//SAVING
		if (id.SAVING_LOAD != "NULL") {
			id.SAVING_LOAD.x = x + 380; id.SAVING_LOAD.y = y + 580;
			id.SAVING_LOAD.image_alpha = image_alpha;
			id.SAVING_LOAD.image_angle += 0.001 * delta_time;
			id.SAVING_TIME += delta_time / 1000000;
			if (id.SAVING_TIME >= id.SAVING_TIMER) {
				DestroyObject(id.SAVING_LOAD.TAG);
				id.SAVING_TIME = 0;
				id.SAVING_TIMER = random_range(0, 3);
			}
		}
		if (id.pwd.y + id.pwd.TEXT_HEIGHT + 30 >= bbox_bottom) {
			var replace = "";
			for (var i = 1; string_char_at(id.system_write.TEXT, i - 1) != "\n";) { i++; }
			for (; string_char_at(id.system_write.TEXT, i - 1) == "\n";) { i++; }
			for (; i != string_length(id.system_write.TEXT); i++)
				replace = replace + string_char_at(id.system_write.TEXT, i);
			id.system_write.TEXT = replace + "\n";
		}
		if (id.CONNECTION) {
			id.CONNECTION_TIME += delta_time / 1000000;
			id.write_text.TEXT = ["Connection...", "NULL"];
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
				if (find) {
					if (id.CONNECT_AT_IMAGE == "NULL") {
						addtolist(AddText(x, y, "CONNECT ID: " + string(id.CONNECT_ID), Arial10, c_black, id.WINDOW.LAYERS[1], id.TAG + "CONNECT_AT_TEXT", [["CENTERED"], "NULL"]), id.WINDOW.list_objects);
						addtolist(CreateObjectSprite(x, y, id.WINDOW.LAYERS[0], S_connect_at, OJustGUI, "IMAGE", id.TAG + "CONNECT_AT_IMAGE" , ["NULL"]), id.WINDOW.list_objects);
					}
					id.CONNECT = true;
					id.CONNECTION = false;
					id.CONNECTION_TIME = 0;
					id.write_text.TEXT = ["", "NULL"];
					id.system_write.TEXT = id.system_write.TEXT + "Connect status : true\nConnect at " + string(id.CONNECT_ID) + "\n";
				} else {
					id.CONNECT = false;
					id.CONNECTION = false;
					id.CONNECTION_TIME = 0;
					id.write_text.TEXT = ["", "NULL"];
					id.system_write.TEXT = id.system_write.TEXT + "Connect status : false\n" + string(id.CONNECT_ID) + " not found.\n";
				}
			}
		}
}