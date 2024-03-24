/// @description Hit enemy

if(!other.invincible && other.object_index != oMissile)
{
	other.flash = 5;
	other.hp -= 1;
	ScreenShake(1,5);
	SpawnPepperExplosion(x,y);
	audio_play_sound(snd_Hit,5,false);
}
else
{
	audio_play_sound(snd_Klang,5,false);	
}
instance_destroy();