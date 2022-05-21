/// @Project by Kucia Guillaume* ///


// BUTTON STATE

image_index = 0;

for (var i = 0; global.OBJECTS[i] != "NULL"; i++) {
	var class = global.OBJECTS[i];
	
	if ((class[1] != "BUTTON" && class[1] != "TEXT_BUTTON") || class[2] != room)
		continue;
	if (GetCollisons(Ocursor, class[0]) && class[0].image_index < 2) {
		if (class[1] == "BUTTON")
			image_index = 1;
		if (class[1] == "TEXT_BUTTON")
			image_index = 2;
		class[0].image_index = 1;
	} else if (class[0].image_index == 1 && class[0].image_index != 0)
		class[0].image_index = 0;
}


// UPDATE POSITION

if (image_index == 0)
	x = mouse_x;
else
	x = mouse_x - 10;
y = mouse_y;

