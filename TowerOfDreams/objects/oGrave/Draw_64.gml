/// @description Draw

draw_set_halign(fa_center);

if(drawYouPerished)
{
	draw_sprite(sYouPerished,0,128,display_get_gui_height()/2 - 56);
}

if(drawGems)
{
	if(shiftToTotal)
	{
		if (!finishedShifting) 
		{
			global.coinsThisRun--;
			global.overallCoins++;
			if(global.coinsThisRun <= 0)
			{
				finishedShifting = true;
				audio_stop_sound(snd_GemLoop);
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
	if(global.controller)
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