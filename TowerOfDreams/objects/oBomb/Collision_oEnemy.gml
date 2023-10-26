/// @description Explode

instance_create_layer(x+4,y+4,"VFX",oBombExplosionVFX);
audio_play_sound(snd_Bomb,5,false);
ScreenShake(2,10);

if(!other.invincible)
{
	other.flash = 5;
	other.hp -= 1;
	audio_play_sound(snd_Hit,5,false);
}
else
{
	audio_play_sound(snd_Klang,5,false);	
}

instance_destroy();