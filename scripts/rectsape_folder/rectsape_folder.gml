// Les actifs du script ont changé pour v2.3.0 Voir
// https://help.yoyogames.com/hc/en-us/articles/360005277377 pour plus d’informations
function rectsape_folder(ID, DIR) {
	var top = ID.y + 75;
	var bottom = ID.bbox_bottom - 50;
	for (var i = 0; ID.FOLDER_LIST[i] != undefined; i++)  {
		var obj = ID.FOLDER_LIST[i];
		if (DIR != undefined) {
			if (DIR != "UP")
				var SPEED = 0.001 * delta_time;
			else
				var SPEED = 0.001 * delta_time;
			if (DIR == 1 || DIR == "DOWN") obj.PARENT_DIFF_Y -= SPEED; else obj.PARENT_DIFF_Y += SPEED;
		}
				
		// MOVE RECTANGME SHAPE OBJECT LINKED
		var obj_top = obj.OBJECT_LINKED.y - obj.OBJECT_LINKED.sprite_height/2;
		var obj_bottom = obj.OBJECT_LINKED.y + obj.OBJECT_LINKED.sprite_height/2;
		
		// UP
		if (obj_top < top) {
			var diff = top - obj_top;
			obj.OBJECT_LINKED.IMAGE_TOP = diff;
		} else
			obj.OBJECT_LINKED.IMAGE_TOP = 0;
	
		// MOVE RECTANGME SHAPE
		var obj_top = obj.y - obj.sprite_height/2;
		if (obj_top < top) {
			obj.TEXT_CONNECT.visible = false;
			obj.DOCK_TYPE_TEXT.visible = false;
			var diff = top - obj_top;
			obj.IMAGE_TOP = diff;
		} else
			obj.IMAGE_TOP = 0;
		//DOWN
		if (obj_bottom > bottom) {
			var diff = obj_bottom - bottom;
			obj.OBJECT_LINKED.IMAGE_HEIGHT = obj.OBJECT_LINKED.sprite_height - diff;
		} else
			obj.OBJECT_LINKED.IMAGE_HEIGHT = obj.OBJECT_LINKED.sprite_height;
		var obj_bottom = obj.y + obj.sprite_height/2;
		if (obj_bottom > bottom) {
			var diff = obj_bottom - bottom;
			obj.TEXT_CONNECT.visible = false;
			obj.DOCK_TYPE_TEXT.visible = false;
			obj.IMAGE_HEIGHT = obj.sprite_height - diff;
		} else
			obj.IMAGE_HEIGHT = obj.sprite_height;
	
		if (obj_top > top && obj_bottom < bottom) {
			obj.TEXT_CONNECT.visible = true;
			obj.DOCK_TYPE_TEXT.visible = true;
		}
	}
}