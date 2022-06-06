function savegame_load(PATH, LOAD_LIST) {
	var path, list;

	// file load and decryption

	path = working_directory + PATH; // file path, please don't change, may not work 

	if (file_exists(path)) { // check file in directory
		str = string_load_encrypted(path);
		list = ds_list_create(); // create list for vars
		ds_list_read(list, str); // add vars from string
  
		// PLACE YOUR VARIABLES HERE IN THE SAME ORDER AS IN THE SAVEGAME_SAVE SCRIPT
		for (var i = 0; i != ds_list_size(list); i++)
			LOAD_LIST[i] = list[| i];
	}
	return LOAD_LIST;
}
