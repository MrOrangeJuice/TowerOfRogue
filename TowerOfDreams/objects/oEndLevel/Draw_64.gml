/// @description Draw info

draw_set_halign(fa_center);
draw_set_color($B1D7F0);

if(levelFinished)
{
	draw_sprite(sLevelCompleteStatic,0,128,display_get_gui_height()/2 - 32);
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
			// Damage alarm
			alarm[2] = room_speed * 0.5;
			gemsEnded = true;
		}
	}
	draw_text(128,display_get_gui_height()/2 - 16,gemString);
}

if(damage)
{
	damageString = "Damage: ";
	if(damageDisplay) damageString = "Damage: " + string(global.localDamage);
	draw_text(128,display_get_gui_height()/2,damageString);
}

if(rank)
{
	rankText = "Rank :";
	if(rankLetter) rankText = "Rank: " + yourRank;
	draw_text(128,display_get_gui_height()/2 + 16,rankText);
}

if(continutePrompt)
{
	if(global.controller)
	{
		if(key_select)
		{
			draw_sprite(sContinueController,1,128,display_get_gui_height()/2 + 56);	
		}
		else
		{
			draw_sprite(sContinueController,0,128,display_get_gui_height()/2 + 56);	
		}
	}
	else
	{
		if(key_select)
		{
			draw_sprite(sContinue,1,128,display_get_gui_height()/2 + 56);	
		}
		else
		{
			draw_sprite(sContinue,0,128,display_get_gui_height()/2 + 56);	
		}
	}
}

// Reset color
draw_set_color($6D454D);