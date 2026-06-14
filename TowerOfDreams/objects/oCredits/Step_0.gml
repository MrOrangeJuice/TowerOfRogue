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

if(key_select_pressed)
{
	audio_play_sound(snd_MenuSelect,5,false);
	audio_stop_sound(msc_Credits);
	global.floor1Music = false;
	SlideTransition(TRANS_MODE.GOTO,rHub);
}

if(y <= -400)
{
	moving = false;
}

if(moving)
{
	y -= 0.5;
}