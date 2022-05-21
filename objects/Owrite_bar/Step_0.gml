/// @Project by Kucia Guillaume* ///



// CHEKC IF ACTIVE
if (!PARENT.ON_WRITE)
	return;

// UDPATE
TIME += delta_time / 1000000;

if (TIME >= TIMER) {
	TIME = 0;
	if (visible)
		visible = false;
	else
		visible = true;
}
	
