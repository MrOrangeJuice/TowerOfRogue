/// @description Update

key_restart = keyboard_check_pressed(ord("R"));
key_pause = keyboard_check_pressed(vk_escape);
key_up = keyboard_check_pressed(ord("W")) || keyboard_check_pressed(vk_up);
key_down = keyboard_check_pressed(ord("S")) || keyboard_check_pressed(vk_down);
key_select = keyboard_check_pressed(ord("Z")) || keyboard_check_pressed(vk_space);

if (key_restart || key_pause || key_up || key_down || key_select)
{
	global.controller = 0;
}

if ((gamepad_axis_value(0,gp_axislv) < -0.4 && analogUpPrev == false) || gamepad_button_check_pressed(0,gp_padu) || (gamepad_axis_value(4,gp_axislv) < -0.4 && analogUpPrevD == false) || gamepad_button_check_pressed(4,gp_padu))
{
	key_up = 1;
	global.controller = 1;
	analogUpPrev = true;
}

if ((gamepad_axis_value(0,gp_axislv) > 0.4 && analogDownPrev == false) || gamepad_button_check_pressed(0,gp_padd) || (gamepad_axis_value(4,gp_axislv) > 0.4 && analogDownPrevD == false) || gamepad_button_check_pressed(4,gp_padd))
{
	key_down = 1;
	global.controller = 1;
	analogDownPrev = true;
}

if (gamepad_button_check_pressed(0,gp_face1) || gamepad_button_check_pressed(4,gp_face1))
{
	key_select = 1;
	global.controller = 1;
}

if (gamepad_button_check_pressed(0,gp_start) || gamepad_button_check_pressed(4,gp_start))
{
	key_pause = 1;
	global.controller = 1;
}

if (gamepad_button_check_pressed(0,gp_select) || gamepad_button_check_pressed(4,gp_select))
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
		// Reset pause menu
		pauseOption = 0;
	}
	else if(!global.paused && global.canPause)
	{
		audio_play_sound(snd_PauseOut,5,false);
		global.paused = true;
	}
}

if(global.paused)
{
	if(key_up)
	{
		audio_play_sound(snd_MenuMove,5,false);
		pauseOption--;
		if(pauseOption <= -1)
		{
			pauseOption = 2;	
		}
	}

	if(key_down)
	{
		audio_play_sound(snd_MenuMove,5,false);
		pauseOption++;
		if(pauseOption >= 3)
		{
			pauseOption = 0;	
		}
	}
	
	if(key_select)
	{
		audio_play_sound(snd_MenuSelect,5,false);
		switch(pauseOption)
		{
			case 0:
				audio_play_sound(snd_PauseOut,5,false);
				// Reset pause menu
				if(instance_exists(oPlayer))
				{
					oPlayer.canJump = false;	
				}
				pauseOption = 0;
				global.paused = false;	
				break;
			case 1:
				window_set_fullscreen(!window_get_fullscreen());
				break;
			case 2:
				SlideTransition(TRANS_MODE.GOTO, rTitle);
				break;
		}
	}
}

if(key_restart)
{
	SlideTransition(TRANS_MODE.RESTART);
}