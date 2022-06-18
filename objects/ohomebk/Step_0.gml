/// @Project by Kucia Guillaume* ///

if (TAG == undefined)
	return;
if (!FIRST_PASS && !FADE_IN) {image_alpha = 2; FIRST_PASS = true; } 

// FADE_IN

if (FADE_IN && image_alpha < 1)
	image_alpha += FADE_POWER * delta_time;
else
	FADE_IN = false;

if (IMAGE_WIDTH < 0) {
	IMAGE_WIDTH = sprite_width;
	IMAGE_HEIGHT = sprite_height;
}

if (KeyPressed(ord("E")) && KeyPress(vk_control)) var ctre = true;
else var ctre = false;
if (KeyPressed(ord("T")) && KeyPress(vk_control)) var ctrt = true;
else var ctrt = false;

	

if (TIMER_OUT) {
	TIMER_DELTA += delta_time / 1000000;
	if (TIMER_DELTA >= TIMER_TIME) {
		TIMER_STATE_END = true;
		image_alpha -= 0.00001 * delta_time;
		y += 0.00001 * delta_time;
		if (image_alpha <= 0) {
			ON_MAIN_SCENE.HOME = undefined;
			DestroyObject(TAG);
		}
	}
}

if (SLIDE && image_alpha < 1 && ON) {
	y -= SLIDE_POWER * delta_time;
	if (TEXT_CONNECT != undefined)
		TEXT_CONNECT.y -= SLIDE_POWER * delta_time;
} else if (image_alpha >= 1 && SLIDE)
	SLIDE_OUT = true;

// DESTROY

if ((mouse_check_button_pressed(mb_any) && !MouseInsideObject(id) || ctre || ctrt) && !TIMER_OUT)
	DestroyHome();
