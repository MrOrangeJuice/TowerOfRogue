/// @description Hit enemy

if(!other.invincible)
{
	// Spawn particles
	if(initialDir == -1)
	{
		for(i = 0; i < 10; i++)
		{
			instance_create_layer(other.x,other.y,"Pipes",oItemLeftParticle);
		}
	}
	if(initialDir == 1)
	{
		for(i = 0; i < 10; i++)
		{
			instance_create_layer(other.x,other.y,"Pipes",oItemRightParticle);
		}
	}
	other.flash = 5;
	other.hp -= 1;
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

// Spawn bits
instance_create_layer(x,y,"Pipes",oGemBitLeft);
instance_create_layer(x,y,"Pipes",oGemBitLeft);
instance_create_layer(x,y,"Pipes",oGemBitLeft);
instance_create_layer(x,y,"Pipes",oGemBitLeft);

SpawnPepperExplosion(x,y);
instance_destroy();