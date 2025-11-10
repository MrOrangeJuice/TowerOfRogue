/// @description Move and collide

event_inherited();

if(!global.paused && !global.hitStop)
{
	image_speed = 1;
	image_xscale = -dir;
	vsp += grv;

	// Horizontal Collision
	if (place_meeting(x+(hsp*dir),y,oWall))
	{
		dir *= -1;
		if(IsOnScreen(y)) audio_play_sound(snd_Land,5,false);
		// Destroy on the side of temp platforms to prevent funky collision
		if (place_meeting(x+(hsp*dir),y,oTempPlatform))
		{
			if (elite)
			{
				instance_create_layer(x,y,"Enemies",oEnemyEliteDeath);
			}
			else
			{
				instance_create_layer(x,y,"Enemies",oEnemyDeath);
			}

			instance_destroy();
		}
	}
	
		
	// Spike collision
	if (place_meeting(x+hsp,y+vsp,oSpikes))
	{
		if (elite)
		{
			instance_create_layer(x,y,"Enemies",oEnemyEliteDeath);
		}
		else
		{
			instance_create_layer(x,y,"Enemies",oEnemyDeath);
		}

		instance_destroy();
	}
	
	// Lava collision
	if (place_meeting(x,y+vsp,oLava))
	{
		if (elite)
		{
			instance_create_layer(x,y,"Enemies",oEnemyEliteDeath);
		}
		else
		{
			instance_create_layer(x,y,"Enemies",oEnemyDeath);
		}

		instance_destroy();
	}

	// Vertical Collision
	if (place_meeting(x,y+vsp,oWall))
	{
		while (!place_meeting(x,y+sign(vsp),oWall))
		{
			y = y + sign(vsp);
		}
		vsp = 0;
	}
	
	// Check for leaving the ground
	if (!place_meeting(x,y+1,oWall))
	{
		if(!airborne) airborne = true;	
	}
	
	// Check for landing
	if(airborne && place_meeting(x,y+1,oWall))
	{
		landing = true;
		airborne = false;
		alarm[1] = room_speed * 0.1;
		instance_create_layer(x,y,"VFX",oGravityEnemyDustVFX);
		if(IsOnScreen(y)) audio_play_sound(snd_Land,5,false);
		vsp = jumpPwr;
	}
	
	// Animate
	if(landing)
	{
		sprite_index = landingSprite;
	}
	else
	{
		sprite_index = regularSprite;
	}

	x = x + (hsp * dir);
	y = y + vsp;
}
else
{
	image_speed = 0;	
}

// Spawn for hard mode
if(global.hardMode && object_index != oBallEnemyElite && givesHealth)
{
	instance_change(oBallEnemyElite,false);
	hp = 4;
	hsp = 1.5;
	elite = true;
	// Sprites
	regularSprite = sBallEnemyElite;
	landingSprite = sBallEnemyEliteSquish;
}