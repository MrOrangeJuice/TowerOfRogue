/// @description Collide with enemy

if(!other.invincible)
{
	// Spawn VFX
	if(xSpeed * dir < 0)
	{
		for(i = 0; i < 10; i++)
		{
			instance_create_layer(other.x,other.y,"Pipes",oItemLeftParticle);
		}
	}
	if(xSpeed * dir > 0)
	{
		for(i = 0; i < 10; i++)
		{
			instance_create_layer(other.x,other.y,"Pipes",oItemRightParticle);
		}
	}
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

// Spawn VFX
if(xSpeed * dir < 0)
{
	instance_create_layer(x,y,"Pipes",oDustSlashBumperRight);
}
if(xSpeed * dir > 0)
{
	instance_create_layer(x,y,"Pipes",oDustSlashBumperLeft);
}

instance_destroy();