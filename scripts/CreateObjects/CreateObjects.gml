

// CREATE AN OBJECT AND ADD IT TO THE LIST
function CreateObjects(x, y, Layer, object, type, tag, option){
	
	// CREATE VARIABLES
	var i = 0;
	var Is_object = instance_create_layer(x, y, Layer, object);

	Is_object.TYPE = type;
	Is_object.TAG = tag;
	Is_object.OPTION = option;
	var CLASS = [Is_object, type, room, tag, undefined];
	global.OBJECTS = addtolist(CLASS, global.OBJECTS);
	if (type == "BUTTON" || type == "TEXT_BUTTON" || type == "INFO" || type == "BUTTON-NO-HAND" || type == "EMPT_BUTTON-NO-HAND" || type == "EMPT_BUTTON")
		global.BUTTONS = addtolist(CLASS, global.BUTTONS);
	return Is_object;
}

function GetObject(TAG) {

	if (global.OBJECTS[0] == undefined)
		return undefined;
	var i = 0;
	for (; global.OBJECTS[i] != undefined && global.OBJECTS[i][3] != TAG;)
		i++;
	if (global.OBJECTS[i] != undefined && global.OBJECTS[i][2] == room)
		return global.OBJECTS[i][0];
	else
		return undefined;
}


function CreateObjectSprite(x, y, Layer, sprite, object, type, tag, option){
	
	// CREATE VARIABLES
	var Isobject = instance_create_layer(x, y, Layer, object);

	Isobject.TYPE = type;
	Isobject.sprite_index = sprite;
	Isobject.TAG = tag;
	Isobject.OPTION = option;
	var CLASS = [Isobject, type, room, tag, undefined];
	global.OBJECTS = addtolist(CLASS, global.OBJECTS);
	if (type == "BUTTON" || type == "TEXT_BUTTON" || type == "INFO" || type == "BUTTON-NO-HAND" || type == "EMPT_BUTTON-NO-HAND" || type == "EMPT_BUTTON")
		global.BUTTONS = addtolist(CLASS, global.BUTTONS);
	return Isobject;
}

function DestroyObject(TAG) {
	var i = 0;
	for (; global.OBJECTS[i] != undefined && global.OBJECTS[i][3] != TAG;) { i++ };
	if (global.OBJECTS[i] == undefined || global.OBJECTS[i][2] != room)
		return;
	type = global.OBJECTS[i][1];
	if (type == "BUTTON" || type == "TEXT_BUTTON" || type == "INFO" || type == "BUTTON-NO-HAND" || type == "EMPT_BUTTON-NO-HAND" || type == "EMPT_BUTTON") {
		var e = 0;
		for (; global.BUTTONS[e] != undefined && global.BUTTONS[e][3] != TAG;) { e++ };
			if (global.BUTTONS[e] == undefined || global.BUTTONS[e][2] != room)
				return;
		for (; global.BUTTONS[e] != undefined; e++)
			global.BUTTONS[e] = global.BUTTONS[e + 1];
	}
	instance_destroy(global.OBJECTS[i][0]);
	for (; global.OBJECTS[i] != undefined; i++)
		global.OBJECTS[i] = global.OBJECTS[i + 1];
	
}


