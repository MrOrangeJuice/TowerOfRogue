// Get Player Input

key_left = keyboard_check(ord("A")) || keyboard_check(vk_left);
key_right = keyboard_check(ord("D")) || keyboard_check(vk_right);
key_jump = keyboard_check(vk_space) || keyboard_check(ord("Z")) || keyboard_check(ord("P"));
key_jump_released = keyboard_check_released(vk_space) || keyboard_check_released(ord("Z")) || keyboard_check_released(ord("P"));

if (key_left) || (key_right) || (key_jump)
{
	global.controller = 0;
}

// Gamepad input
if (gamepad_axis_value(0,gp_axislh) < -0.2 || gamepad_button_check(0,gp_padl) || gamepad_axis_value(4,gp_axislh) < -0.2 || gamepad_button_check(4,gp_padl))
{
	key_left = 1;
	global.controller = 1;
}

if (gamepad_axis_value(0,gp_axislh) > 0.2 || gamepad_button_check(0,gp_padr) || gamepad_axis_value(4,gp_axislh) > 0.2 || gamepad_button_check(4,gp_padr))
{
	key_right = 1;
	global.controller = 1;
}

if (gamepad_button_check(0,gp_face1) || gamepad_button_check(4,gp_face1))
{
	key_jump = 1;
	global.controller = 1;
}

if (gamepad_button_check_released(0,gp_face1) || gamepad_button_check_released(4,gp_face1))
{
	key_jump_released = 1;
	global.controller = 1;
}


if(!global.paused)
{
	// Play animations
	image_speed = 1;
	
	// If player doesn't release jump, they can't jump again or slash
	if(key_jump_released)
	{
		canJump = true;
	}

	// Build up speed depending on inputs
	if(key_left && !key_right)
	{
		if(currentwalksp == -walksp)
		{
			// Don't do anything
		}
		else if(currentwalksp < -walksp) 
		{
			currentwalksp += acceleration;
		}
		else
		{
			currentwalksp -= acceleration;
		}
	}
	if(key_right && !key_left)
	{
		if(currentwalksp == walksp)
		{
			// Don't do anything
		}
		else if(currentwalksp > walksp) 
		{
			currentwalksp -= acceleration;
		}
		else
		{
			currentwalksp += acceleration;
		}
	}
	// Slow down if not moving
	if (!(key_left || key_right) || (key_left && key_right))
	{
		if(currentwalksp < 0)
		{
			currentwalksp += acceleration;
		}
		if(currentwalksp > 0)
		{
			currentwalksp -= acceleration;
		}
	}

	hsp = currentwalksp;

	if(!wallSliding)
	{
		vsp = vsp + grv;
	}
	else
	{
		vsp += 0.03;	
	}

	// Decrement jump buffer
	jumpBuffer--;
	
	// Check if player is airborne
	if(!place_meeting(x, y + 1, oWall))
	{
		airborne = true;	
	}
	else
	{
		airborne = false;	
		jumpBuffer = 5;
		hasSlashed = false;
	}

	// Check if player is wallsliding
	if(airborne && place_meeting(x + (3 * sign(image_xscale)),y,oWall) && canWallSlide)
	{
		wallSliding = true;
		// Inch into wall if needed
		while (!place_meeting(x+sign(image_xscale),y,oWall))
		{
			x = x + sign(image_xscale);
		}
	}
	else
	{
		wallSliding = false;	
		canSpawnWallDust = true;
	}

	if(wallSliding)
	{
		// Spawn wall dust
		if(canSpawnWallDust)
		{
			instance_create_layer(x + (sign(hsp) * 2) + random_range(-2,2),y + random_range(-2,2),"VFX",oDustWallSmall);
			// Set wall dust timer
			canSpawnWallDust = false;
			alarm[1] = room_speed * 0.1;
		}
		// Prevent player from absuing gravity to ride wall
		if(!prevWallSliding)
		{
			vsp /= 2;	
		}
	}

	// Wall Jump
	if (wallSliding && (key_jump) && (canJump))
	{
		// Turn off wall sliding for a tiny amount of time
		canWallSlide = false;
		alarm[0] = room_speed * 0.2;
		wallSliding = false;
		vsp = -2.75;
		// Set hsp to the opposite of your current direction
		currentwalksp = -sign(image_xscale) * 3.75;
		audio_play_sound(snd_Jump, 5, false);
		wallDust = instance_create_layer(x,y,"VFX",oDustWall);
		if (currentwalksp != 0) wallDust.image_xscale = -sign(currentwalksp);
		canJump = false;
		// Swap sprite direction immediately
		if (hsp != 0) image_xscale = sign(hsp);
	}

	// Slash
	if (key_jump) && (canJump) && (airborne) && (!slashing) && (canSlash) && (jumpBuffer <= 0)
	{
		image_index = 0;
		canJump = false;
		canSlash = false;
		slashing = true;
		audio_play_sound(snd_Slash,5,false);
	}

	// Slash collision
	if(slashing && !hasSlashJumped)
	{
		if(place_meeting(x,y+17,oWall))
		{
			vsp = -3;	
			instance_create_layer(x,y+14,"VFX",oDustSlash);
			airborne = true;
			hasSlashed = true;
			hasSlashJumped = true;
			audio_play_sound(snd_Impact,5,false);
		}
	
		bumper = instance_place(x,y+17,oBumper);
		if(bumper)
		{
			bumper.image_speed = 1;
			bumper.hit = true;
			vsp = -3;	
			ScreenShake(2,10);
			instance_create_layer(bumper.x+8,bumper.y,"VFX",oDustSlashBumper);
			airborne = true;
			hasSlashed = true;
			hasSlashJumped = true;
			audio_play_sound(snd_Bumper,5,false);
		}
		
		enemy = instance_place(x,y+17,oEnemy);
		if(enemy)
		{
			enemy.flash = 5;
			enemy.hp--;
			vsp = -3;
			ScreenShake(2,10);
			instance_create_layer(enemy.x,enemy.y-4,"VFX",oDustSlashBumper);
			airborne = true;
			hasSlashed = true;
			hasSlashJumped = true;
			audio_play_sound(snd_Hit,5,false);
		}
	}

	// Jump
	if (jumpBuffer > 0) && (key_jump) && (canJump)
	{
		vsp = -3;
		instance_create_layer(x,y,"VFX",oDust);
		audio_play_sound(snd_Jump, 5, false);
		canJump = false;
	}

	// Variable jump height
	if vsp < 0 && (!(key_jump) && !hasSlashed) //if you're moving upwards in the air but not holding down jump
	{
		vsp *= 0.85; //essentially, divide your vertical speed
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
	x = x + hsp;

	// Vertical Collision
	if (place_meeting(x,y+vsp,oWall))
	{
		while (!place_meeting(x,y+sign(vsp),oWall))
		{
			y = y + sign(vsp);
		}
		vsp = 0;
	}
	y = y + vsp;

	if(prevAirborne && !airborne)
	{
		landing = true;
		instance_create_layer(x,y,"VFX",oDustSmall);
		audio_play_sound(snd_Land, 5, false);
	}

	// Animation
	if(slashing)
	{
		sprite_index = sPlayerSlash;	
	}
	else if(wallSliding)
	{
		sprite_index = sPlayerWallSlide;	
	}
	else if(airborne && !landing)
	{
		if (vsp <= 0) 
		{
			sprite_index = sPlayerJump;
		}
		if (vsp > 0)
		{
			sprite_index = sPlayerFall;
		}
	}
	else if(!landing)
	{
		if (hsp != 0)
		{
			sprite_index = sPlayerRun;
		}
		else
		{
			sprite_index = sPlayerIdle;
		}
	}
	else if(landing)
	{
		sprite_index = sPlayerLand;	
	}

	if (hsp != 0 && !slashing) image_xscale = sign(hsp);

	prevAirborne = airborne;
	prevWallSliding = wallSliding;
}
else
{
	image_speed = 0;	
}