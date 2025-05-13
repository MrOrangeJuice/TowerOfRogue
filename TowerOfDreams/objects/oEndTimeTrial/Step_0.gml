/// @description Check for continue button

key_select_pressed = keyboard_check_pressed(ord("Z")) || keyboard_check_pressed(ord("P")) || keyboard_check_pressed(vk_space);
key_select = keyboard_check(ord("Z")) || keyboard_check(ord("P")) || keyboard_check(vk_space);

if(key_select_pressed || key_select)
{
	global.controller = 0;	
}

if(gamepad_button_check_pressed(0,gp_face1))
{
	key_select_pressed = true;
	global.controller = 1;
}
if(gamepad_button_check_pressed(4,gp_face1))
{
	key_select_pressed = true;
	global.controller = 2;
}

if(gamepad_button_check(0,gp_face1))
{
	key_select = true;
	global.controller = 1;
}
if(gamepad_button_check(4,gp_face1))
{
	key_select = true;
	global.controller = 2;
}

if(key_select_pressed && !levelProgressed)
{
	audio_play_sound(snd_MenuSelect,5,false);
	audio_stop_sound(snd_GemLoop);
	audio_stop_sound(msc_BonusItem);
	SlideTransition(TRANS_MODE.GOTO,rMemoryZoo);
	// Prevent mashing to increment level more than once
	levelProgressed = true;
	global.timeTrial = false;
	global.timeIncrement = true;
}