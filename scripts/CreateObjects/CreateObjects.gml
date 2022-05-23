

// CREATE AN OBJECT AND ADD IT TO THE LIST
function CreateObjects(x, y, Layer, object, type, tag, option){
	
	// CREATE VARIABLES
	var i = 0;
	var Is_object = instance_create_layer(x, y, Layer, object);

	Is_object.TYPE = type;
	Is_object.TAG = tag;
	Is_object.OPTION = option;
	CLASS = [Is_object, type, room, tag];
	for (; global.OBJECTS[i] != "NULL";) i++;
	global.OBJECTS[i] = CLASS;
	global.OBJECTS[i + 1] = "NULL";
	return Is_object;
}

function GetObject(TAG) {

	if (global.OBJECTS[0] == "NULL")
		return "NULL";
	var i = 0;
	for (; global.OBJECTS[i] != "NULL" && global.OBJECTS[i][3] != TAG;)
		i++;
	if (global.OBJECTS[i] != "NULL" && global.OBJECTS[i][2] == room)
		return global.OBJECTS[i][0];
	else
		return "NULL";
}


function CreateObjectSprite(x, y, Layer, sprite, object, type, tag, option){
	
	// CREATE VARIABLES
	var i = 0;
	var Isobject = instance_create_layer(x, y, Layer, object);

	Isobject.TYPE = type;
	Isobject.sprite_index = sprite;
	Isobject.TAG = tag;
	Isobject.OPTION = option;
	CLASS = [Isobject, type, room, tag];
	for (; global.OBJECTS[i] != "NULL";) i++;
	global.OBJECTS[i] = CLASS;
	global.OBJECTS[i + 1] = "NULL";
	return Isobject;
}

function DestroyObject(TAG) {
	var i = 0;
	for (; global.OBJECTS[i] != "NULL" && global.OBJECTS[i][3] != TAG;) { i++ };
	if (global.OBJECTS[i] == "NULL" || global.OBJECTS[i][2] != room)
		return;
	instance_destroy(global.OBJECTS[i][0]);
	for (; global.OBJECTS[i] != "NULL"; i++)
		global.OBJECTS[i] = global.OBJECTS[i + 1];
}


