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
	rageNum = 0;
	chargeInItems = false;
	chargeNum = 0;
	for(i = 0; i < array_length(global.passiveItems); i++)
	{
		if(global.passiveItems[i] == 3)
		{
			rageInItems = true;
			rageNum++;
		}
		if(global.passiveItems[i] == 10)
		{
			chargeInItems = true;
			chargeNum++;
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
		if(upConveyer)
		{
			vsp -= 0.08;
		}
		else
		{
			vsp += 0.03;	
		}
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
		if(room == rHub && !global.hubMusic)
		{
			audio_play_sound(msc_Hub,5,true);
			global.hubMusic = true;
		}

		if(!global.shopMusic && (room == rTreasureRoom || room == rTreasureRoom2 || room == rShop || room == rShop2 || room == rTreasureRoomFloor2 || room == rTreasureRoom2Floor2 || room == rShopFloor2 || room == rShop2Floor2))
		{
			audio_play_sound(msc_Shop,5,true);
			global.shopMusic = true;
		}
		if(global.inARun && !global.floor1Music && room != rHub && room != rTreasureRoom && room != rTreasureRoom2 && room != rShop && room != rShop2  && room != rTreasureRoomFloor2 && room != rTreasureRoom2Floor2 && room != rShopFloor2 && room != rShop2Floor2)
		{
			if(global.levelCount < 3)
			{
				audio_play_sound(msc_Floor1,5,true);
			}
			else
			{
				audio_play_sound(msc_Floor2,5,true);	
			}
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
		// Check if wall is upward conveyer
		if(place_meeting(x+image_xscale,y,oUpConveyer))
		{
			upConveyer = true;	
			upConveyerBoost = true;
		}
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
				if(upConveyer) upConveyerCoyote = true;
			}
			if(place_meeting(x-3,y,oWall) && key_right)
			{
				wallJumpCoyote = true;
				if(upConveyer) upConveyerCoyote = true;
			}
			alarm[3] = room_speed * 0.1;
		}
		wallSliding = false;
		upConveyer = false;
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
		if(upConveyer || upConveyerCoyote)
		{
			newVsp = 3 + vsp;
			if(newVsp < 0.25) newVsp = 0.25;
			vsp -= newVsp;
			// Play extra VFX if going fast enough
			if(vsp < -3)
			{
				if(image_xscale == 1)
				{
					vfx = instance_create_layer(x,y,"VFX",oFastJumpVFX);
					vfx.image_xscale = -1;
				}
				else if(image_xscale == -1)
				{
					instance_create_layer(x,y,"VFX",oFastJumpVFX);
				}
			}
		}
		else
		{
			vsp = -2.75;
		}
		upConveyer = false;
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
		// Bumper switch
		// Switch bumpers A and B
		if(instance_exists(oBumperA) || instance_exists(oBumperB))
		{
			alarm[4] = room_speed * 0.34;
			oBumperA.image_speed = 1;
			oBumperB.image_speed = 1;
			global.bumpersSwitching = true;
		}
		// Initiate charge slash
		if(chargeInItems)
		{
			if(chargeBounces == 2)
			{
				chargeSlash = true;
			}
			else
			{
				chargeSlash = false;	
			}
		}
		audio_play_sound(snd_Slash,5,false);
	}

	// Slash collision
	if(slashing && !hasSlashJumped)
	{	
		if(place_meeting(x,y+9,oWall))
		{
			// Check for slash items
			shock = false;
			shockNum = 0;
			bagNum = 0;
			for(i = 0; i < array_length(global.passiveItems); i++)
			{
				if(global.passiveItems[i] == 0)
				{
					shock = true;
					shockNum++;
				}
				if(global.passiveItems[i] == 9)
				{
					bagNum += 0.5;
				}
			}
			
			// Push player up
			while(place_meeting(x,y+8,oWall))
			{
				y -= 1;	
			}
			vsp = -(3+bagNum);	
			if(chargeSlash)
			{
				instance_create_layer(x,y+6,"VFX",oDustSlashGreen);
			}
			else
			{
				instance_create_layer(x,y+6,"VFX",oDustSlash);
			}
			if(bagNum > 0) audio_play_sound(snd_Winds,5,false);
			if(shock)
			{
				// Spawn shock waves
				instance_create_layer(x,y+8,"Instances",oShockwave);
				rightShock = instance_create_layer(x,y+8,"Instances",oShockwave);
				rightShock.dir = 1;
				shockNum--;
				shockX = x;
				shockY = y+8;
				if(shockNum > 0)
				{
					alarm[6] = room_speed * 0.1;	
				}
			}
			airborne = true;
			hasSlashed = true;
			hasSlashJumped = true;
			extraJump = true;
			if(chargeInItems) 
			{
				chargeBounces++;
				// Start spawning player particles if next hit is a charge hit
				if(chargeBounces == 2) 
				{
					particles = instance_create_layer(x,y,"Walls",oPlayerChargeParticle);
					audio_play_sound(snd_Charge,5,false);
					alarm[7] = room_speed * 0.1;
				}
			}
			audio_play_sound(snd_Impact,5,false);
		}
	
		bumper = instance_place(x,y+9,oBumper);
		if(bumper && bumper.canHit)
		{
			// Push player up
			while(place_meeting(x,y+8,oBumper))
			{
				y -= 1;	
			}
			bumper.image_speed = 1;
			bumper.hit = true;
			vsp = -3;	
			if(chargeSlash)
			{
				instance_create_layer(bumper.x+8,bumper.y,"VFX",oDustSlashBumperGreen);
			}
			else
			{
				instance_create_layer(bumper.x+8,bumper.y,"VFX",oDustSlashBumper);
			}
			airborne = true;
			hasSlashed = true;
			hasSlashJumped = true;
			extraJump = true;
			if(chargeInItems) 
			{
				chargeBounces++;
				// Start spawning player particles if next hit is a charge hit
				if(chargeBounces == 2) 
				{
					particles = instance_create_layer(x,y,"Walls",oPlayerChargeParticle);
					audio_play_sound(snd_Charge,5,false);
					alarm[7] = room_speed * 0.1;
				}
			}
			audio_play_sound(snd_Bumper,5,false);
		}
		
		bubble = instance_place(x,y+9,oItemBubble);
		if(bubble)
		{
			// Push player up
			while(place_meeting(x,y+8,oItemBubble))
			{
				y -= 1;	
			}
			vsp = -3;
			card = 0;
			for(i = 0; i < array_length(global.passiveItems); i++)
			{
				if(global.passiveItems[i] == 4)
				{
					card++;
				}
			}
			airborne = true;
			hasSlashed = true;
			hasSlashJumped = true;
			extraJump = true;
			if(chargeInItems) 
			{
				chargeBounces++;
				// Start spawning player particles if next hit is a charge hit
				if(chargeBounces == 2) 
				{
					particles = instance_create_layer(x,y,"Walls",oPlayerChargeParticle);
					audio_play_sound(snd_Charge,5,false);
					alarm[7] = room_speed * 0.1;
				}
			}
			// Check if item can be bought
			if(global.coins >= global.itemPrices[bubble.item] * (1 - (0.2 * card)))
			{
				instance_create_layer(bubble.x+8,bubble.y,"UI",oDustSlashBumper);
				instance_create_layer(bubble.x,bubble.y,"VFX",oBubbleVFX);
				audio_play_sound(snd_Bumper,5,false);
				// Stamper alarm
				alarm[5] = room_speed * 0.2;
				// Spawn item
				newItem = instance_create_layer(bubble.x+4,bubble.y+4,"Collectables",global.itemObjects[bubble.item]);
				// Don't double the lift if it's a heart or armor
				if(bubble.item != array_length(global.itemObjects)-1 || bubble.item != array_length(global.itemObjects)-2)
				{
					 newItem.vsp = -3;	
				}
				else
				{
					newItem.vsp = 0;	
				}
				switch(bubble.bubbleNum)
				{
					case 1:
						global.item1Bought = true;
						break;
					case 2:
						global.item2Bought = true;
						break;
					case 3:
						global.item3Bought = true;
						break;
				}
				global.coins -= global.itemPrices[bubble.item] * (1 - (0.2 * card));
				instance_destroy(bubble);
			}
			else
			{
				if(chargeSlash)
				{
					instance_create_layer(bubble.x+8,bubble.y,"UI",oDustSlashBumperGreen);
				}
				else
				{
					instance_create_layer(bubble.x+8,bubble.y,"UI",oDustSlashBumper);
				}
				audio_play_sound(snd_Klang,5,false);
			}
		}
		enemy = instance_place(x,y+9,oEnemy);
		if(enemy)
		{
			// Check for slash items
			crit = 0;
			critPB = 0;
			for(i = 0; i < array_length(global.passiveItems); i++)
			{
				if(global.passiveItems[i] == 1)
				{
					crit++;
				}
				if(global.passiveItems[i] == 8)
				{
					critPB++;
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
					rageDamage = rageNum;
				}
				else
				{
					rageDamage = 0;	
				}
				if(!chargeSlash)
				{
					chargeNum = 0;
				}
				randomize();
				critChance = irandom_range(1,100);
				if(critChance <= 5 + (25 * crit))
				{
					enemy.hp -= (2 + critPB) * (1 + rageDamage + chargeNum);
					instance_create_layer(enemy.x,enemy.y-10,"Instances",oCritVFX);
					ScreenShake(4,12);
					audio_play_sound(snd_Crit,5,false);
				}
				else
				{
					enemy.hp -= (1 + rageDamage + chargeNum);
					if(chargeSlash)
					{
						ScreenShake(4,12);
						audio_play_sound(snd_ChargeHit,5,false);
					}
					else
					{
						ScreenShake(2,10);
					}
					audio_play_sound(snd_Hit,5,false);
				}
			}
			else
			{
				audio_play_sound(snd_Klang,5,false);
			}
			vsp = -3;
			if(chargeSlash)
			{
				instance_create_layer(enemy.x,enemy.y-4,"VFX",oDustSlashBumperGreen);
			}
			else
			{
				instance_create_layer(enemy.x,enemy.y-4,"VFX",oDustSlashBumper);
			}
			airborne = true;
			hasSlashed = true;
			hasSlashJumped = true;
			extraJump = true;
			if(chargeInItems) 
			{
				chargeBounces++;
				// Start spawning player particles if next hit is a charge hit
				if(chargeBounces == 2) 
				{
					particles = instance_create_layer(x,y,"Walls",oPlayerChargeParticle);
					audio_play_sound(snd_Charge,5,false);
					alarm[7] = room_speed * 0.1;
				}
			}
		}
		box = instance_place(x,y+9,oSpikeBox);
		if(box)
		{
			// Push player up
			while(place_meeting(x,y+8,oSpikeBox))
			{
				y -= 1;	
			}
			vsp = -3;	
			if(chargeSlash)
			{
				instance_create_layer(box.x+8,box.y,"VFX",oDustSlashBumperGreen);
			}
			else
			{
				instance_create_layer(box.x+8,box.y,"VFX",oDustSlashBumper);
			}
			airborne = true;
			hasSlashed = true;
			hasSlashJumped = true;
			extraJump = true;
			if(chargeInItems) 
			{
				chargeBounces++;
				// Start spawning player particles if next hit is a charge hit
				if(chargeBounces == 2) 
				{
					particles = instance_create_layer(x,y,"Walls",oPlayerChargeParticle);
					audio_play_sound(snd_Charge,5,false);
					alarm[7] = room_speed * 0.1;
				}
			}
			audio_play_sound(snd_Klang,5,false);
		}
		lever = instance_place(x,y+9,oLever);
		if(lever)
		{
			// Push player up
			while(place_meeting(x,y+8,oLever))
			{
				y -= 1;	
			}
			// Block switch
			// Switch blocks A and B
			if(instance_exists(oBlockA) || instance_exists(oBlockB))
			{
				alarm[4] = room_speed * 0.34;
				oBlockA.image_speed = 1;
				oBlockB.image_speed = 1;
				global.bumpersSwitching = true;
			}	
			vsp = -3;	
			oLever.green = !lever.green;
			if(chargeSlash)
			{
					instance_create_layer(lever.x+4,lever.y,"VFX",oDustSlashBumperGreen);
			}
			else
			{
					instance_create_layer(lever.x+4,lever.y,"VFX",oDustSlashBumper);
			}
			airborne = true;
			hasSlashed = true;
			hasSlashJumped = true;
			extraJump = true;
			if(chargeInItems) 
			{
				chargeBounces++;
				// Start spawning player particles if next hit is a charge hit
				if(chargeBounces == 2) 
				{
					particles = instance_create_layer(x,y,"Walls",oPlayerChargeParticle);
					audio_play_sound(snd_Charge,5,false);
					alarm[7] = room_speed * 0.1;
				}
			}
			audio_play_sound(snd_Lever,5,false);
		}
	}

	// Jump
	if (jumpBuffer > 0) && (key_jump) && (canJump)
	{
		vsp = -3;
		instance_create_layer(x,y,"VFX",oDust);
		audio_play_sound(snd_Jump, 5, false);
		canJump = false;
		// Conveyer speed
		if(place_meeting(x,y+1,oLeftConveyer))
		{
			if(hsp > 0)
			{
				walksp *= 1.5;
				initialConveyerRunDir = image_xscale;
				conveyerBoost = true;
				if (hsp >= 1) instance_create_layer(x,y,"VFX",oFastJumpVFX);
			}
		}
		// Conveyer speed
		if(place_meeting(x,y+1,oRightConveyer))
		{
			if(hsp < 0)
			{
				walksp *= 1.5;
				initialConveyerRunDir = image_xscale;
				conveyerBoost = true;
				if (hsp <= -1)
				{
					vfx = instance_create_layer(x,y,"VFX",oFastJumpVFX);
					vfx.image_xscale = -1;
				}
			}
		}
	}
	
	// Reset conveyer speed in midair
	if(airborne && conveyerBoost)
	{
		// Reset your speed if you turn around in midair
		if(image_xscale != initialConveyerRunDir)
		{
			walksp = 1;
			initialConveyerRunDir = 0;
			conveyerBoost = false;
		}
	}
	
	// Extra Jump
	if (global.item == 8) && (key_item_pressed) && (extraJump) && (!wallSliding)
	{
		vsp = -3;
		extraJump = false;
		instance_create_layer(x,y,"VFX",oWingVFX);
		if(!airborne) instance_create_layer(x,y,"VFX",oDust);
		audio_play_sound(snd_Wings, 5, false);
	}

	// Variable jump height
	// Turn off variable jump height after using an extra jump
	if(extraJump)
	{
		if vsp < 0 && (!(key_jump) && !hasSlashed) && !upConveyerBoost //if you're moving upwards in the air but not holding down jump
		{
			vsp *= 0.85; //essentially, divide your vertical speed
		}
	}
	
	if(!invulnerable && !dashing)
	{
		enemyHitRight = instance_place(x+(1*image_xscale),y,oEnemy);
		enemyHitLeft = instance_place(x-(1*image_xscale),y,oEnemy);
		
		if(enemyHitRight && !enemyHitRight.noDamage)
		{
			TakeDamage(1,2.75,3.5,true);
		}
		else if(enemyHitLeft && !enemyHitLeft.noDamage)
		{
			TakeDamage(1,2.75,-3.5,true);
		}
		
		spikeHitRight = instance_place(x+(1*image_xscale),y,oSpikes);
		spikeHitLeft = instance_place(x-(1*image_xscale),y,oSpikes);
		spikeHitDown = instance_place(x,y+1,oSpikes);
		spikeHitUp = instance_place(x,y-1,oSpikes);
		
		if(spikeHitRight)
		{
			TakeDamage(1,2.75,3.5,true);
		}
		else if(spikeHitLeft)
		{	
			TakeDamage(1,2.75,-3.5,true);
		}
		else if(spikeHitDown)
		{
			TakeDamage(1,3,0,true);	
		}
		else if(spikeHitUp)
		{
			TakeDamage(1,-1,0,true);	
		}
		
		spikeHitRight = instance_place(x+(1*image_xscale),y,oSpikeBox);
		spikeHitLeft = instance_place(x-(1*image_xscale),y,oSpikeBox);
		spikeHitDown = instance_place(x,y+1,oSpikeBox);
		spikeHitUp = instance_place(x,y-1,oSpikeBox);
		
		if(spikeHitRight)
		{
			TakeDamage(1,2.75,3.5,true);
		}
		else if(spikeHitLeft)
		{	
			TakeDamage(1,2.75,-3.5,true);
		}
		else if(spikeHitDown)
		{
			TakeDamage(1,3,0,true);	
		}
		else if(spikeHitUp)
		{
			TakeDamage(1,-1,0,true);	
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

	// Vertical Collision
	if (place_meeting(x,y+vsp,oWall))
	{
		while (!place_meeting(x,y+sign(vsp),oWall))
		{
			y = y + sign(vsp);
		}
		vsp = 0;
	}
	
	// Get out of walls
	if(place_meeting(x,y,oWall))
	{
		for(i = 0; i < 1000; i++)
		{
			// Right
			if(!place_meeting(x+i,y,oWall))
			{
				x += i;
				break;
			}
			// Left
			if(!place_meeting(x-i,y,oWall))
			{
				x -= i;
				break;
			}
			// Up
			if(!place_meeting(x,y-i,oWall))
			{
				y -= i;
				break;
			}
			// Down
			if(!place_meeting(x,y+i,oWall))
			{
				y += i;
				break;
			}
			// Top Right
			if(!place_meeting(x+i,y-i,oWall))
			{
				x += i;
				y -= i;
				break;
			}
			// Top Left
			if(!place_meeting(x-i,y-i,oWall))
			{
				x -= i;
				y -= i;
				break;
			}
			// Bottom Right
			if(!place_meeting(x+i,y+i,oWall))
			{
				x += i;
				y += i;
				break;
			}
			// Bottom Left
			if(!place_meeting(x-i,y+i,oWall))
			{
				x -= i;
				y += i;
				break;
			}
		}
	}
	
	// Apply movement
	x = x + hsp;
	y = y + vsp;
	
	// Conveyer belt
	if(place_meeting(x,y+1,oLeftConveyer))
	{
		if(place_meeting(x-1,y,oWall) && key_left)
		{
			
		}
		else if(place_meeting(x+1,y,oWall) && (key_right || hsp == 0))
		{
			
		}
		else
		{
			x += 0.5;
		}
	}
	if(place_meeting(x,y+1,oRightConveyer))
	{
		if(place_meeting(x+1,y,oWall) && key_right)
		{
			
		}
		else if(place_meeting(x-1,y,oWall) && (key_left || hsp == 0))
		{
			
		}
		else
		{
			x -= 0.5;
		}
	}

	if(prevAirborne && !airborne)
	{
		landing = true;
		extraJump = true;
		// Reset conveyer boost on landing
		if(conveyerBoost)
		{
			walksp = 1;
			initialConveyerRunDir = 0;
			conveyerBoost = false;
		}
		upConveyerBoost = false;
		instance_create_layer(x,y,"VFX",oDustSmall);
		audio_play_sound(snd_Land, 5, false);
		hit = false;
		chargeBounces = 0;
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
					if(!conveyerBoost) walksp = 1;
				}
			}
			else if(!airborne)
			{
				if(!conveyerBoost) walksp = 1;	
				if(running)
				{
					running = false;
				}
			}
			break;
		// Bouncing Axe
		case 11:
			if(key_item_pressed && instance_number(oAxe) <= 1)
			{
				if(!wallSliding)
				{
					axe = instance_create_layer(x+(4*image_xscale),y-4,"Walls",oAxe);
					axe.dir = image_xscale;
				}
				else
				{
					axe = instance_create_layer(x+(4*-image_xscale),y-4,"Walls",oAxe);
					axe.dir = -image_xscale;
					axe.image_index = 2;
				}
			}
			break;	
		// Doomerang
		case 12:
			if(key_item_pressed && instance_number(oBoomerang) <= 0)
			{
				if(!wallSliding)
				{
					boomerang = instance_create_layer(x+(4*image_xscale),y,"Walls",oBoomerang);
					boomerang.dir = image_xscale;
				}
				else
				{
					boomerang = instance_create_layer(x+(4*-image_xscale),y,"Walls",oBoomerang);
					boomerang.dir = -image_xscale;
					boomerang.image_index = 4;
				}
			}
			break;	
		// Lightning in a Bottle
		case 16:
			if(key_item_pressed && !dashing)
			{
				dashing = true;
				initialRunDir = image_xscale;
				dashOver = false;
				walksp = 4;
				if(!wallSliding)
				{
					if(key_right)
					{
						currentwalksp = 4;
					}
					else if(key_left)
					{
						currentwalksp = -4;
					}
					else
					{
						currentwalksp = 4 * sign(image_xscale);
					}
					dashVFX = instance_create_layer(x,y,"VFX",oDashVFX);
					if (image_xscale == -1) dashVFX.image_xscale = -1;
				}
				else
				{
					currentwalksp = 4 * -sign(image_xscale);
					dashVFX = instance_create_layer(x,y,"VFX",oDashVFX);
					if (image_xscale == 1) dashVFX.image_xscale = -1;
				}
				alarm[8] = room_speed * 0.2;
				dashParticles = instance_create_layer(x,y,"Walls",oPlayerDashParticle);
				alarm[9] = room_speed * 0.05;
				if (airborne)
				{
					airDash = true;
				}
				audio_play_sound(snd_Dash,5,false);
			}
			
			// Changes while dashing
			if(dashing)
			{
				if(airDash)
				{
					vsp = 0;
				}
				else
				{
					if(airborne)
					{
						walksp -= 0.035;
						if(walksp < 1) walksp = 1;
					}
				}
			}
			else
			{
				if(!conveyerBoost) walksp = 1;
			}
			
			// End Dash
			if(dashOver)
			{
				// If an air dash, stop immediately
				if(airDash)
				{
					dashing = false;
					airDash = false;
					instance_destroy(dashParticles);
				}
				// Otherwise end when touching the ground or holding a different direction
				else
				{
					if(!airborne || wallSliding || image_xscale != initialRunDir)
					{
						dashing = false;
						airDash = false;
						instance_destroy(dashParticles);
					}
				}
			}
			
			break;
			
	}

	// Animation
	if(slashing)
	{
		if(chargeSlash)
		{
			sprite_index = sPlayerSlashDouble;	
		}
		else
		{
			sprite_index = sPlayerSlashSmall;	
		}
	}
	else if(hit)
	{
		sprite_index = sPlayerHit;	
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