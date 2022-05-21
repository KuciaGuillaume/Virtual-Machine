function string_load_encrypted(argument0) {
	var key, file, file_len, str, byte, str_len, hash_str, hash_file;

	path = argument0;

	// keys for xor decryption from save script
	key[0] = $CA;
	key[1] = $4F;
	key[2] = $2C

	file = file_bin_open(path, 0); // open file
	file_len = file_bin_size(file); // get number of symbols in file
	str = ""; // create string for reading the file

	for (var i = 0; i < file_len; i++) { // for every symbol of file
		byte = file_bin_read_byte(file); // get byte
		byte ^= key[i mod 3]; // decrypt byte with one of three keys
		str += chr(byte); // add decrypted symbol to string
	}

	file_bin_close(file);

	str_len = string_length(str); // get number of symbols of string
	hash_str = string_copy(str, str_len-31, 32); // get hash of string
	str = string_delete(str, str_len-31, 32); // delete hash from string
	hash_file = md5_string_unicode(str); // get hash of file

	if (hash_str != hash_file) { // if hashes are not the same (that someone tryied to hack the file)
		show_message("Savegame File is Corrupted!"); // throw an error
		file_delete(path); // delete corrupted file
		exit; // exit form script
	}
	str = base64_decode(str); // if hashes are same and everything is ok, return string

	return str;


}
