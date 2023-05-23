/// @description Pickup heart

if(other.canGrab)
{
	instance_create_layer(other.x,other.y,"CoinVFX",oHeartVFX);
	// Overheal gems
	if(global.health == global.maxHealth - 1)
	{
		// Grant 10 gems for a half-overheal
		global.coins += 10;
		instance_create_layer(other.x+4,other.y-8,"Instances",o10);
		audio_play_sound(snd_Overheal,5,false);
	}
	else if(global.health == global.maxHealth)
	{
		// Grant 20 gems for a full-overheal
		global.coins += 20;
		instance_create_layer(other.x+4,other.y-8,"Instances",o20);
		audio_play_sound(snd_Overheal,5,false);
	}
	if(global.health < global.maxHealth)
	{
		if(global.health == global.maxHealth - 1)
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