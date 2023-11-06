/// @description Hit enemy

if(!other.invincible)
{
	other.flash = 5;
	other.hp -= 0.5;
	ScreenShake(1,5);
	audio_play_sound(snd_Hit,5,false);
}
else
{
	audio_play_sound(snd_Klang,5,false);	
}
// Spawn VFX
if(initialDir == -1)
{
	instance_create_layer(x,y,"Pipes",oDustSlashBumperRight);
}
if(initialDir == 1)
{
	instance_create_layer(x,y,"Pipes",oDustSlashBumperLeft);
}

instance_destroy();