/// @description Explode

instance_create_layer(x+4,y+4,"UI",oBombExplosionVFX);
audio_play_sound(snd_Bomb,5,false);
ScreenShake(2,10);

if(!other.invincible)
{
	for(i = 0; i < 10; i++)
	{
		instance_create_layer(other.x,other.y-4,"Pipes",oSlashParticleCharged);
	}
	other.flash = 5;
	if(global.essence == 4)
	{
		other.hp -= 1.5;
	}
	else
	{
		other.hp -= 1;
	}
	audio_play_sound(snd_Hit,5,false);
}
else
{
	audio_play_sound(snd_Klang,5,false);	
}

instance_destroy();