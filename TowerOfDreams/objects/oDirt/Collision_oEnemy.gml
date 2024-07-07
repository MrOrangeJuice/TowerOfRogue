/// @description Collide with enemy

if(!other.invincible)
{
	// Spawn VFX down if dirt is going down
	if(vsp > 0)
	{
		instance_create_layer(x+2,y+2,"Pipes",oDustSlashBumperDown);
		for(i = 0; i < 10; i++)
		{
			instance_create_layer(other.x,other.y,"Pipes",oItemDownParticle);
		}
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
	ScreenShake(2,10);
	audio_play_sound(snd_Hit,5,false);
	alarm[0] = room_speed * 0.2;
	pepperInItems = false;
	for(i = 0; i < array_length(global.passiveItems); i++)
	{
		if(global.passiveItems[i] == 16)
		{
			pepperInItems = true;
		}
	}
	if(!pepperInItems)
	{
		instance_create_layer(x+2,y+2,"Enemies",oDirtExplosionVFX);
	}
	else
	{
		SpawnPepperExplosion(x+2,y+2);
	}
	
	instance_destroy();
}
else
{
	audio_play_sound(snd_Klang,5,false);	
	if(global.essence == 4)
	{
		dmgMultiplier += 1.5;
	}
	else
	{
		dmgMultiplier += 1;
	}
	vsp = -2.5;
	// Turn off collision breifly
	canHit = false;
	alarm[0] = room_speed * 0.2;
	if(!SpawnPepperExplosion(x+2,y+2)) instance_create_layer(x+2,x+2,"Enemies",oDirtExplosionVFX);
	instance_destroy();
}