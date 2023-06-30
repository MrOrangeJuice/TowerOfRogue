/// @description Collide with enemy

if(!other.invincible)
{
	if(canHit)
	{
		other.flash = 5;
		other.hp -= (1 + dmgMultiplier);
		ScreenShake(2,10);
		audio_play_sound(snd_Hit,5,false);
		dmgMultiplier += 1;
		vsp = -2.5;
		// Turn off collision breifly
		canHit = false;
		alarm[0] = room_speed * 0.2;
	}
}
else
{
	if(canHit)
	{
		audio_play_sound(snd_Klang,5,false);	
		dmgMultiplier += 1;
		vsp = -2.5;
		// Turn off collision breifly
		canHit = false;
		alarm[0] = room_speed * 0.2;
	}
}