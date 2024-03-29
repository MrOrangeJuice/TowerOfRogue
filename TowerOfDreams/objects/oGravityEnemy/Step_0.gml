/// @description Move

event_inherited();

if(!global.paused && !global.hitStop)
{
	image_speed = 1;
	vsp += grv;
	// Vertical Collision
	if (place_meeting(x,y+vsp,oWall))
	{
		while (!place_meeting(x,y+sign(vsp),oWall))
		{
			y = y + sign(vsp);
		}
		vsp = 0;
		if(!hitWall)
		{
			if(IsOnScreen(y)) audio_play_sound(snd_Land,5,false);
			alarm[0] = room_speed * 1;	
			hitWall = true;
			landing = true;
			// Landing alarm
			alarm[1] = room_speed * 0.1875;
			if(sign(grv) > 0)
			{
				instance_create_layer(x,y,"VFX",oGravityEnemyDustVFX);
			}
			else
			{
				instance_create_layer(x,y,"VFX",oGravityEnemyDustUpVFX);
			}
		}
	}
	y = y + vsp;
	
	// Animation
	if(landing)
	{
		if(sign(grv) > 0)
		{
			sprite_index = sGravityEnemyLand;	
			image_index = 0;
		}
		else
		{
			sprite_index = sGravityEnemyLandUp;	
			image_index = 0;
		}
	}
	else
	{
		if(hitWall)
		{
			sprite_index = sGravityEnemy;
		}
		else
		{
			if(sign(grv) > 0)
			{
				sprite_index = sGravityEnemyFall;	
			}
			else
			{
				sprite_index = sGravityEnemyFallUp;	
			}
		}
	}
}
else
{
	image_speed = 0;
	// Extend alarm
	alarm[0]++;
	alarm[1]++;
}