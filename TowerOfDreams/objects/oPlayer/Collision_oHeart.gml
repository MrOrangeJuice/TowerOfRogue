/// @description Pickup heart

if(other.canGrab)
{
	instance_create_layer(other.x,other.y,"CoinVFX",oHeartVFX);
	if(global.health < global.maxHealth)
	{
		if(global.health == global.maxHealth -1)
		{
			global.health++;
		}
		else
		{
			global.health += 2;	
		}
	}
	audio_play_sound(snd_Heal,5,false);
	with (oGame) healthTextScale = 1.15;
	instance_destroy(other);
}