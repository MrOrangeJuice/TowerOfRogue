/// @description Draw info

draw_set_halign(fa_center);
draw_set_color($B1D7F0);

if(levelFinished)
{
	draw_sprite(sTimeTrialCompleteStatic,0,128,display_get_gui_height()/2 - 40);
}

if(time)
{
	timeString = "Time: " + string_format((timeNum / room_speed), 0, 2);
	if(timeNum > global.time)
	{
		if(timeNum > timeSilverNum + 60)
		{
			timeNum -= 20;	
		}
		else
		{
			timeNum--;	
		}
		if(timeNum < timeGoldNum && !perfectTime)
		{
			perfectTime = true;
			audio_play_sound(snd_SRank,5,false);
			audio_play_sound(snd_LevelIntro2,5,false);
		}
		else if(timeNum < timeSilverNum && !silverTime)
		{
			silverTime = true;
			audio_play_sound(snd_Perfect,5,false);
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
	draw_text(128,display_get_gui_height()/2 - 15,timeString);
	draw_text(128,display_get_gui_height()/2 - 17,timeString);
	draw_text(129,display_get_gui_height()/2 - 16,timeString);
	draw_text(127,display_get_gui_height()/2 - 16,timeString);
	if(perfectTime)
	{
		draw_set_color($DDADE6);
	}
	else
	{
		draw_set_color($B1D7F0);
	}
	draw_text(128,display_get_gui_height()/2 - 16,timeString);
	
	// Draw medals
	draw_sprite(sMedalBigOutline,0,104,display_get_gui_height()/2);
	draw_sprite(sMedalBigOutline,0,136,display_get_gui_height()/2);
	
	// Draw medal time
	draw_set_color($6D454D);
	draw_text(113,display_get_gui_height()/2 + 12,string_format((timeSilverNum / room_speed),0,2));
	draw_text(145,display_get_gui_height()/2 + 12,string_format((timeGoldNum / room_speed),0,2));
	draw_text(111,display_get_gui_height()/2 + 12,string_format((timeSilverNum / room_speed),0,2));
	draw_text(143,display_get_gui_height()/2 + 12,string_format((timeGoldNum / room_speed),0,2));
	draw_text(112,display_get_gui_height()/2 + 13,string_format((timeSilverNum / room_speed),0,2));
	draw_text(144,display_get_gui_height()/2 + 13,string_format((timeGoldNum / room_speed),0,2));
	draw_text(112,display_get_gui_height()/2 + 11,string_format((timeSilverNum / room_speed),0,2));
	draw_text(144,display_get_gui_height()/2 + 11,string_format((timeGoldNum / room_speed),0,2));
	
	draw_set_color($B1D7F0);
	draw_text(112,display_get_gui_height()/2 + 12,string_format((timeSilverNum / room_speed),0,2));
	draw_text(144,display_get_gui_height()/2 + 12,string_format((timeGoldNum / room_speed),0,2));
	
	if(silverTime)
	{
		draw_sprite(sSilverMedalBig,0,104,display_get_gui_height()/2);
	}
	if(perfectTime)
	{
		draw_sprite(sGoldMedalBig,0,136,display_get_gui_height()/2);
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