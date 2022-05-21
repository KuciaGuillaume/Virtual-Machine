function string_save_encrypted(argument0, argument1) {
	var key, str, hash, str_len, file, byte;

	str = argument0;
	path = argument1;

	// Keys for xor encryption, first byte encrypted by first key, second by second, and so on. You can complicate encryption by adding new keys.
	// You also could wish to change default keys.
	key[0] = $CA; // must be from 1 to 255
	key[1] = $4F;
	key[2] = $2C

	str = base64_encode(str); // encode string with simple base64 for standardization
	hash = md5_string_unicode(str); // get hash of string (for tracking changes of file)
	str += hash; // add hash at the end of string
	str_len = string_length(str); // get number of symbols of string

	file = file_bin_open(path, 1) // create savefile
	for (var i = 0; i < str_len; i++) { // for every symbol of string
		byte = ord(string_char_at(str, i+1)); // get binary code of symbol
		byte ^= key[i mod 3]; // encode symbol with xor with one of three keys
		file_bin_write_byte(file, byte); // write byte in file
	}

	file_bin_close(file);


}

