function savegame_save(PATH, SAVE_LIST) {
	var list, path;

	list = ds_list_create();

	// PLACE YOUR VARIABLES HERE

	for (var i = 0; SAVE_LIST[i] != undefined; i++)
		list[| i] = SAVE_LIST[i];

	// ARRAYS CAN BE SAVED TOO

	// AND ANY DATA SCTRUCTURES WITH ds_list_add_* FUNCTIONS

	/*******************/

	// file save and encryption

	path = working_directory + PATH; // file path

	if (file_exists(path)) { // check file in directory
		file_delete(path); // delete old file
	}

	str = ds_list_write(list); // write your variables in string
	string_save_encrypted(str, path); // encrypt string and save to file
}
