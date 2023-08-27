/// @description Check for continue button

key_select_pressed = keyboard_check_pressed(ord("Z")) || keyboard_check_pressed(ord("P")) || keyboard_check_pressed(vk_space);
key_select = keyboard_check(ord("Z")) || keyboard_check(ord("P")) || keyboard_check(vk_space);

if(key_select_pressed || key_select)
{
	global.controller = 0;	
}

if(gamepad_button_check_pressed(0,gp_face1) || gamepad_button_check_pressed(4,gp_face1))
{
	key_select_pressed = true;
	global.controller = 1;
}

if(gamepad_button_check(0,gp_face1) || gamepad_button_check(4,gp_face1))
{
	key_select = true;
	global.controller = 1;
}

if(key_select_pressed && !levelProgressed)
{
	audio_play_sound(snd_MenuSelect,5,false);
	audio_stop_sound(snd_GemLoop);
	// Reset side room
	global.sideRoom = rTitle;
	global.shopRoom = rTitle;
	global.sideChestOpened = false;
	global.pipeSpawned = false;
	global.shopSpawned = false;
	global.pipeY = 0;
	global.shopY = 0;
	global.levelCount++;
	PickNextLevel();
	// Prevent mashing to increment level more than once
	levelProgressed = true;
}