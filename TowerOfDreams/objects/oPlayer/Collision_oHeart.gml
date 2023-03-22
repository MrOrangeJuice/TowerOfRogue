/// @description Pickup heart

instance_create_layer(other.x,other.y,"CoinVFX",oHeartVFX);
if(global.health < global.maxHealth)
{
	global.health += 2;	
}
audio_play_sound(snd_Heal,5,false);
with (oGame) healthTextScale = 1.15;
instance_destroy(other);