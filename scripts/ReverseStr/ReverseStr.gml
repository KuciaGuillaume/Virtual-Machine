

function ReverseStr(str){
	var i, answer;
	answer = "";
	for(i = string_length(str); i > 0 ; i -= 1){
		answer += string_char_at(str, i);
	}
	return answer;
}

function MidleStr( y, text ) {
	
	return y - (string_height(text) / 2);
	
}

function CenterStr( x, text ) {
	
	return x - (string_width(text) / 2);
	
}