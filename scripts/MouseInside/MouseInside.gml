
function MouseInside(left, right, top, bottom) {
	
	if (mouse_x >= left && mouse_x <= right && mouse_y >= top && mouse_y <= bottom)
		return true;
	return false;
}