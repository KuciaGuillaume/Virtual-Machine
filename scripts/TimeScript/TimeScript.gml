/////////////////////////////////////
//// GUILLAUME KUCIA  ////
////////////////////////////////////
// SCRIPT TITLE : 


function TimeAction ( Time , unity , variable )  {
	
	var response = {
		state : false,
		value : variable
	};
	
	if (unity = "second" || unity = "seconds" || unity = "s") {
		variable += delta_time / 1000000;
		
		if (variable >= Time) {
			variable = 0;
			response.state = true;
		}
	}
	
	if (unity = "minute" || unity = "minutes" || unity = "m") {
		variable += delta_time / 1000000;
		
		if (variable >= (Time * 60)) {
			variable = 0;
			response.state = true;
		}
	}
	
	if (unity = "hour" || unity = "hours" || unity = "h") {
		variable += delta_time / 1000000;
		
		if (variable >= (Time * 3600)) {
			variable = 0;
			response.state = true;
		}
	}
	
	if (unity = "day" || unity = "days" || unity = "d") {
		variable += delta_time / 1000000;
		
		if (variable >= (Time * 86400)) {
			variable = 0;
			response.state = true;
		}
	}
	
	response.value = variable;
	return response;
}