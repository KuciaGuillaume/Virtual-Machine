/////////////////////////////////////
//// GUILLAUME KUCIA  ////
////////////////////////////////////
// SCRIPT TITLE : DIFF


function Diff(V1, V2){
	
	if (V1 > V2)
		return V1 - V2;
	else
		return V2 - V1;
}

function MathPercentOf( value , ref ) {
	
	return (value * 100) / ref;
	
}

function MathPercentToValue( percent, ref ) {
	
	return (percent * ref) / 100;
	
}


function MathPercentOf2( percent , ref, new_ref ) {
	
	var percent_value = MathPercentOf(percent, ref);
	return MathPercentToValue(percent_value, new_ref);

}