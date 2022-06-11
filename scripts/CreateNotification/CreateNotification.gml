
function CreateNotification(ICON, TITLE, DESCRIPTION, TAG) {
	
	var get = GetObject(TAG);
	if (get != undefined)
		return;
	OPTION = [["FADE_IN", 0.000001], undefined];
	var X = 2100;
	var Y = 950;
	var notif = CreateObjects(X, Y, "Notifications_Gp0", Onotifications, "BUTTON-NO-HAND", TAG, OPTION);
	var icon = CreateObjectSprite(X - 123, Y - 25, "Notifications_Gp1", ICON, OJustGUI, "IMAGE", TAG + "ICON", OPTION);
	var title = AddText(X - 92, Y - 35, TITLE, Arial15, c_white, "Notifications_Gp1", TAG + "TITLE", OPTION);
	var description = AddText(X, Y + 18, DESCRIPTION, Arial10, c_white, "Notifications_Gp1", TAG + "DESCRIPTION", [["CENTERED"], ["FADE_IN", 0.000001], undefined]);
	var close = CreateObjectSprite(X + 138, Y - 40, "Notifications_Gp1", Sclose_notif, Obox, "BUTTON", "CLOSE_NOTIF", OPTION);
	notif.CLOSE_CONNECT = close;
	notif.ICON_CONNECT = icon;
	notif.TITLE_CONNECT = title;
	notif.DESCRIPTION_CONNECT = description;
	close.OBJECT_LINKED = notif;
	return notif;
}

function DestroyNotification(TAG) {
	var get  = GetObject(TAG);
	
	if (get == undefined)
		return;
	DestroyText(get.TITLE_CONNECT.TAG);
	DestroyText(get.DESCRIPTION_CONNECT.TAG);
	DestroyObject(get.CLOSE_CONNECT.TAG);
	DestroyObject(get.ICON_CONNECT.TAG);
	DestroyObject(TAG);
}

