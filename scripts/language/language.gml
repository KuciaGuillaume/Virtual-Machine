/////////////////////////////////////
//// GUILLAUME KUCIA  ////
////////////////////////////////////
// SCRIPT TITLE : Language Traduction

function AddTraduction( Tab_trad ) {
	
	var i1 = find_i1( Tab_trad[0][0] );
	
	Tab_trad[array_length(Tab_trad)] = undefined;
	global.MegaLangue[i1] = addtolist( Tab_trad, global.MegaLangue[i1]);
	
}


function find_i1( text ) {
	
	text = string_lower( text );
	return string_byte_at( text, 1) - 97;
}


function AutoLanguage( Text ) {
	
	var LANGUAGE = global.SETTINGS[7];
	var i1 = find_i1( Text );
	var MegaLangue = global.MegaLangue;
	

	for (var i = 0; MegaLangue[i1][i] != undefined; i++) {
		var pack =  MegaLangue[i1][i];
		
		for (var e = 0; pack[e] != undefined; e++) {
			if (pack[e][0] == Text && pack[e][1] == LANGUAGE)
				return Text;
			else if (pack[e][0] == Text && pack[e][1] != LANGUAGE) {
				e = 0;
				for (; pack[e][1] != LANGUAGE; ) { e++; }
				return pack[e][0];
			}
			
		}
	}
	
	return Text;

}