/// @description Update

key_restart = keyboard_check_pressed(ord("R"));
key_pause = keyboard_check_pressed(vk_escape);

if (key_restart || key_pause)
{
	global.controller = 0;
}

if (gamepad_button_check_pressed(0,gp_start))
{
	key_pause = 1;
	global.controller = 1;
}

if (gamepad_button_check_pressed(0,gp_select))
{
	key_restart = 1;
	global.controller = 1;
}

if(key_pause)
{
	if(global.paused)
	{
		audio_play_sound(snd_PauseIn,5,false);
		global.paused = false;
	}
	else if(!global.paused && global.canPause)
	{
		audio_play_sound(snd_PauseOut,5,false);
		global.paused = true;
	}
}

if(key_restart)
{
	SlideTransition(TRANS_MODE.RESTART);
}