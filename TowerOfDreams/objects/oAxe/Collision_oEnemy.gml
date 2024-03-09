/// @description Collide with enemy

if(!other.invincible)
{
	if(canHit)
	{
		// Spawn VFX down if axe is going down
		if(vsp > 0)
		{
			instance_create_layer(x,y,"Pipes",oDustSlashBumperDown);
			for(i = 0; i < 10; i++)
			{
				instance_create_layer(other.x,other.y,"Pipes",oItemDownParticle);
			}
		}
		other.flash = 5;
		other.hp -= (1 + dmgMultiplier);
		ScreenShake(2,10);
		audio_play_sound(snd_Hit,5,false);
		dmgMultiplier += 1;
		vsp = -2.5;
		// Turn off collision breifly
		canHit = false;
		alarm[0] = room_speed * 0.2;
		SpawnPepperExplosion(x,y);
	}
}
else
{
	if(canHit)
	{
		audio_play_sound(snd_Klang,5,false);	
		dmgMultiplier += 1;
		vsp = -2.5;
		// Turn off collision breifly
		canHit = false;
		alarm[0] = room_speed * 0.2;
		SpawnPepperExplosion(x,y);
	}
}