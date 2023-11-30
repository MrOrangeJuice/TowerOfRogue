key_left = keyboard_check(ord("A")) || keyboard_check(vk_left);
key_right = keyboard_check(ord("D")) || keyboard_check(vk_right);
key_jump = keyboard_check_pressed(vk_space) || keyboard_check_pressed(ord("Z")) || keyboard_check_pressed(ord("P"));

if (key_left) || (key_right) || (key_jump)
{
	global.controller = 0;
}

// Gamepad input
if (gamepad_button_check_pressed(0,gp_face1))
{
	key_jump = 1;
	global.controller = 1;
}
if (gamepad_button_check_pressed(4,gp_face1))
{
	key_jump = 1;
	global.controller = 2;
}

if (gamepad_axis_value(0,gp_axislh) < -0.2 || gamepad_button_check(0,gp_padl))
{
	global.controller = 1;
}
if (gamepad_axis_value(4,gp_axislh) < -0.2 || gamepad_button_check(4,gp_padl))
{
	global.controller = 2;
}

if (gamepad_axis_value(0,gp_axislh) > 0.2 || gamepad_button_check(0,gp_padr))
{
	global.controller = 1;
}
if (gamepad_axis_value(4,gp_axislh) > 0.2 || gamepad_button_check(4,gp_padr))
{
	global.controller = 2;
}


if(global.controller == 2)
{
	sprite_index = sStartControllerPS;	
}
if(global.controller == 1)
{
	sprite_index = sStartController;	
}
else
{
	sprite_index = sStart;	
}

if(key_jump)
{
	audio_play_sound(snd_MenuSelect,5,false);
	if(!global.tutorialCompleted)
	{
		SlideTransition(TRANS_MODE.GOTO,rTutorial);
	}
	else
	{
		SlideTransition(TRANS_MODE.GOTO,rHub);
	}
}