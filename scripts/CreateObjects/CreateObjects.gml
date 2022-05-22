

// CREATE AN OBJECT AND ADD IT TO THE LIST
function CreateObjects(x, y, Layer, object, type, tag, option){
	
	// CREATE VARIABLES
	i = 0;
	object = instance_create_layer(x, y, Layer, object);

	object.TYPE = type;
	object.TAG = tag;
	object.OPTION = option;
	CLASS = [object, type, room, tag];
	for (; global.OBJECTS[i] != "NULL";) i++;
	global.OBJECTS[i] = CLASS;
	global.OBJECTS[i + 1] = "NULL";
	return object;
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
	i = 0;
	object = instance_create_layer(x, y, Layer, object);

	object.TYPE = type;
	object.sprite_index = sprite;
	object.TAG = tag;
	object.OPTION = option;
	CLASS = [object, type, room, tag];
	for (; global.OBJECTS[i] != "NULL";) i++;
	global.OBJECTS[i] = CLASS;
	global.OBJECTS[i + 1] = "NULL";
	return object;
}

function DestroyObject(TAG) {
	
	for (var i = 0; global.OBJECTS[i] != "NULL" && global.OBJECTS[i][3] != TAG;) { i++ };
	if (global.OBJECTS[i] == "NULL" || global.OBJECTS[i][2] != room)
		return;
	instance_destroy(global.OBJECTS[i][0]);
	for (; global.OBJECTS[i] != "NULL"; i++)
		global.OBJECTS[i] = global.OBJECTS[i + 1];
}


