
function GetCollisons(object1, object2){
	var x1 = object1.x - (object1.sprite_width / 2);
	var x2 = object1.x + (object1.sprite_width / 2);
	var y1 = object1.y - (object1.sprite_height / 2);
	var y2 = object1.y + (object1.sprite_height / 2);
	return collision_rectangle(x1, y1, x2, y2, object2, false, true);
}

