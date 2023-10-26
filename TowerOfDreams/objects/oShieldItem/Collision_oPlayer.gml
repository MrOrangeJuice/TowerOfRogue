/// @description Give armor

if(!armorGiven) 
{
	hammerNum = 0;
	for(i = 0; i < array_length(global.passiveItems); i++)
	{
		if(global.passiveItems[i] == 15)
		{
			hammerNum++;
		}
	}

	global.armor += 1 + hammerNum;
	audio_play_sound(snd_Armor,5,false);
}
armorGiven = true;
with (oGame) armorTextScale = 1.15;