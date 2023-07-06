/// @description Update

if(!global.paused && !global.hitStop)
{
	xSpeed -= 0.07;
	if(xSpeed < 0)
	{
		dmgMultiplier = 1;
		if(!particlesStarted)
		{
			audio_play_sound(snd_BoomerangReturn,5,true);
			alarm[0] = room_speed * 0.1;
			particlesStarted = true;
		}
	}
	x += (xSpeed * dir);
	if(dir == 1)
	{
		image_speed = 1;
	}
	else
	{
		image_speed = -1;	
	}
}
else
{
	image_speed = 0;	
	alarm[0]++;
}