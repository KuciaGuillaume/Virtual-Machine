/////////////////////////////////////
//// GUILLAUME KUCIA  ////
////////////////////////////////////
// SCRIPT TITLE : 


function AutoLanguageSave (Text, i1) {
	
	var LANGUAGE = global.SETTINGS[7];
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