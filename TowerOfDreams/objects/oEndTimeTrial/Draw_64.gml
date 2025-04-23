/// @description Draw info

draw_set_halign(fa_center);
draw_set_color($B1D7F0);

if(levelFinished)
{
	draw_sprite(sTimeTrialCompleteStatic,0,128,display_get_gui_height()/2 - 40);
}

if(time)
{
	timeString = "Time: " + string(timeNum);
	if(timeNum > global.time)
	{
		timeNum--;	
		if(timeNum < global.timeTargetGold && !perfectTime)
		{
			perfectTime = true;
			audio_play_sound(snd_Perfect,5,false);
			audio_play_sound(snd_LevelIntro2,5,false);
		}
		else if(timeNum < global.timeTargetSilver && !silverTime)
		{
			silverTime = true;
			audio_play_sound(snd_LevelIntro2,5,false);
		}
	}
	else
	{
		if(!timeEnded)
		{
			audio_stop_sound(snd_GemLoop);
			audio_play_sound(snd_LevelIntro2,5,false);
			// Continue alarm
			alarm[1] = room_speed * 0.5;
			timeEnded = true;
		}
	}
	draw_set_color($6D454D);
	draw_text(128,display_get_gui_height()/2 - 23,timeString);
	draw_text(128,display_get_gui_height()/2 - 25,timeString);
	draw_text(129,display_get_gui_height()/2 - 24,timeString);
	draw_text(127,display_get_gui_height()/2 - 24,timeString);
	if(perfectTime)
	{
		draw_set_color($DDADE6);
	}
	else
	{
		draw_set_color($B1D7F0);
	}
	draw_text(128,display_get_gui_height()/2 - 24,timeString);
	
	// Draw medals
	draw_sprite(sMedalBigOutline,0,104,display_get_gui_height()/2);
	draw_sprite(sMedalBigOutline,0,152,display_get_gui_height()/2);
	
	if(silverTime)
	{
		draw_sprite(sSilverMedalBig,0,104,display_get_gui_height()/2);
	}
	if(perfectTime)
	{
		draw_sprite(sGoldMedalBig,0,152,display_get_gui_height()/2);
	}
}

if(continutePrompt)
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

// Reset color
draw_set_color($6D454D);