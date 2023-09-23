/// @description Hit enemy

if(!other.invincible)
{
	other.flash = 5;
	other.hp -= 0.34;
	ScreenShake(1,5);
	audio_play_sound(snd_Hit,5,false);
}
else
{
	audio_play_sound(snd_Klang,5,false);	
}
instance_destroy();