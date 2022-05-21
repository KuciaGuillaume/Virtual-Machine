function savegame_clear(PATH) {
	var path = working_directory + PATH;

	if (file_exists(path)) {
		file_delete(path);
	}



}

