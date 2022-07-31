/// @Project by Kucia Guillaume* ///

IMAGE_WIDTH = SIZE_X;
IMAGE_HEIGHT = SIZE_Y;
DevKit(id);

if (PARENT != undefined) {
	if (instance_exists(PARENT) && PARENT.TAG + "VISIO" == TAG) {
		if (y > Y_TARGET && !CLOSE) {
			y -= 0.0001 * delta_time
			if (COMPONENTS != undefined) {
				for (var i = 0; COMPONENTS[i] != undefined; i++) {
					var obj = COMPONENTS[i];
					obj.y -= 0.0001 * delta_time;
					if (obj.TEXT_CONNECT != undefined)	
						obj.TEXT_CONNECT.y -= 0.0001 * delta_time;
					if (obj.OBJECT_LINKED != undefined)
						obj.OBJECT_LINKED.y -= 0.0001 * delta_time;
				}
			}
		} else if (CLOSE) {
			if (y < Y_TARGET + 20) {
				y += 0.0001 * delta_time;
				image_alpha -= 0.00001 * delta_time;
				if (COMPONENTS != undefined) {
					for (var i = 0; COMPONENTS[i] != undefined; i++) {
						var obj = COMPONENTS[i];
						if (!instance_exists(obj))
							continue;
						obj.y += 0.0001 * delta_time; 
						obj.image_alpha = image_alpha;
						if (obj.TEXT_CONNECT != undefined)	
							obj.TEXT_CONNECT.y += 0.0001 * delta_time;
						if (obj.OBJECT_LINKED != undefined) {
							obj.OBJECT_LINKED.y += 0.0001 * delta_time;
							obj.OBJECT_LINKED.image_alpha = image_alpha;
						}
					}
				}
				if (BUTTONS != undefined) {
					for (var i = 0; BUTTONS[i] != undefined; i++) {
						var obj = BUTTONS[i];
						obj.y += 0.0001 * delta_time; 
						obj.image_alpha = image_alpha;
						if (obj.TEXT_CONNECT != undefined)	
							obj.TEXT_CONNECT.y += 0.0001 * delta_time;
						if (obj.OBJECT_LINKED != undefined) {
							obj.OBJECT_LINKED.y += 0.0001 * delta_time;
							obj.OBJECT_LINKED.image_alpha = image_alpha;
						}
					}
				}
			} else {
				if (COMPONENTS != undefined) {
					for (var i = 0; COMPONENTS[i] != undefined; i++)
						if (instance_exists(COMPONENTS[i]))
							DestroyButtonBox(COMPONENTS[i].TAG);
				}
				if (BUTTONS != undefined) {
					for (var i = 0; BUTTONS[i] != undefined; i++) {
						DestroyText(BUTTONS[i].TEXT_CONNECT.TAG);
						DestroyObject(BUTTONS[i].OBJECT_LINKED.TAG);
						DestroyObject(BUTTONS[i].TAG);
					}
				}
				PARENT.visio = undefined;
				DestroyObject(TAG);
			}
		}
	}
}

if (PARENT != undefined) {
	if (PARENT.TAG + "BAR_CURRENT_NETWORK_SPEED" == TAG) {
		var objective = MathPercentOf2(global.GAME_VALUE[6][0], global.GAME_VALUE[6][1], 370);
		
		if (objective > SIZE_X)
			SIZE_X += (Diff(x + SIZE_X, x + objective) * (delta_time * 0.000005));
		else
			SIZE_X -= (Diff(x + SIZE_X, x + objective) * (delta_time * 0.000005));
			
		PARENT.SNETWORK_OBJECT[OBJECT_LINKED][1] = Diff(id.x, ((x + SIZE_X) - string_width(TEXT_CONNECT.TEXT)) - 50);
		TEXT_CONNECT.TEXT = string(global.GAME_VALUE[6][0]) + " Mb/s"; 
	}
}

// CLICK
if (!MouseInsideRound(id) && !mouse_check_button_pressed(mb_left)) return;