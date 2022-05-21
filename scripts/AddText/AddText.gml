
function AddText(X, Y, TEXT, FONT, COLOR, LAYER, TAG, OPTION){
	var text = instance_create_layer(X, Y, LAYER, OText);
	text.TEXT = TEXT;
	text.FONT = FONT;
	text.COLOR = COLOR;
	text.OPTION = OPTION;
	class = [TAG, text, room];
	for (var i = 0; global.TEXT[i] != "NULL";) { i++; }
	global.TEXT[i] = class;
	global.TEXT[i + 1] = "NULL";
}

function GetText(TAG) {

	if (global.TEXT[0] == "NULL")
		return "NULL";
	var i = 0;
	for (; global.TEXT[i] != "NULL" && global.TEXT[i][0] != TAG;)
		i++;
	if (global.TEXT[i] != "NULL" && global.TEXT[i][2] == room)
		return global.TEXT[i][1]
	else
		return "NULL";
}

function DestroyText(TAG) {
	
	for (var i = 0; global.TEXT[i] != "NULL" && global.TEXT[i][0] != TAG;) { i++ };
	if (global.TEXT[i] == "NULL" || global.TEXT[i][2] != room)
		return;
	instance_destroy(global.TEXT[i][1]);
	for (; global.TEXT[i] != "NULL"; i++)
		global.TEXT[i] = global.TEXT[i + 1];
}

