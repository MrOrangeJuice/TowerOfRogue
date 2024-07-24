/// @description Check for collision

if(place_meeting(x,y,oPlayer))
{
	if(!colliding)
	{
		colliding = true;
		// Regenerate phrase
		signMessage = phrases[random_range(0,array_length(phrases))];	
		while(signMessage == prevPhrase)
		{
			signMessage = phrases[random_range(0,array_length(phrases))];		
		}
		prevPhrase = signMessage;
		// Start talking animation
		sprite_index = sRichardTalk;
		image_index = 0;
		audio_play_sound(snd_Richard,5,false);
	}
}
else
{
	colliding = false;	
}

if(!global.paused)
{
	if(vsp > 0.2 || vsp < -0.2)
	{
		yAccel *= -1;	
	}
	vsp += yAccel;
	yOffset = yOffset + vsp;	
}
else
{
	
}