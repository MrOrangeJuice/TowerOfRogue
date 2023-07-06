/// @description Collide with enemy

if(!other.invincible)
{
	other.flash = 5;
	other.hp -= (1 + dmgMultiplier);
	ScreenShake(2,10);
	audio_play_sound(snd_Hit,5,false);
	// Turn off collision breifly
	canHit = false;
	alarm[0] = room_speed * 0.2;
}
else
{
	audio_play_sound(snd_Klang,5,false);	
	instance_create_layer(x,y,"Enemies",oPlayerExplosion);
}
instance_destroy();