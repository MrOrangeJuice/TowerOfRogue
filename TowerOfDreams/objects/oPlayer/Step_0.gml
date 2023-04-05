// Get Player Input

key_left = keyboard_check(ord("A")) || keyboard_check(vk_left);
key_right = keyboard_check(ord("D")) || keyboard_check(vk_right);
key_jump = keyboard_check(vk_space) || keyboard_check(ord("Z")) || keyboard_check(ord("P"));
key_jump_released = keyboard_check_released(vk_space) || keyboard_check_released(ord("Z")) || keyboard_check_released(ord("P"));
key_item_pressed = keyboard_check_pressed(ord("X")) || keyboard_check_pressed(ord("O")) || keyboard_check_pressed(vk_lshift);
key_item = keyboard_check(ord("X")) || keyboard_check(ord("O")) || keyboard_check(vk_lshift);

if (key_left) || (key_right) || (key_jump) || (key_item) || (key_item_pressed)
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

if (gamepad_button_check_pressed(0,gp_face2) || gamepad_button_check_pressed(0,gp_face3) || gamepad_button_check_pressed(4,gp_face2) || gamepad_button_check_pressed(4,gp_face3))
{
	key_item_pressed = 1;
	global.controller = 1;
}

if (gamepad_button_check_pressed(0,gp_face2) || gamepad_button_check_pressed(0,gp_face3) || gamepad_button_check_pressed(4,gp_face2) || gamepad_button_check_pressed(4,gp_face3))
{
	key_item_pressed = 1;
	global.controller = 1;
}

if (gamepad_button_check(0,gp_face2) || gamepad_button_check(0,gp_face3) || gamepad_button_check(4,gp_face2) || gamepad_button_check(4,gp_face3))
{
	key_item = 1;
	global.controller = 1;
}


if(!global.paused && !global.hitStop)
{
	// Play animations
	image_speed = 1;
	
	// Check for items
	rageInItems = false;
	for(i = 0; i < array_length(global.passiveItems); i++)
	{
		if(global.passiveItems[i] == 3)
		{
			rageInItems = true;
		}
	}
	// Activate rage
	if(rageInItems)
	{
		if(global.health <= 2)
		{
			// Spawn vfx is player wasn't raging last frame
			if(!rage) 
			{
				audio_play_sound(snd_Rage,5,false);
				instance_create_layer(x,y-4,"Instances",oAngerVFX);
				instance_create_layer(x,y-8,"Instances",oRageVFX);
			}
			rage = true;	
		}
		else
		{
			if(rage) instance_destroy(oAngerVFX);
			rage = false;	
		}
	}
	else
	{
		rage = false;	
	}
	
	// Make sure wall slide doesn't have any blink frames
	if(wallSliding)
	{
		if(key_right)
		{
			image_xscale = 1;	
		}
		if(key_left)
		{
			image_xscale = -1;	
		}
	}
	
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
		if(room == rTutorial && !global.tutorialMusic)
		{
			audio_play_sound(msc_Tutorial,5,true);
			global.tutorialMusic = true;
		}

		if(global.inARun && !global.floor1Music && room != rHub)
		{
			audio_play_sound(msc_Floor1,5,true);
			global.floor1Music = true;
		}
	}

	// Check if player is wallsliding
	if(airborne && (place_meeting(x + (3 * sign(image_xscale)),y,oWall) || place_meeting(x + (3 * sign(currentwalksp)),y,oWall)) && canWallSlide)
	{
		// Fix direction
		if(place_meeting(x + 3,y,oWall)) image_xscale = 1;
		if(place_meeting(x - 3,y,oWall)) image_xscale = -1;
		
		wallSliding = true;
		// Inch into wall if needed
		while (!place_meeting(x+sign(image_xscale),y,oWall))
		{
			x = x + sign(image_xscale);
		}
	}
	else
	{
		if(wallSliding)
		{
			if(place_meeting(x+3,y,oWall) && key_left)
			{
				wallJumpCoyote = true;
			}
			if(place_meeting(x-3,y,oWall) && key_right)
			{
				wallJumpCoyote = true;
			}
			alarm[3] = room_speed * 0.1;
		}
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
	if ((wallSliding && key_jump && canJump) || (key_jump && wallJumpCoyote && canJump))
	{
		// Turn off wall sliding for a tiny amount of time
		canWallSlide = false;
		alarm[0] = room_speed * 0.2;
		wallSliding = false;
		vsp = -2.75;
		audio_play_sound(snd_Jump, 5, false);
		if(wallJumpCoyote)
		{
			currentwalksp = sign(image_xscale) * 3.75;
			wallDust = instance_create_layer(x,y,"VFX",oDustWall);
			if (currentwalksp != 0) wallDust.image_xscale = -sign(currentwalksp);
		}
		// Set hsp to the opposite of your current direction
		else
		{
			currentwalksp = -sign(image_xscale) * 3.75;
			wallDust = instance_create_layer(x,y,"VFX",oDustWall);
			if (currentwalksp != 0) wallDust.image_xscale = -sign(currentwalksp);
		}
		canJump = false;
		// Swap sprite direction immediately
		if (currentwalksp != 0) image_xscale = sign(currentwalksp);
	}

	// Slash
	if (key_jump) && (canJump) && (airborne) && (!slashing) && (canSlash) && (jumpBuffer <= 0) && (global.sword) && (!wallJumpCoyote)
	{
		image_index = 0;
		canJump = false;
		canSlash = false;
		slashing = true;
		hit = false;
		audio_play_sound(snd_Slash,5,false);
	}

	// Slash collision
	if(slashing && !hasSlashJumped)
	{
		if(place_meeting(x,y+9,oWall))
		{
			// Push player up
			while(place_meeting(x,y+8,oWall))
			{
				y -= 1;	
			}
			vsp = -3;	
			instance_create_layer(x,y+6,"VFX",oDustSlash);
			// Check for slash items
			shock = false;
			for(i = 0; i < array_length(global.passiveItems); i++)
			{
				if(global.passiveItems[i] == 0)
				{
					shock = true;
				}
			}
			if(shock)
			{
				// Spawn shock waves
				instance_create_layer(x,y+8,"Instances",oShockwave);
				rightShock = instance_create_layer(x,y+8,"Instances",oShockwave);
				rightShock.dir = 1;
			}
			airborne = true;
			hasSlashed = true;
			hasSlashJumped = true;
			audio_play_sound(snd_Impact,5,false);
		}
	
		bumper = instance_place(x,y+9,oBumper);
		if(bumper)
		{
			// Push player up
			while(place_meeting(x,y+8,oBumper))
			{
				y -= 1;	
			}
			bumper.image_speed = 1;
			bumper.hit = true;
			vsp = -3;	
			instance_create_layer(bumper.x+8,bumper.y,"VFX",oDustSlashBumper);
			airborne = true;
			hasSlashed = true;
			hasSlashJumped = true;
			audio_play_sound(snd_Bumper,5,false);
		}
		
		enemy = instance_place(x,y+9,oEnemy);
		if(enemy)
		{
			// Check for slash items
			crit = false;
			for(i = 0; i < array_length(global.passiveItems); i++)
			{
				if(global.passiveItems[i] == 1)
				{
					crit = true;
				}
			}
			// Push player up
			while(place_meeting(x,y+8,oEnemy))
			{
				y -= 1;	
			}
			// Only hit the enemy if it's not invincible, otherwise clank off
			if(!enemy.invincible)
			{
				enemy.flash = 5;
				if(rage)
				{
					rageDamage = 1;
				}
				else
				{
					rageDamage = 0;	
				}
				if(crit)
				{
					randomize();
					critChance = irandom_range(0,3);
					if(critChance == 1)
					{
						enemy.hp -= 2 * (1 + rageDamage);
						instance_create_layer(enemy.x,enemy.y-10,"Instances",oCritVFX);
						ScreenShake(4,12);
						audio_play_sound(snd_Crit,5,false);
					}
					else
					{
						enemy.hp -= (1 + rageDamage);
						ScreenShake(2,10);
					}
					audio_play_sound(snd_Hit,5,false);
				}	
				else
				{
					enemy.hp -= (1 + rageDamage);
					ScreenShake(2,10);
					audio_play_sound(snd_Hit,5,false);
				}
			}
			else
			{
				audio_play_sound(snd_Klang,5,false);
			}
			vsp = -3;
			instance_create_layer(enemy.x,enemy.y-4,"VFX",oDustSlashBumper);
			airborne = true;
			hasSlashed = true;
			hasSlashJumped = true;
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
	
	if(!invulnerable)
	{
		enemyHitRight = instance_place(x+(1*image_xscale),y,oEnemy);
		enemyHitLeft = instance_place(x-(1*image_xscale),y,oEnemy);
		
		if(enemyHitRight && !enemyHitRight.noDamage)
		{
			TakeDamage(1,2.75,3.5);
		}
		else if(enemyHitLeft && !enemyHitLeft.noDamage)
		{
			TakeDamage(1,2.75,-3.5);	
		}
		
		spikeHitRight = instance_place(x+(1*image_xscale),y,oSpikes);
		spikeHitLeft = instance_place(x-(1*image_xscale),y,oSpikes);
		spikeHitDown = instance_place(x,y+1,oSpikes);
		spikeHitUp = instance_place(x,y-1,oSpikes);
		
		if(spikeHitRight)
		{
			TakeDamage(1,2.75,3.5);
		}
		else if(spikeHitLeft)
		{	
			TakeDamage(1,2.75,-3.5);
		}
		else if(spikeHitDown)
		{
			TakeDamage(1,3,0);	
		}
		else if(spikeHitUp)
		{
			TakeDamage(1,-1,0);	
		}
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
		hit = false;
	}
	
	// Items
	// Give player additional functionality depending on what item they're holding
	switch(global.item)
	{
		// Kunai
		case 0:
			if(key_item_pressed)
			{
				if(!wallSliding)
				{
					kunai = instance_create_layer(x+(4*image_xscale),y,"Walls",oKunai);
					kunai.initialDir = image_xscale;
				}
				else
				{
					kunai = instance_create_layer(x+(4*-image_xscale),y,"Walls",oKunai);
					kunai.initialDir = -image_xscale;
				}
			}
			break;	
		// Boots
		case 1:
			if(key_item && !airborne)
			{
				walksp = 1.5;
				if(!running)
				{
					running = true;
					initialRunDir = image_xscale;
				}
			}
			else if(!key_item && airborne)
			{
				// Reset your speed if you turn around in midair without holding run
				if(image_xscale != initialRunDir)
				{
					walksp = 1;
				}
			}
			else if(!airborne)
			{
				walksp = 1;	
				if(running)
				{
					running = false;
				}
			}
	}

	// Animation
	if(hit)
	{
		sprite_index = sPlayerHit;	
	}
	else if(slashing)
	{
		sprite_index = sPlayerSlashSmall;	
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
			if (running)
			{
				image_speed = 1.5;	
			}
			else
			{
				image_speed = 1;	
			}
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

	if (hsp != 0 && !slashing && !hit) image_xscale = sign(hsp);

	prevAirborne = airborne;
	prevWallSliding = wallSliding;
}
else
{
	image_speed = 0;	
}