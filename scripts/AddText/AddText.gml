
function AddText(X, Y, TEXT, FONT, COLOR, LAYER, TAG, OPTION){
	var text = instance_create_layer(X, Y, LAYER, OText);
	text.TEXT = TEXT;
	text.FONT = FONT;
	text.COLOR = COLOR;
	text.OPTION = OPTION;
	text.TAG = TAG;
	text.TYPE = "TEXT";
	var class = [TAG, text, room];
	var i = 0;
	for (; global.TEXT[i] != undefined;) { i++; }
	global.TEXT[i] = class;
	global.TEXT[i + 1] = undefined;
	return text;
}

function GetText(TAG) {

	if (global.TEXT[0] == undefined)
		return undefined;
	var i = 0;
	for (; global.TEXT[i] != undefined && global.TEXT[i][0] != TAG;)
		i++;
	if (global.TEXT[i] != undefined && global.TEXT[i][2] == room)
		return global.TEXT[i][1]
	else
		return undefined;
}

function DestroyText(TAG) {
	
	var i = 0;
	for (; global.TEXT[i] != undefined && global.TEXT[i][0] != TAG;) { i++ };
	if (global.TEXT[i] == undefined || global.TEXT[i][2] != room)
		return;
	instance_destroy(global.TEXT[i][1]);
	for (; global.TEXT[i] != undefined; i++)
		global.TEXT[i] = global.TEXT[i + 1];
}

