/// @description Draw interest prompt

// Check for ring
ring = false;
ringNum = 0;
for(i = 0; i < array_length(global.passiveItems); i++)
{
	if(global.passiveItems[i] == 22)
	{
		ring = true;
		ringNum++;
	}
}

if(ring)
{
	audio_play_sound(snd_Chaching,5,false);
	with (oGame) 
	{
		coinTextScale = 1.15;
		
	}
	global.coins = ceil((1 + (0.1 * ringNum)) * global.coins);
	interestPrompt = true;
}