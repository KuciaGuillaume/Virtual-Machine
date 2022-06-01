
function CreateWrite(TAG, MAX, LAYER, TEXT) {
	
	var write = instance_create_layer(0, 0, "Gp1", Owrite_text);
	var bar = instance_create_layer(0, 0, LAYER, Owrite_bar);
	bar.PARENT = write;
	bar.visible = false;
	write.BAR = bar;
	write.MAX = MAX;
	write.TEXT_INDEX = 1;
	write.TEXT_INDEX_MAX = 1;
	write.TEXT[0] = TEXT;
	write.TEXT[1] = "";
	write.INITIAL_TEXT = TEXT;
	write.TAG = TAG;
	write.TYPE = "WRITE";
	write_class = [TAG, room, write];
	for (i = 0; global.WRITE[i] != "NULL";) { i++; }
	global.WRITE[i] = write_class;
	global.WRITE[i + 1] = "NULL";
}

function GetWrite(TAG) {
	
	i = 0;
	for (; global.WRITE[i] != "NULL" && global.WRITE[i][0] != TAG; ) i++;
	if (global.WRITE[i] != "NULL" && global.WRITE[i][1] == room)
		return global.WRITE[i][2];
	else
		return "NULL";
}

function UpdateBar(BAR, STEXT, X) {
	var char = STEXT / BAR.INDEX_MAX;
	var Size = (BAR.INDEX * char);
	if (BAR.INDEX_MAX == 0)
		Size = 0;
	var TARGET = (X + Size);
	var Speed = 0.000009 * delta_time;
	var distance = 0;
	
	if (BAR.x < TARGET) {
		distance = (TARGET - BAR.x);
		BAR.x += (Speed * distance);
	} else if (BAR.x > TARGET) {
		distance = (BAR.x - TARGET);
		BAR.x -= (Speed * distance);
	}
}

function DestroyWrite(TAG) {
	
	for (var i = 0; global.WRITE[i] != "NULL" && global.WRITE[i][0] != TAG;) { i++ };
	if (global.WRITE[i] == "NULL" || global.WRITE[i][1] != room)
		return;
	instance_destroy(global.WRITE[i][2].BAR);
	instance_destroy(global.WRITE[i][2]);
	for (; global.WRITE[i] != "NULL"; i++)
		global.WRITE[i] = global.WRITE[i + 1];
}


