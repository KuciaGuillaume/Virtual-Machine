/// @Project by Kucia Guillaume* ///

if (TAG == undefined)
	return;


if (CLOSE && string_count("DOCUMENT", WINDOW_TAG)) {
	// DESTROY SETTING

	// DELETE ALL
	for (var i = 0; all_DocViewer[i] != undefined; i++) {
		var get = all_DocViewer[i][0];

		if (!CLOSE)
			WINDOW.list_objects = remove_findlist(get, WINDOW.list_objects);
		if (get.TYPE == "EMPT_BUTTON-NO-HAND" || get.TYPE == "EMPT_BUTTON") {
			if (string_count("SELECTV2", get.TAG) == 0)
				DestroyEmptyButton(get.TAG);
			else {
				for (var e = 0; get.SELECTS[e] != undefined; e++)
					DestroyEmptyButton(get.SELECTS[e].TAG);
				DestroyObject(get.TAG + "BOX");
				DestroyEmptyButton(get.TAG);
			}
		}
		if (get.TYPE == "TEXT")
			DestroyText(get.TAG);
		if (get.TYPE == "IMAGE" || get.TYPE == "BUTTON" || get.TYPE == "CHECKER")
			DestroyObject(get.TAG);
		if (get.TYPE == "TEXT_BUTTON")
			DestroyTextButton(get.TAG);
	}
	all_DocViewer = [undefined];
	DestroyObject(TAG);
	return;
}

if ((WINDOW != undefined && instance_exists(WINDOW)) && !CLOSE && string_count("DOCUMENT", WINDOW.TAG) ) {
	
	if (CREATE) {

		for (var i = 0; all_DocViewer[i] != undefined; i++) {
			var get = all_DocViewer[i][0];
			//all_DocViewer[i][3] = image_alpha;
			//get.image_alpha = all_DocViewer[i][3];
			if (get.TYPE != "EMPT_BUTTON-NO-HAND" || get.TYPE == "EMPT_BUTTON") {
				if (all_DocViewer[i][1] != undefined)
					get.x = x + all_DocViewer[i][1];
				if (all_DocViewer[i][2] != undefined)
					get.y = y + all_DocViewer[i][2];
			}
			get.ON = WINDOW.ON;
		}
		if (VIEWER != undefined)
			VIEWER.ALPHA = image_alpha;
		ON = false;
	}
	if (!CREATE) {
		
		if (DOCUMENT_VIEWER != undefined) {
			VIEWER = CreateObjectSprite(x - 375, y + 10, WINDOW.LAYERS[0], DOCUMENT_VIEWER, OJustButtonViewer, "IMAGE", TAG + "DOCUMENT_ON_VIEWER", [undefined]);
			VIEWER.SET_DISPLAY_LEFT = true;
			VIEWER.IMAGE_HEIGHT = 850;
			VIEWER.IMAGE_TOP = 0;
			VIEWER.IMAGE_WIDTH = 750;
			VIEWER.IMAGE_LEFT = 0;
			VIEWER.image_index = DOCUMENT_VIEWER_INDEX;
			WINDOW.list_objects = addtolist(VIEWER, WINDOW.list_objects);
			all_DocViewer = addtolist([VIEWER, -375, 10, 1], all_DocViewer);
		}
		
		CREATE = true;
	} else if (CREATE && (WINDOW.ON || WINDOW.REDUCING || !WINDOW.FADE_MOVEMENT)) {
		ON = true;
	}	
	return;
}
