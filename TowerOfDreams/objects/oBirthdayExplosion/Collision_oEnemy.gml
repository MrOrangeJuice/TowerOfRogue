/// @description Explode

if(!array_contains(enemies,other))
{
	if(!other.invincible)
	{
		// Add hit enemy to list so they aren't hit again
		array_push(enemies,other);
		other.flash = 5;
		if(global.essence == 4)
		{
			other.hp -= 4;
		}
		else
		{
			other.hp -= 2;
		}
		ScreenShake(2,10);
		audio_play_sound(snd_Hit,5,false);
	}
	else
	{
		audio_play_sound(snd_Klang,5,false);	
	}
}