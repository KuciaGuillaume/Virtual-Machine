/////////////////////////////////////
//// GUILLAUME KUCIA  ////
////////////////////////////////////
// SCRIPT TITLE : 


function CreateEmptyCircle(x, y, radius, layer, color, tag, option) {
	
	var circle = CreateObjects(x, y, layer, OEmptyRoundCircle, "IMAGE", tag, OPTION);
	circle.CIRCLE_RADIUS = radius;
	circle.COLOR = color;

	return circle;
}