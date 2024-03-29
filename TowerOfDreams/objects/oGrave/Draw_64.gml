/// @description Draw

draw_set_halign(fa_center);

if(drawYouPerished)
{
	draw_sprite(sYouPerished,0,128,display_get_gui_height()/2 - 40);
}

if(drawGems)
{
	if(shiftToTotal)
	{
		if (!finishedShifting) 
		{
			if(global.coinsThisRun > 0)
			{
				// Go way faster if more than 100 gems to tally
				if(global.coinsThisRun > 100)
				{
					global.coinsThisRun -= 5;
					global.overallCoins += 5;
				}
				else
				{
					global.coinsThisRun--;
					global.overallCoins++;
				}
			}
			if(global.coinsThisRun <= 0)
			{
				finishedShifting = true;
				audio_stop_sound(snd_GemLoop);
				audio_play_sound(snd_LevelIntro2,5,false);
				alarm[1] = room_speed * 1;
			}
		}
	}
	
	gemString = "Gems: " + string(global.coinsThisRun);
	
	draw_set_color($6D454D);
	draw_text(128,display_get_gui_height()/2 - 23,gemString);
	draw_text(128,display_get_gui_height()/2 - 25,gemString);
	draw_text(129,display_get_gui_height()/2 - 24,gemString);
	draw_text(127,display_get_gui_height()/2 - 24,gemString);

	draw_set_color($B1D7F0);	
	draw_text(128,display_get_gui_height()/2 - 24,gemString);
}

if(drawOverallGems)
{
	gemString = "Total Gems: " + string(global.overallCoins);
	
	draw_set_color($6D454D);
	draw_text(128,display_get_gui_height()/2 - 7,gemString);
	draw_text(128,display_get_gui_height()/2 - 9,gemString);
	draw_text(129,display_get_gui_height()/2 - 8,gemString);
	draw_text(127,display_get_gui_height()/2 - 8,gemString);
	
	draw_set_color($B1D7F0);
	draw_text(128,display_get_gui_height()/2 - 8,gemString);
}

if(drawContinue)
{
	if(global.controller == 2 && !gamepad_is_connected(0))
	{
		if(key_select)
		{
			draw_sprite(sContinueControllerPS,1,128,display_get_gui_height()/2 + 48);	
		}
		else
		{
			draw_sprite(sContinueControllerPS,0,128,display_get_gui_height()/2 + 48);	
		}
	}
	else if(global.controller == 1 || global.controller == 2)
	{
		if(key_select)
		{
			draw_sprite(sContinueController,1,128,display_get_gui_height()/2 + 48);	
		}
		else
		{
			draw_sprite(sContinueController,0,128,display_get_gui_height()/2 + 48);	
		}
	}
	else
	{
		if(key_select)
		{
			draw_sprite(sContinue,1,128,display_get_gui_height()/2 + 48);	
		}
		else
		{
			draw_sprite(sContinue,0,128,display_get_gui_height()/2 + 48);	
		}
	}
}

// Reset draw color
draw_set_color($6D454D);