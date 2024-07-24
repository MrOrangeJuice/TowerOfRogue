/// @description Update
if(!global.paused)
{
	image_speed = 1;
	if(bought)
	{
		audio_play_sound(snd_Purchase,5,false);
		sprite_index = sStamperBuy;
		bought = false;
	}
	
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
			audio_play_sound(snd_Richard,5,false);
			// Start talking animation
			sprite_index = sStamperTalk;
			image_index = 0;
			audio_play_sound(snd_Richard,5,false);
		}
	}
	else
	{
		colliding = false;	
	}
	
	if(vsp > 0.2 || vsp < -0.2)
	{
		yAccel *= -1;	
	}
	vsp += yAccel;
	yOffset = yOffset + vsp;
}
else
{
	image_speed = 0;
}