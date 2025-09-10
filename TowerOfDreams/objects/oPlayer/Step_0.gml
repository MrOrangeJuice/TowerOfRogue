// Get Player Input

key_left = keyboard_check(ord("A")) || keyboard_check(vk_left);
key_right = keyboard_check(ord("D")) || keyboard_check(vk_right);
key_jump = keyboard_check(vk_space) || keyboard_check(ord("Z")) || keyboard_check(ord("P"));
key_jump_released = keyboard_check_released(vk_space) || keyboard_check_released(ord("Z")) || keyboard_check_released(ord("P"));
key_item_pressed = keyboard_check_pressed(ord("X")) || keyboard_check_pressed(ord("O")) || keyboard_check_pressed(vk_lshift);
key_item = keyboard_check(ord("X")) || keyboard_check(ord("O")) || keyboard_check(vk_lshift);
key_drop_item = keyboard_check(ord("C")) || keyboard_check(ord("I")) || keyboard_check(vk_rshift);

if (key_left) || (key_right) || (key_jump) || (key_item) || (key_item_pressed) || (key_drop_item)
{
	global.controller = 0;
}

// Gamepad input
if (gamepad_axis_value(0,gp_axislh) < -0.2 || gamepad_button_check(0,gp_padl))
{
	key_left = 1;
	global.controller = 1;
}
if (gamepad_axis_value(4,gp_axislh) < -0.2 || gamepad_button_check(4,gp_padl))
{
	key_left = 1;
	global.controller = 2;
}

if (gamepad_axis_value(0,gp_axislh) > 0.2 || gamepad_button_check(0,gp_padr))
{
	key_right = 1;
	global.controller = 1;
}
if (gamepad_axis_value(4,gp_axislh) > 0.2 || gamepad_button_check(4,gp_padr))
{
	key_right = 1;
	global.controller = 2;
}

if (gamepad_button_check(0,gp_face1))
{
	key_jump = 1;
	global.controller = 1;
}
if (gamepad_button_check(4,gp_face1))
{
	key_jump = 1;
	global.controller = 2;
}

if (gamepad_button_check_released(0,gp_face1))
{
	key_jump_released = 1;
	global.controller = 1;
}
if (gamepad_button_check_released(4,gp_face1))
{
	key_jump_released = 1;
	global.controller = 2;
}

if (gamepad_button_check_pressed(0,gp_face2) || gamepad_button_check_pressed(0,gp_face3))
{
	key_item_pressed = 1;
	global.controller = 1;
}
if (gamepad_button_check_pressed(4,gp_face2) || gamepad_button_check_pressed(4,gp_face3))
{
	key_item_pressed = 1;
	global.controller = 2;
}

if (gamepad_button_check(0,gp_face2) || gamepad_button_check(0,gp_face3))
{
	key_item = 1;
	global.controller = 1;
}
if (gamepad_button_check(4,gp_face2) || gamepad_button_check(4,gp_face3))
{
	key_item = 1;
	global.controller = 2;
}

if (gamepad_button_check(0,gp_face4))
{
	key_drop_item = 1;
	global.controller = 1;
}
if (gamepad_button_check(4,gp_face4))
{
	key_drop_item = 1;
	global.controller = 2;
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
		// Pick music
		if(global.music)
		{
			if(room == rTutorial && !global.tutorialMusic)
			{
				if(global.sword)
				{
					audio_play_sound(msc_TutorialV3,5,true);
				}
				else
				{
					audio_play_sound(msc_TutorialIntro,5,true);
				}
				global.tutorialMusic = true;
			}
			if(room == rHub && !global.hubMusic)
			{
				audio_play_sound(msc_Hub,5,true);
				global.hubMusic = true;
			}

			if(!global.shopMusic && (room == rShop || room == rShop2 ||  room == rShopFloor2 || room == rShop2Floor2 || room == rShopFloor3 || room == rShop2Floor3))
			{
				audio_play_sound(msc_Chest,5,true);
				global.shopMusic = true;
			}
		
			if(!global.hubShopMusic && room == rHubShop)
			{
				audio_play_sound(msc_HubShop,5,true);	
				global.hubShopMusic = true;
				audio_stop_sound(msc_Hub);
				global.hubMusic = false;
			}
			
			if(!global.hubZooMusic && room == rMemoryZoo)
			{
				audio_play_sound(msc_TutorialV2,5,true);	
				global.hubZooMusic = true;
				audio_stop_sound(msc_Hub);
				global.hubMusic = false;
			}
            
            if(!global.hubTestMusic && room == rTestRoom)
            {
                audio_play_sound(msc_Lester2,5,true);	
                global.hubTestMusic = true;
                audio_stop_sound(msc_Hub);
                global.hubMusic = false;
            }
		
			if(!global.treasureMusic && (room == rTreasureRoom || room == rTreasureRoom2 || room == rTreasureRoomFloor2 || room == rTreasureRoom2Floor2 || room == rTreasureRoomFloor3 || room == rTreasureRoom2Floor3))
			{
				audio_play_sound(msc_Shop,5,true);
				global.treasureMusic = true;
			}
			if((global.inARun || global.timeTrial) && !global.floor1Music && room != rHub && room != rTreasureRoom && room != rTreasureRoom2 && room != rShop && room != rShop2  && room != rTreasureRoomFloor2 && room != rTreasureRoom2Floor2 && room != rShopFloor2 && room != rShop2Floor2 && room != rTreasureRoomFloor3 && room != rTreasureRoom2Floor3 && room != rShopFloor3 && room != rShop2Floor3)
			{
				if(global.levelCount < 3)
				{
					// Randomize music
					randomize();
					musicRand = irandom_range(0,4);
					if(musicRand == 0)
					{
						audio_play_sound(msc_Floor1Variant,5,true);
					}
					else
					{
						audio_play_sound(msc_Floor1,5,true);
					}
				}
				else if (global.levelCount < 6)
				{
					// Randomize music
					randomize();
					musicRand = irandom_range(0,4);
					if(musicRand == 0)
					{
						audio_play_sound(msc_Floor2Variant,5,true);
					}
					else
					{
						audio_play_sound(msc_Floor2,5,true);
					}
				}
				else
				{
					// Randomize music
					randomize();
					musicRand = irandom_range(0,4);
					if(musicRand == 0)
					{
						audio_play_sound(msc_Floor3Variant,5,true);
					}
					else
					{
						audio_play_sound(msc_Floor3,5,true);
					}
				}
				global.floor1Music = true;
			}
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
	
	// Ground dust
	if(!airborne && hsp != 0)
	{
		// Spawn ground dust
		if(canSpawnGroundDust)
		{
			newDust = instance_create_layer(x - (sign(hsp) * 2) + random_range(-2,2),y + 2 + random_range(-1,2),"VFX",oDustWallSmall);
			if(hsp < 0) newDust.image_xscale = -1;
			// Set wall dust timer
			canSpawnGroundDust = false;
			alarm[10] = room_speed * (0.15 + random_range(0,0.1));
		}
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
		// Temp block
		temp = instance_place(x,y+9,oTempPlatform);
		if(temp)
		{
			// Push player up
			while(place_meeting(x,y+8,oTempPlatform))
			{
				y -= 1;	
			}
			vsp = -3;
			if(chargeSlash)
			{
				instance_create_layer(temp.x+4,temp.y,"VFX",oDustSlashBumperGreen);
			}
			else
			{
				instance_create_layer(temp.x+4,temp.y,"VFX",oDustSlashBumper);
			}
			airborne = true;
			hasSlashed = true;
			hasSlashJumped = true;
			extraJump = true;
			bombNum = 2;
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
			audio_play_sound(snd_BlockHit,5,false);
			audio_play_sound(snd_Hit,5,false);
			instance_create_layer(temp.x,temp.y,"Walls",oTempPlatformDissappearVFX);
			instance_destroy(temp);
			tempBlockSlashed = true;
		}
		// Block
		block = instance_place(x,y+9,oBlockathan);
		if(block)
		{
			// Push player up
			while(place_meeting(x,y+8,oBlockathan))
			{
				y -= 1;	
			}
			vsp = -3;
			if(chargeSlash)
			{
				instance_create_layer(block.x,block.y-2,"VFX",oDustSlashBumperGreen);
			}
			else
			{
				instance_create_layer(block.x,block.y-2,"VFX",oDustSlashBumper);
			}
			airborne = true;
			hasSlashed = true;
			hasSlashJumped = true;
			extraJump = true;
			bombNum = 2;
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
			audio_play_sound(snd_BlockHit,5,false);
			audio_play_sound(snd_Hit,5,false);
			instance_create_layer(block.x,block.y,"Walls",oBlockathanFall);
			instance_destroy(block);
		}
		
		// Wall
		if(place_meeting(x,y+9,oWall))
		{
			// Check for slash items
			shock = false;
			shockNum = 0;
			bagNum = 0;
			rocks = false;
			rockNum = 0;
			citrus = false;
			citrusNum = 0;
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
				if(global.passiveItems[i] == 21)
				{
					rocks = true;
					rockNum++;
				}
				if(global.passiveItems[i] == 22)
				{
					citrus = true;
					citrusNum++;
				}
			}
			
			// Push player up
			while(place_meeting(x,y+8,oWall))
			{
				y -= 1;	
			}
			vsp = -(3+bagNum);
			if(citrus)
			{
				if(key_right && key_left)
				{
					
				}
				else if(key_right)
				{
					audio_play_sound(snd_Winds,5,false);
					walksp = (1 + ((citrusNum + citrusBoosts) * 0.5));
					currentwalksp = walksp;
					citrusBoost = true;
					citrusBoosts++;
					initialCitrusDir = sign(currentwalksp);
					instance_create_layer(x,y,"CoinVFX",oFastJumpVFX);
				}
				else if(key_left)
				{
					audio_play_sound(snd_Winds,5,false);
					walksp = (1 + ((citrusNum + citrusBoosts) * 0.5));
					currentwalksp = -walksp;
					citrusBoost = true;
					citrusBoosts++;
					initialCitrusDir = sign(currentwalksp);
					instance_create_layer(x,y,"CoinVFX",oFastJumpLeftVFX);
				}
				else if(currentwalksp != 0)
				{
					audio_play_sound(snd_Winds,5,false);
					walksp = (1 + ((citrusNum + citrusBoosts) * 0.5));
					currentwalksp = sign(currentwalksp) * walksp;
					citrusBoost = true;
					citrusBoosts++;
					initialCitrusDir = sign(currentwalksp);
					if(initialCitrusDir > 0)
					{
						instance_create_layer(x,y,"CoinVFX",oFastJumpLeftVFX);
					}
					else
					{
						instance_create_layer(x,y,"CoinVFX",oFastJumpVFX);
					}
				}
			}
			if(!tempBlockSlashed)
			{
				if(chargeSlash)
				{
					instance_create_layer(x,y+6,"UI",oDustSlashGreen);
				}
				else
				{
					instance_create_layer(x,y+6,"UI",oDustSlash);
				}
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
			if(rocks)
			{
				audio_play_sound(snd_Dig,5,false);
				for(i = 0; i < (rockNum * 4); i++)
				{
					instance_create_layer(x,y,"Enemies",oDirt);
				}
			}
			airborne = true;
			hasSlashed = true;
			hasSlashJumped = true;
			extraJump = true;
			bombNum = 2;
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
			vfxMod = 0;
			vfyMod = 0;
			if(bumper.object_index == oMushroom)
			{
				vsp = -4;
				bumper.sprite_index = sMushroomJump;
				bumper.image_index = 0;
				vfxMod = 8;
				vfyMod = 10;
			}
			else
			{
				vsp = -3;	
			}
			if(chargeSlash)
			{
				instance_create_layer(bumper.x+8-vfxMod,bumper.y-vfyMod,"VFX",oDustSlashBumperGreen);
			}
			else
			{
				instance_create_layer(bumper.x+8-vfxMod,bumper.y-vfyMod,"VFX",oDustSlashBumper);
			}
			airborne = true;
			hasSlashed = true;
			hasSlashJumped = true;
			extraJump = true;
			bombNum = 2;
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
			card = 0;
			dice = 0;
			for(i = 0; i < array_length(global.passiveItems); i++)
			{
				if(global.passiveItems[i] == 4)
				{
					card++;
				}
				if(global.passiveItems[i] == 13)
				{
					dice++;
				}
			}
			rerollDiscount = dice * 10;
			vsp = -3;
			airborne = true;
			hasSlashed = true;
			hasSlashJumped = true;
			extraJump = true;
			bombNum = 2;
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
			// Push player up
			while(place_meeting(x,y+8,oItemBubble))
			{
				y -= 1;	
			}
			
			if(bubble.object_index == oDiceBubble)
			{
				price = 10+global.rerollTax-rerollDiscount;
				if(price < 0) price = 0;
				// Check if item can be bought
				if(global.coins >= price * (1 - (0.2 * card)))
				{
					if(chargeSlash)
					{
						instance_create_layer(bubble.x+8,bubble.y,"UI",oDustSlashBumperGreen);
					}
					else
					{
						instance_create_layer(bubble.x+8,bubble.y,"UI",oDustSlashBumper);
					}
					instance_create_layer(bubble.x,bubble.y,"VFX",oBubbleVFX);
					audio_play_sound(snd_Bumper,5,false);
					// Stamper alarm
					alarm[5] = room_speed * 0.2;
					// Spawn item
					newItem = instance_create_layer(bubble.x+4,bubble.y+4,"Collectables",oDice);
					global.coins -= price * (1 - (0.2 * card));
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
			else
			{
				// Check if item can be bought
				if(global.coins >= (global.itemPrices[bubble.item] + (DetermineFloorTax() * 50)) * (1 - (0.2 * card)))
				{
					if(chargeSlash)
					{
						instance_create_layer(bubble.x+8,bubble.y,"UI",oDustSlashBumperGreen);
					}
					else
					{
						instance_create_layer(bubble.x+8,bubble.y,"UI",oDustSlashBumper);
					}
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
					global.coins -= (global.itemPrices[bubble.item] + (DetermineFloorTax() * 50)) * (1 - (0.2 * card));
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
					// Heal from peanut butter
					if(critPB > 0 && enemy.givesHealth)
					{
						global.health += critPB;
						// Overheal gems
						if(global.health == global.maxHealth + 1)
						{
							// Grant 10 gems for a half-overheal
							global.coins += 10;
							instance_create_layer(x,y-8,"Instances",o10);
							audio_play_sound(snd_Overheal,5,false);
						}
						else if(global.health > global.maxHealth + 1)
						{
							// Grant a max of 20 gems for a full-overheal
							global.coins += 20;
							instance_create_layer(x,y-8,"Instances",o20);
							audio_play_sound(snd_Overheal,5,false);
						}
						if(global.health > global.maxHealth) global.health = global.maxHealth;
						audio_play_sound(snd_Heal,5,false);
					}
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
				instance_create_layer(enemy.x,enemy.y-4,"UI",oDustSlashBumperGreen);
				// Spawn particles
				if(!enemy.invincible)
				{
					for(i = 0; i < 10; i++)
					{
						instance_create_layer(enemy.x,enemy.y,"Pipes",oSlashParticleCharged);
					}
				}
			}
			else
			{
				instance_create_layer(enemy.x,enemy.y-4,"UI",oDustSlashBumper);
				// Spawn particles
				if(!enemy.invincible)
				{
					for(i = 0; i < 10; i++)
					{
						instance_create_layer(enemy.x,enemy.y,"Pipes",oSlashParticle);
					}
				}
			}
			airborne = true;
			hasSlashed = true;
			hasSlashJumped = true;
			extraJump = true;
			bombNum = 2;
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
			bombNum = 2;
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
			bombNum = 2;
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
		
		// Hard mode switch
		skull = instance_place(x,y+9,oSkull);
		if(skull)
		{
			// Push player up
			while(place_meeting(x,y+8,oSkull))
			{
				y -= 1;	
			}
			vsp = -3;
			if(chargeSlash)
			{
				instance_create_layer(skull.x+16,skull.y+8,"VFX",oDustSlashBumperGreen);
			}
			else
			{
				instance_create_layer(skull.x+16,skull.y+8,"VFX",oDustSlashBumper);
			}
			airborne = true;
			hasSlashed = true;
			hasSlashJumped = true;
			extraJump = true;
			bombNum = 2;
			if(global.hardMode) 
			{
				global.hardMode = false;
				audio_play_sound(snd_Dream,5,false);
			}
			else 
			{
				global.hardMode = true;
				audio_play_sound(snd_Nightmare,5,false);
			}
		}
		
	}
	
	// Reset temp block slash
	tempBlockSlashed = false;

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
	
	// Reset citrus speed in midair
	if(airborne && citrusBoost)
	{
		if(initialCitrusDir == 1 && key_left)
		{
			walksp = 1;
			initialCitrusDir = 0;
			citrusBoost = false;
			citrusBoosts = 0;
		}
		else if(initialCitrusDir == -1 && key_right)
		{
			walksp = 1;
			initialCitrusDir = 0;
			citrusBoost = false;
			citrusBoosts = 0;
		}
		else if(sign(currentwalksp) != initialCitrusDir)
		{
			walksp = 1;
			initialCitrusDir = 0;
			citrusBoost = false;
			citrusBoosts = 0;
		}
	}
	
	// Extra Jump
	if (global.item == 8) && (key_item_pressed) && (extraJump) && (!wallSliding)
	{
		if(global.essence == 4)
		{
			vsp = -4;
		}
		else
		{
			vsp = -3;
		}
		extraJump = false;
		instance_create_layer(x,y,"VFX",oWingVFX);
		if(!airborne) instance_create_layer(x,y,"VFX",oDust);
		audio_play_sound(snd_Wings, 5, false);
	}

	// Variable jump height
	// Turn off variable jump height after using an extra jump
	if(extraJump)
	{
		if vsp < 0 && (!(key_jump) && !hasSlashed) && !upConveyerBoost && !lavaBoost//if you're moving upwards in the air but not holding down jump
		{
			vsp *= 0.85; //essentially, divide your vertical speed
		}
	}
	
	if(!invulnerable && !dashing)
	{
		mask_index = sHurtbox;
		enemyHitRight = instance_place(x+(1*image_xscale),y,oEnemy);
		enemyHitLeft = instance_place(x-(1*image_xscale),y,oEnemy);
		
		if(enemyHitRight && !enemyHitRight.noDamage && enemyHitRight.object_index != oPastGrave)
		{
			TakeDamage(1,2.75,3.5,true);
		}
		else if(enemyHitLeft && !enemyHitLeft.noDamage && enemyHitLeft.object_index != oPastGrave)
		{
			TakeDamage(1,2.75,-3.5,true);
		}
		
		if(global.essence != 1)
		{
			mask_index = sPlayerIdle;
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
		
			mask_index = sHurtbox;
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
		
		mask_index = sPlayerIdle;
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
		heavyBoots = false;
		heavyBootsNum = 0;
		for(i = 0; i < array_length(global.passiveItems); i++)
		{
			if(global.passiveItems[i] == 17)
			{
				heavyBoots = true;
				heavyBootsNum++;
			}
		}
		
		if(heavyBoots)
		{
			ScreenShake(1,5);
			audio_play_sound(snd_Impact,5,false);
			// Spawn shock waves
			instance_create_layer(x,y,"Instances",oShockwave);
			rightShock = instance_create_layer(x,y,"Instances",oShockwave);
			rightShock.dir = 1;
			heavyBootsNum--;
			bootsX = x;
			bootsY = y;
			if(heavyBootsNum > 0)
			{
				alarm[11] = room_speed * 0.1;	
			}
		}
		
		landing = true;
		extraJump = true;
		// Reset conveyer boost on landing
		if(conveyerBoost)
		{
			walksp = 1;
			initialConveyerRunDir = 0;
			conveyerBoost = false;
		}
		// Reset citrus boost on landing
		if(citrusBoost)
		{
			walksp = 1;
			initialCitrusDir = 0;
			citrusBoost = false;
			citrusBoosts = 0;
		}
		upConveyerBoost = false;
		lavaBoost = false;
		instance_create_layer(x,y,"VFX",oDustSmall);
		audio_play_sound(snd_Land, 5, false);
		hit = false;
		chargeBounces = 0;
		if(global.essence == 4)
		{
			bombNum = 3;
		}
		else
		{
			bombNum = 2;
		}
	}
	
	// Drop Item
	if(key_drop_item && global.item != -1)
	{
		global.dropItemHold++;
		if(global.dropItemHold >= 30)
		{
			with(oGame) itemTextScale = 1.3;
			// Reset walksp in case of boots or lightning
			walksp = 1;
			running = false;
			dashing = false;
			// Reset extra jump variable for wings
			extraJump = true;

			// Drop the item on the ground
			oldItem = instance_create_layer(x-4,y-8,"Collectables",global.itemObjects[global.item]);
			oldItem.vsp = -6;
			
			audio_play_sound(snd_Dropitem,5,false);
			
			// Reset
			global.item = -1;
			global.dropItemHold = 0;
		}
	}
	else
	{
		global.dropItemHold = 0;
	}
	
	if(global.playerShapePortalSpawned)
	{
		shapePortalTimer--;
		if(!place_meeting(x,y,oShapePortal) && shapePortalTimer <= 0)
		{
			global.playerShapePortalSpawned = false;
			shapePortalTimer = 30;
		}
	}
	
	if(portalVFXTimer > 0)
	{
		if(random_range(0,9) < portalVFXTimer)
		{
			instance_create_layer(x+random_range(-3,3),y+random_range(-3,3),"VFX",oCircleVFX);
		}
		portalVFXTimer -= 0.03;	
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
				if(global.essence == 4)
				{
					walksp = 2;
				}
				else
				{
					walksp = 1.5;
				}
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
			axeLimit = 1;
			if(global.essence == 4)
			{
				axeLimit = 2;	
			}
			if(key_item_pressed && instance_number(oAxe) <= axeLimit)
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
			rangLimit = 0;
			if(global.essence == 4)
			{
				rangLimit = 1;	
			}
			if(key_item_pressed && instance_number(oBoomerang) <= rangLimit)
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
				speedValue = 4;
				if(global.essence == 4) 
				{
					speedValue = 5;
				}
				dashing = true;
				initialRunDir = image_xscale;
				dashOver = false;
				walksp = speedValue;
				if(!wallSliding)
				{
					if(key_right)
					{
						currentwalksp = speedValue;
					}
					else if(key_left)
					{
						currentwalksp = -speedValue;
					}
					else
					{
						currentwalksp = speedValue * sign(image_xscale);
					}
					dashVFX = instance_create_layer(x,y,"VFX",oDashVFX);
					if (image_xscale == -1) dashVFX.image_xscale = -1;
				}
				else
				{
					currentwalksp = speedValue * -sign(image_xscale);
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
				if(!conveyerBoost && !citrusBoost) walksp = 1;
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
		// Spray N' Pray
		case 20:
			if(key_item_pressed)
			{
				audio_play_sound(snd_Kunai,5,false);
				if(!(wallSliding && image_xscale == 1))
				{
					sprayRight = instance_create_layer(x+4,y,"Walls",oSpray);
					sprayRight.initialDir = 1;
					sprayRight.sprite_index = sRightSpray;
				}
				if(!(wallSliding && image_xscale == -1))
				{
					sprayLeft = instance_create_layer(x-4,y,"Walls",oSpray);
					sprayLeft.initialDir = -1;
					sprayLeft.sprite_index = sLeftSpray;
				}
				sprayUp = instance_create_layer(x,y-4,"Walls",oSpray);
				sprayUp.initialYDir = -1;
				sprayUp.sprite_index = sUpSpray;
				if(airborne)
				{
					sprayDown = instance_create_layer(x,y+4,"Walls",oSpray);
					sprayDown.initialYDir = 1;
					sprayDown.sprite_index = sDownSpray;
				}
			}
			break;	
		// Jester Bomb
		case 22:
			if(key_item_pressed)
			{
				audio_play_sound(snd_Kunai,5,false);
				// If on ground, just spawn explosion and shoot straight up
				if(!airborne)
				{
					if(global.essence == 4)
					{
						vsp = -4.5;
					}
					else
					{
						vsp = -4;
					}
					extraJump = false;
					instance_create_layer(x,y,"VFX",oBombExplosionVFX);
					audio_play_sound(snd_BombJump,5,false);
					ScreenShake(2,10);
				}
				// Otherwise throw bomb straight down and get a little bit of lift
				else if(bombNum > 0)
				{
					vsp = -2;
					extraJump = false;
					bombNum--;
					instance_create_layer(x-4,y-4,"Walls",oBomb);
					audio_play_sound(snd_Kunai,5,false);
				}
			}
			break;
		// Remote Birthday Surprise
		case 24:
			if(key_item_pressed)
			{
				// Spawn mine
				if(!instance_exists(oBirthdayMine) && !instance_exists(oBirthdayFall))
				{
					audio_play_sound(snd_Kunai,5,false);
					// If on ground, just spawn cake mine immediately
					if(!airborne)
					{	
						instance_create_layer(x-4,y-4,"Instances",oBirthdayMine);
						audio_play_sound(snd_Cake,5,false);
					}
					// Otherwise throw cake mine straight down and get a little bit of lift
					else
					{
						vsp = -2;
						extraJump = false;
						instance_create_layer(x-4,y-4,"Instances",oBirthdayFall);
						audio_play_sound(snd_Kunai,5,false);
					}
				}
				// Detonate mine
				else if(global.armed)
				{
					if(instance_exists(oBirthdayMine))
					{
						instance_create_layer(oBirthdayMine.x+4,oBirthdayMine.y+4,"UI",oBirthdayExplosion);
						instance_create_layer(oBirthdayMine.x+4,oBirthdayMine.y+4,"Pipes",oPlayerBit);
						instance_create_layer(oBirthdayMine.x+4,oBirthdayMine.y+4,"Pipes",oPlayerBit);
						instance_create_layer(oBirthdayMine.x+4,oBirthdayMine.y+4,"Pipes",oPlayerBit);
						instance_create_layer(oBirthdayMine.x+4,oBirthdayMine.y+4,"Pipes",oPlayerBit);
						instance_create_layer(oBirthdayMine.x+4,oBirthdayMine.y+4,"Pipes",oPlayerBit);
						instance_create_layer(oBirthdayMine.x+4,oBirthdayMine.y+4,"Pipes",oPlayerBit);
						instance_create_layer(oBirthdayMine.x+4,oBirthdayMine.y+4,"Pipes",oPlayerBit);
						instance_create_layer(oBirthdayMine.x+4,oBirthdayMine.y+4,"Pipes",oPlayerBit);
						instance_destroy(oBirthdayMine);
						audio_play_sound(snd_EnemyDeath,5,false);
						//audio_play_sound(snd_Button,5,false);
						global.armed = false;
					}
				}
			}
			break;
		// Gem Cannon
		case 29:
			if(key_item_pressed)
			{
				if(global.coins > 0 || room == rHub)
				{
					audio_play_sound(snd_GemShot,5,false);
					if(!airborne)
					{
						if(image_xscale > 0)
						{
							gem = instance_create_layer(x+(4*image_xscale),y,"Walls",oGemBulletRight);
							gem.initialDir = image_xscale;
							if(room != rHub) global.coins--;
						}
						else
						{
							gem = instance_create_layer(x+(4*image_xscale),y,"Walls",oGemBulletLeft);
							gem.initialDir = image_xscale;
							if(room != rHub) global.coins--;
						}
					}
					else
					{
						gem = instance_create_layer(x,y+4,"Walls",oGemBulletDown);
						gem.initialYDir = 1;
						vsp = -1.5;
						extraJump = false;
						if(room != rHub) global.coins--;
					}
				}
				else
				{
					audio_play_sound(snd_NoAmmo,5,false);
				}
			}
			break;
		// Blockathan
		case 30:
			if(key_item_pressed)
			{
				// Destroy any other block
				if(instance_exists(oBlockathan)) oBlockathan.sprite_index = sBlockDissapear;
				// Determine player position
				if(place_meeting(x,y+8,oWall))
				{
					// Right facing
					if(image_xscale >= 0)
					{
						if(!place_meeting(x + blockOffset + (hsp*2),y,oEnemy)) 
						{
							blockCursorCooldown = 20;
							audio_play_sound(snd_Block,5,false);
							instance_create_layer(x + blockOffset + (hsp*2),y,"Walls",oBlockathan);
						}
						else
						{
							ScreenShake(1,5);	
							audio_play_sound(snd_BlockFail,5,false);
						}
					}
					// Left facing
					else if(image_xscale < 0)
					{
						if(!place_meeting(x - blockOffset + (hsp*2),y,oEnemy)) 
						{
							blockCursorCooldown = 20;
							audio_play_sound(snd_Block,5,false);
							instance_create_layer(x - blockOffset + (hsp*2),y,"Walls",oBlockathan);
						}
						else
						{
							ScreenShake(1,5);	
							audio_play_sound(snd_BlockFail,5,false);
						}
					}
				}
				// Down
				else
				{
					if(!place_meeting(x + (hsp*2),y + blockOffset + (vsp*2),oEnemy)) 
					{
						blockCursorCooldown = 20;
						audio_play_sound(snd_Block,5,false);
						instance_create_layer(x + (hsp*2),y + blockOffset + (vsp*2),"Walls",oBlockathan);
					}
					else
					{
						ScreenShake(1,5);	
						audio_play_sound(snd_BlockFail,5,false);
					}
				}
			}
			break;
		// Ninja Star
		case 33:
			if(key_item_pressed)
			{
				// Shoot star
				if(!instance_exists(oNinjaStar))
				{
					if(!wallSliding)
					{
						kunai = instance_create_layer(x+(4*image_xscale),y,"Walls",oNinjaStar);
						kunai.initialDir = image_xscale;
					}
					else
					{
						kunai = instance_create_layer(x+(4*-image_xscale),y,"Walls",oNinjaStar);
						kunai.initialDir = -image_xscale;
					}
				}
				// Teleport
				else
				{
					instance_create_layer(x,y,"UI",oSmokeVFX);
					// Spawn an extra log
					if(global.essence == 4)
					{
						instance_create_layer(x,y,"Walls",oLog);
					}
					instance_create_layer(x,y,"Walls",oLog);
					x = oNinjaStar.x;
					y = oNinjaStar.y;
					instance_destroy(oNinjaStar);
					instance_create_layer(x,y,"UI",oSmokeVFX);
					ScreenShake(1,5);
					audio_play_sound(snd_Teleport,5,false);
				}
			}
			break;	
	}

	// Animation
	if(slashing)
	{
		if(chargeSlash)
		{
			sprite_index = doubleSlashSprite;	
		}
		else
		{
			sprite_index = slashSprite;	
		}
	}
	else if(hit)
	{
		sprite_index = hitSprite;	
	}
	else if(wallSliding)
	{
		sprite_index = wallSprite;	
	}
	else if(airborne && !landing)
	{
		if (vsp <= 0) 
		{
			sprite_index = jumpSprite;
		}
		if (vsp > 0)
		{
			sprite_index = fallSprite;
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
			sprite_index = runSprite;
		}
		else
		{
			sprite_index = idleSprite;
		}
	}
	else if(landing)
	{
		sprite_index = landSprite;	
	}

	if (hsp != 0 && !slashing && !hit) image_xscale = sign(hsp);

	prevAirborne = airborne;
	prevWallSliding = wallSliding;
}
else
{
	image_speed = 0;	
}