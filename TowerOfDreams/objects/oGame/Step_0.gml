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
		audio_play_sound(snd_PauseOut,5,false);
		global.paused = false;
		// Reset pause menu
		menuOption = 0;
	}
	else if(!global.paused && global.canPause)
	{
		audio_play_sound(snd_PauseIn,5,false);
		global.paused = true;
	}
}

if(room == rTitle)
{
	if(key_up)
	{
		audio_play_sound(snd_MenuMove,5,false);
		menuOption--;
		if(menuOption <= -1)
		{
			menuOption = 2;	
		}
	}

	if(key_down)
	{
		audio_play_sound(snd_MenuMove,5,false);
		menuOption++;
		if(menuOption >= 3)
		{
			menuOption = 0;	
		}
	}
	
	if(key_select)
	{
		audio_play_sound(snd_MenuSelect,5,false);
		switch(menuOption)
		{
			case 0:
				if(!options)
				{
					menuOption = 0;
					if(!global.tutorialCompleted)
					{
						SlideTransition(TRANS_MODE.GOTO,rTutorial);
					}
					else
					{
						SlideTransition(TRANS_MODE.GOTO,rHub);
					}
				}
				else
				{
					window_set_fullscreen(!window_get_fullscreen());
				}
				break;
			case 1:
				if(!options)
				{
					options = true;
				}
				else
				{
					deleted = true;
					// Delete Save
					if(file_exists("savedata.ini")){
						file_delete("savedata.ini");
					}
					global.tutorialCompleted = false;
					// Make new default file
					Save();
				}
				break;
			case 2:
				if(!options)
				{
					game_end();
				}
				else
				{
					options = false;
					deleted = false;
				}
				break;
		}
	}
}

if(global.paused)
{
	if(key_up)
	{
		audio_play_sound(snd_MenuMove,5,false);
		menuOption--;
		if(menuOption <= -1)
		{
			menuOption = 2;	
		}
	}

	if(key_down)
	{
		audio_play_sound(snd_MenuMove,5,false);
		menuOption++;
		if(menuOption >= 3)
		{
			menuOption = 0;	
		}
	}
	
	if(key_select)
	{
		audio_play_sound(snd_MenuSelect,5,false);
		switch(menuOption)
		{
			case 0:
				audio_play_sound(snd_PauseOut,5,false);
				// Reset pause menu
				if(instance_exists(oPlayer))
				{
					oPlayer.canJump = false;	
				}
				menuOption = 0;
				global.paused = false;	
				break;
			case 1:
				window_set_fullscreen(!window_get_fullscreen());
				break;
			case 2:
				// Reset pause menu
				if(instance_exists(oPlayer))
				{
					oPlayer.canJump = false;	
				}
				menuOption = 0;
				global.sword = true;
				global.paused = false;
				global.canPause = false;
				global.health = global.maxHealth;
				// Reset run
				global.usedArray = [false,false,false,false,false];
				global.inARun = false;
				global.coins = 0;
				global.levelCount = 0;
				SlideTransition(TRANS_MODE.GOTO, rTitle);
				break;
		}
	}
}

/*
if(key_restart)
{
	SlideTransition(TRANS_MODE.RESTART);
}
*/

// Record analog inputs for this frame
if(gamepad_axis_value(0,gp_axislv) < -0.4)
{
	analogUpPrev = true;	
}
else
{
	analogUpPrev = false;	
}

if(gamepad_axis_value(0,gp_axislv) > 0.4)
{
	analogDownPrev = true;	
}
else
{
	analogDownPrev = false;	
}

if(gamepad_axis_value(4,gp_axislv) < -0.4)
{
	analogUpPrevD = true;	
}
else
{
	analogUpPrevD = false;	
}

if(gamepad_axis_value(4,gp_axislv) > 0.4)
{
	analogDownPrevD = true;	
}
else
{
	analogDownPrevD = false;	
}