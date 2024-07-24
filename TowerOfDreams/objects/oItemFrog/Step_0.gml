/// @description Check for item falling

if(!global.paused)
{
	image_speed = 1;
	// Look for item
	if(place_meeting(x,y-128,oItem) && !tongue)
	{
		tongue = true;
		sprite_index = sItemFrogTongue;
		alarm[0] = room_speed * 0.3;
		alarm[1] = room_speed * 1.2;
		alarm[2] = room_speed * 2.35;
		alarm[3] = room_speed * 2.15;
	}
	
	if(place_meeting(x,y,oPlayer) && playerHasNoItem)
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
			sprite_index = sItemFrogTalk;
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
	alarm[0]++;
	alarm[1]++;
	alarm[2]++;
	alarm[3]++;
	image_speed = 0;	
}