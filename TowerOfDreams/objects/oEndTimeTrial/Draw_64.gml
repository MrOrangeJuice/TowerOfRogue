/// @description Draw info

draw_set_halign(fa_center);
draw_set_color($B1D7F0);

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
		if(!gemsEnded)
		{
			audio_stop_sound(snd_GemLoop);
			audio_play_sound(snd_LevelIntro2,5,false);
			if(gemNum >= totalGemNum) perfectGems = true;
			if(perfectGems) audio_play_sound(snd_Perfect,5,false);
			// Damage alarm
			alarm[2] = room_speed * 0.6;
			gemsEnded = true;
		}
	}
	draw_set_color($6D454D);
	draw_text(128,display_get_gui_height()/2 - 23,gemString);
	draw_text(128,display_get_gui_height()/2 - 25,gemString);
	draw_text(129,display_get_gui_height()/2 - 24,gemString);
	draw_text(127,display_get_gui_height()/2 - 24,gemString);
	if(perfectGems)
	{
		draw_set_color($DDADE6);
	}
	else
	{
		draw_set_color($B1D7F0);
	}
	draw_text(128,display_get_gui_height()/2 - 24,gemString);
}

if(damage)
{
	damageString = "Damage: ";
	if(damageDisplay) damageString = "Damage: " + string(damageNum);
	draw_set_color($6D454D);
	draw_text(128,display_get_gui_height()/2 - 7,damageString);
	draw_text(128,display_get_gui_height()/2 - 9,damageString);
	draw_text(129,display_get_gui_height()/2 - 8,damageString);
	draw_text(127,display_get_gui_height()/2 - 8,damageString);
	if(damageDisplay && perfectDamage)
	{
		draw_set_color($DDADE6);
	}
	else
	{
		draw_set_color($B1D7F0);
	}
	draw_text(128,display_get_gui_height()/2 - 8,damageString);
}

if(rank)
{
	rankText = "Rank :";
	if(rankLetter) rankText = "Rank: " + yourRank;
	draw_set_color($6D454D);
	draw_text(128,display_get_gui_height()/2 + 9,rankText);
	draw_text(128,display_get_gui_height()/2 + 7,rankText);
	draw_text(129,display_get_gui_height()/2 + 8,rankText);
	draw_text(127,display_get_gui_height()/2 + 8,rankText);
	if(rankLetter && perfectRank)
	{
		draw_set_color($DDADE6);
	}
	else
	{
		draw_set_color($B1D7F0);
	}
	draw_text(128,display_get_gui_height()/2 + 8,rankText);
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