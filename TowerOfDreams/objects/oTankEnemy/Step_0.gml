/// @description Update
/// @description Update

event_inherited();

if(!global.paused && !global.hitStop)
{
	image_speed = 1;
	image_xscale = -dir;
	vsp += grv;
	// Vertical Collision
	if (place_meeting(x,y+vsp,oWall))
	{
		while (!place_meeting(x,y+sign(vsp),oWall))
		{
			y = y + sign(vsp);
		}
		vsp = 0;
	}
	
	// State machine
	if(state == "patrol")
	{

		// Horizontal Collision
		if (place_meeting(x+(hsp*dir),y,oWall))
		{
			dir *= -1;
		}
		
		
		// Vertical Ledge Collision
		// If no ground below you reverse direction
		if (!place_meeting(x+(24*dir),y+1,oWall))
		{
			dir *= -1;
			vsp = 0;
		}
	
		// Randomly stop moving
		if(moving)
		{
			randomize();
			randInt = irandom_range(0,60);
			if(randInt == 2 && canStopMoving)
			{
				moving = false;
				alarm[2] = room_speed * 0.5;
				alarm[1] = room_speed * 0.5;
				canStopMoving = false;
				canStartMovingAgain = false;
			}
		}
		// Randomize next action while not moving
		else
		{
			randomize();
			randInt = irandom_range(0,60);
			// Turn around
			if(randInt == 2 && canTurn)
			{
				dir = dir * -1;	
				alarm[0] = room_speed * 0.5;
				canTurn = false;
			}
			// Start moving again
			if(randInt == 3 && canStartMovingAgain)
			{
				moving = true;	
				alarm[1] = room_speed * 0.5;
				alarm[2] = room_speed * 0.5;
				canStartMovingAgain = false;
				canStopMoving = false;
			}
		}
		
		// Check for state change
		if(instance_exists(oPlayer))
		{
			if(oPlayer.y - 16 < y && y < oPlayer.y + 64)
			{
				if(dir == -1 && oPlayer.x < x)
				{
					state = "spotted";
					alarm[3] = room_speed * 3;
					instance_create_layer(x,y-18,"VFX",oSpottedVFX);
				}
				if(dir == 1 && oPlayer.x > x)
				{
					state = "spotted";
					alarm[3] = room_speed * 3;
					instance_create_layer(x,y-18,"VFX",oSpottedVFX);
				}
			}
		}

		if(moving) x = x + (hsp * dir);
	
		// Animation
		if(moving)
		{
			sprite_index = sTankEnemy;	
		}
		else
		{
			sprite_index = sTankEnemyIdle;	
		}
	}
	else if(state == "spotted")
	{
		// Check for state change
		if(instance_exists(oPlayer))
		{
			if(!(oPlayer.y - 16 < y && y < oPlayer.y + 64))
			{
				state = "patrol";
			}
		}
		
		if(instance_exists(oPlayer))
		{
			// Track player
			if(dir == -1)
			{
				// Close the gap
				if(oPlayer.x < x - 40)
				{
					hsp = -0.5;
					forward = true;
				}
				// Retreat
				else if(oPlayer.x > x - 32 && oPlayer.x < x)
				{
					hsp = 0.5;	
					forward = false;
				}
				// Switch direction
				else if(oPlayer.x > x)
				{
					dir = 1;	
				}
				else
				{
					hsp = 0;	
					forward = true;
				}
			}
			else if(dir == 1)
			{
				// Close the gap
				if(oPlayer.x > x + 40)
				{
					hsp = 0.5;
					forward = true;
				}
				// Retreat
				else if(oPlayer.x < x + 32)
				{
					hsp = -0.5;	
					forward = false;
				}
				// Switch direction
				else if(oPlayer.x < x)
				{
					dir = -1;	
				}
				else
				{
					hsp = 0;	
					forward = true;
				}
			}
		}
		
		if(firing)
		{
			hsp = 0;	
		}
		
		// Horizontal Collision
		if (place_meeting(x+hsp,y,oWall))
		{
			while (!place_meeting(x+sign(hsp),y,oWall))
			{
				x = x + sign(hsp);
			}
			hsp = 0;
		}
		
		// Vertical Ledge Collision
		// If no ground below stop
		if (!place_meeting(x+(24*hsp),y+1,oWall))
		{
			hsp = 0;
		}
		
		x = x + hsp;
		y = y + vsp;
		
		image_xscale = - dir;
		
		// Animation
		if(firing)
		{
			sprite_index = sTankEnemyFire;
		}
		else
		{
			if(hsp != 0)
			{
				if(forward)
				{
					sprite_index = sTankEnemy;	
				}
				else
				{
					sprite_index = sTankEnemyBack;	
				}
			}
			else
			{
				sprite_index = sTankEnemyIdle;	
			}
		}
		
	}
}
else
{
	image_speed = 0;
	alarm[0]++;
	alarm[1]++;
	alarm[2]++;
	alarm[3]++;
}