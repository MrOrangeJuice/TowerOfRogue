/// @description Draw info

draw_set_halign(fa_center);

if(levelFinished)
{
	draw_sprite(sLevelCompleteStatic,0,128,display_get_gui_height()/2 - 40);
}

if(gems)
{
	gemString = "Gems: " + string(gemNum) + "/" + string(totalGemNum);
	if(gemNum < global.localCoins)
	{
		gemNum++;	
	}
	else
	{
		audio_stop_sound(snd_GemLoop);
	}
	draw_text(128,display_get_gui_height()/2 - 16,gemString);
}

if(continutePrompt)
{
	if(global.controller)
	{
		if(key_select)
		{
			draw_sprite(sContinueController,1,128,display_get_gui_height()/2 + 40);	
		}
		else
		{
			draw_sprite(sContinueController,0,128,display_get_gui_height()/2 + 40);	
		}
	}
	else
	{
		if(key_select)
		{
			draw_sprite(sContinue,1,128,display_get_gui_height()/2 + 40);	
		}
		else
		{
			draw_sprite(sContinue,0,128,display_get_gui_height()/2 + 40);	
		}
	}
}