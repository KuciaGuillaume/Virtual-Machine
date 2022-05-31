/// @Project by Kucia Guillaume* ///

if (TAG == "NULL")
	return;
for (var i = 0; OPTION[i] != "NULL"; i++) {
	if (OPTION[i][0] == "FADE_IN" && !FADE_SATE) { 
		FADE_IN = true; FADE_POWER = OPTION[i][1];
		FADE_SATE = true; image_alpha = 0;
	}
	if (OPTION[i][0] == "INDEX_IMAGE")
		image_index = OPTION[i][1];
	if (OPTION[i][0] == "FADE_ON") {FADE_ON = true; FADE_ON_POWER = OPTION[i][1]; }
	if (OPTION[i][0] == "INFO") {INFO = true; INFO_NAME = OPTION[i][1]; }
}

if (!FIRST_PASS && !FADE_IN) {image_alpha = 2; FIRST_PASS = true; } 

// FADE_IN

if (FADE_IN && image_alpha < 1)
	image_alpha += FADE_POWER * delta_time;
else
	FADE_IN = false;

if (PARENT != "NULL") {
	if (instance_exists(PARENT) && PARENT.TAG + "VISIO" == TAG) {
		if (y > Y_TARGET && !CLOSE) {
			y -= 0.0001 * delta_time
			if (COMPONENTS != "NULL") {
				for (var i = 0; COMPONENTS[i] != "NULL"; i++) {
					var obj = COMPONENTS[i];
					obj.y -= 0.0001 * delta_time;
					if (obj.TEXT_CONNECT != "NULL")	
						obj.TEXT_CONNECT.y -= 0.0001 * delta_time;
					if (obj.OBJECT_LINKED != "NULL")
						obj.OBJECT_LINKED.y -= 0.0001 * delta_time;
				}
			}
		} else if (CLOSE) {
			if (y < Y_TARGET + 20) {
				y += 0.0001 * delta_time;
				image_alpha -= 0.00001 * delta_time;
				if (COMPONENTS != "NULL") {
					for (var i = 0; COMPONENTS[i] != "NULL"; i++) {
						var obj = COMPONENTS[i];
						if (!instance_exists(obj))
							continue;
						obj.y += 0.0001 * delta_time; 
						obj.image_alpha = image_alpha;
						if (obj.TEXT_CONNECT != "NULL")	
							obj.TEXT_CONNECT.y += 0.0001 * delta_time;
						if (obj.OBJECT_LINKED != "NULL") {
							obj.OBJECT_LINKED.y += 0.0001 * delta_time;
							obj.OBJECT_LINKED.image_alpha = image_alpha;
						}
				}
			}
			} else {
				if (COMPONENTS != "NULL") {
					for (var i = 0; COMPONENTS[i] != "NULL"; i++)
						if (instance_exists(COMPONENTS[i]))
							DestroyButtonBox(COMPONENTS[i].TAG);
				}
				DestroyObject(TAG);
			}
		}
	}
}