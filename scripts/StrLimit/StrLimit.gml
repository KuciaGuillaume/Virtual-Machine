/////////////////////////////////////
//// GUILLAUME KUCIA  ////
////////////////////////////////////
// SCRIPT TITLE : StrLimit


function StrLimit ( text , limit ) 
{
	if (string_byte_length(text) - 1 == limit)
		return text;
	
	var result = "";
	for (var i = 0; i <= limit; i++)
		result = result + string_char_at( text, i + 1 );
		
	return result + "...";
}