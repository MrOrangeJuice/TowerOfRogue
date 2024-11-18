/// @description Draw GUI

draw_set_font(fUI);

if(global.res1610)
{
	UIOffset = 8;
}
else
{
	UIOffset = 0;	
}

if(global.debugDisplay) 
{
	if(global.debug) draw_text(0,128,"DEBUG ENABLED");
	else draw_text(0,128,"DEBUG DISABLED");
}
// Debug controller
if(global.controllerDebug)
{
	draw_text(232,0,"Slots Used:");
	if(gamepad_is_connected(0)) draw_text(232,8,"Slot 0");
	if(gamepad_is_connected(4)) draw_text(232,16,"Slot 4");
}

// Draw Pause Menu
if(global.paused && !global.dreamBoy)
{
	draw_set_halign(fa_center);
	draw_set_font(fMenu);
	
	if (!options)
	{
		draw_sprite(sMenuBox,0,128,40+UIOffset);
		
		if(menuOption == 0)
		{
			draw_set_color($A3A7E9);
		}
		else
		{
			draw_set_color($DDADE6);	
		}
		draw_text(128,52+UIOffset,"RESUME");
		
		if(menuOption == 1)
		{
			draw_set_color($A3A7E9);
		}
		else
		{
			draw_set_color($DDADE6);	
		}
		draw_text(128,68+UIOffset,"OPTIONS");
		
		if(menuOption == 2)
		{
			draw_set_color($A3A7E9);
		}
		else
		{
			draw_set_color($DDADE6);	
		}
		draw_text(128,84+UIOffset,"QUIT");
	}
	else
	{
		draw_sprite(sMenuBoxBig,0,128,40+UIOffset);
		
		if(menuOption == 0)
		{
			draw_set_color($A3A7E9);
		}
		else
		{
			draw_set_color($DDADE6);	
		}
		if(window_get_fullscreen())
		{
			draw_text(128,52+UIOffset,"FULLSCREEN: ON");
		}
		else
		{
			draw_text(128,52+UIOffset,"FULLSCREEN: OFF");
		}
		if(menuOption == 1)
		{
			draw_set_color($A3A7E9);
		}
		else
		{
			draw_set_color($DDADE6);	
		}
		if(global.res1610)
		{
			draw_text(128,68+UIOffset,"ASPECT RATIO: TALL");
		}
		else
		{
			draw_text(128,68+UIOffset,"ASPECT RATIO: WIDE");
		}
		
		if(menuOption == 2)
		{
			draw_set_color($A3A7E9);
			if(volumeArrows) draw_sprite(sVolumeSliderArrows,0,128,88+UIOffset);
			draw_sprite(sVolumeSlider,global.volume,128,84+UIOffset);
			if(alarm[0] == -1) alarm[0] = room_speed * 0.33;
		}
		else
		{
			draw_set_color($DDADE6);
			draw_sprite(sVolumeSlider,0,128,84+UIOffset);
		}
		
		if(menuOption == 3)
		{
			draw_set_color($A3A7E9);
		}
		else
		{
			draw_set_color($DDADE6);	
		}
		draw_text(128,100+UIOffset,"BACK");
		
	}
	
	// Reset color
	draw_set_color($6D454D);
	// Reset font
	draw_set_font(fUI);
}

// Draw Main Menu
if(room == rTitle)
{
	draw_set_halign(fa_center);
	draw_set_font(fMenu);
	if (!options)
	{
		draw_sprite(sMenuBox,0,128,76+UIOffset);
		
		/*
		draw_set_color($6d454d);
		draw_text(129,88+UIOffset,"START");
		draw_text(127,88+UIOffset,"START");
		draw_text(128,87+UIOffset,"START");
		draw_text(128,89+UIOffset,"START");
		*/
		if(menuOption == 0)
		{
			draw_set_color($A3A7E9);
		}
		else
		{
			draw_set_color($DDADE6);	
		}
		draw_text(128,88+UIOffset,"START");
		
		if(menuOption == 1)
		{
			draw_set_color($A3A7E9);
		}
		else
		{
			draw_set_color($DDADE6);	
		}
		draw_text(128,104+UIOffset,"OPTIONS");
		
		if(menuOption == 2)
		{
			draw_set_color($A3A7E9);
		}
		else
		{
			draw_set_color($DDADE6);	
		}
		draw_text(128,120+UIOffset,"QUIT");
	}
	else
	{
		draw_sprite(sMenuBoxBigTall,0,128,44+UIOffset);
		
		if(menuOption == 0)
		{
			draw_set_color($A3A7E9);
		}
		else
		{
			draw_set_color($DDADE6);	
		}
		if(window_get_fullscreen())
		{
			draw_text(128,56+UIOffset,"FULLSCREEN: ON");
		}
		else
		{
			draw_text(128,56+UIOffset,"FULLSCREEN: OFF");
		}
		
		if(menuOption == 1)
		{
			draw_set_color($A3A7E9);
		}
		else
		{
			draw_set_color($DDADE6);	
		}
		if(global.res1610)
		{
			draw_text(128,72+UIOffset,"ASPECT RATIO: TALL");
		}
		else
		{
			draw_text(128,72+UIOffset,"ASPECT RATIO: WIDE");
		}
		
		if(menuOption == 2)
		{
			draw_set_color($A3A7E9);
			if(volumeArrows) draw_sprite(sVolumeSliderArrows,0,128,92+UIOffset);
			draw_sprite(sVolumeSlider,global.volume,128,88+UIOffset);
			if(alarm[0] == -1) alarm[0] = room_speed * 0.33;
		}
		else
		{
			draw_set_color($DDADE6);
			draw_sprite(sVolumeSlider,0,128,88+UIOffset);
		}
		
		if(menuOption == 3)
		{
			draw_set_color($A3A7E9);
		}
		else
		{
			draw_set_color($DDADE6);	
		}
		if(deleted)
		{
			draw_text(128,104+UIOffset,"DELETED!");
		}
		else
		{
			draw_text(128,104+UIOffset,"DELETE SAVE");
		}
		
		if(menuOption == 4)
		{
			draw_set_color($A3A7E9);
		}
		else
		{
			draw_set_color($DDADE6);	
		}
		draw_text(128,120+UIOffset,"BACK");
		
	}
	
	// Reset color
	draw_set_color($6D454D);
}

// Draw HUD
if(global.HUD)
{
	if(room != rTitle && room != rRunComplete && room != rBonusItem && room != rCallToAction)
	{
		// Add spacing to HUD
		hudMod = 9 * (((global.maxHealth - 6) / 2) + (global.armor % 5 + floor(global.armor / 5)));
		if(hudMod < 0) hudMod = 0;
		// Account for coins
		if(room == rHub || room == rHubShop)
		{
			if(global.overallCoins > 9999)
			{
				if(hudMod < 10) hudMod = 10;	
			}
			else if(global.overallCoins > 999)
			{
				if(hudMod < 4) hudMod = 4;
			}
		}
		else
		{
			if(global.coins > 9999)
			{
				if(hudMod < 10) hudMod = 10;	
			}
			else if(global.coins > 999)
			{
				if(hudMod < 4) hudMod = 4;
			}
		}
	
		// Draw HUD Background
		startSprite = sHUDStart;
		middleSprite = sHUDMiddle;
		endSprite = sHUDEnd;
		
		switch(global.essence)
		{
			case 1:
				startSprite = sHUDStartRed;
				middleSprite = sHUDMiddleRed;
				endSprite = sHUDEndRed;
				break;
			case 2:
				startSprite = sHUDStartGreen;
				middleSprite = sHUDMiddleGreen;
				endSprite = sHUDEndGreen;
				break;
			case 3:
				startSprite = sHUDStartZombie;
				middleSprite = sHUDMiddleZombie;
				endSprite = sHUDEndZombie;
				break;
			case 4:
				startSprite = sHUDStartGold;
				middleSprite = sHUDMiddleGold;
				endSprite = sHUDEndGold;
				break;
		}
		
		draw_sprite(startSprite,0,1,1);
		draw_sprite_stretched(middleSprite,0,9,1,22+hudMod,27);
		draw_sprite(endSprite,0,31+hudMod,1);
	
		healthTextScale = max(healthTextScale * .95, 1);
		healthToDraw = global.health;
		xMod = 0;
		// Generate healthbar
		if(global.infiniteHealth)
		{
			draw_sprite_stretched(sHeartUISmall,0,7,7,8*healthTextScale,8*healthTextScale);
			draw_sprite(sInfinity,0,17,7);
		}
		else
		{
			for(i = 0; i < global.maxHealth; i++)
			{
				// If there's health to draw, draw it
				if(healthToDraw > 0)
				{
					// If it's an even number, draw a full heart
					if(i % 2 == 1)
					{
						draw_sprite_stretched(sHeartUISmall,0,7 + (xMod * 9),7,8*healthTextScale,8*healthTextScale);	
						xMod++;
					}
					// Otherwise, draw a half heart
					else
					{
						draw_sprite_stretched(sHeartUISmall,1,7 + (xMod * 9),7,8*healthTextScale,8*healthTextScale);	
					}
				}
				else
				{
					// Draw an empty heart every other time
					if(i % 2 == 1)
					{
						draw_sprite_stretched(sHeartUISmall,2,7 + (xMod * 9),7,8*healthTextScale,8*healthTextScale);	
						xMod++;
					}
				}
				healthToDraw--;
			}
		}
	
		armorTextScale = max(armorTextScale * .95, 1);
		// Draw Armor
		for(i = 0; i < global.armor; i++)
		{
			// If remaining armor is at least 5, draw a big sprite instead
			if(global.armor - i >= 5)
			{
				draw_sprite_stretched(sArmor5Smaller,0,7 + (xMod * 9),6,8*armorTextScale,8*armorTextScale);
				i += 4;
			}
			else
			{
				draw_sprite_stretched(sArmor,0,7 + (xMod * 9),6,8*armorTextScale,8*armorTextScale);
			}
			xMod++;
		}
	
		// Draw Coins
		coinTextScale = max(coinTextScale * .95, 1);
		draw_set_halign(fa_left);
		if(room == rHub || room == rHubShop)
		{
			draw_sprite_stretched(sChestUI,0,7,15,8*coinTextScale,8*coinTextScale);
			draw_text_transformed(17,11,global.overallCoins,coinTextScale,coinTextScale,0);
		}
		else
		{
			draw_sprite_stretched(sGem,0,7,15,8*coinTextScale,8*coinTextScale);
			draw_text_transformed(17,11,global.coins,coinTextScale,coinTextScale,0);
		}
	
		// Draw item box
		itemTextScale = max(itemTextScale * .95, 1);
		draw_sprite_stretched(sItemBox,0,40+hudMod,1,16*itemTextScale,16*itemTextScale);
	
		// Draw item in box
		if(global.item == 24 && global.armed) draw_sprite_stretched(sRemoteUI,0,44+hudMod,5,8*itemTextScale,8*itemTextScale);
		else if(global.item != -1) draw_sprite_stretched(global.itemSprites[global.item],0,44+hudMod,5,8*itemTextScale,8*itemTextScale);
	
		// Draw drop item meter
		if(global.dropItemHold > 0) draw_sprite(sDropUI,floor(global.dropItemHold/2),40+hudMod,18);
	
		// Draw passive items
		passiveItemTextScale = max(passiveItemTextScale * .95, 1);
		for(i = 0; i < array_length(global.passiveItems); i++)
		{
			// Wrap items
			if (i < (global.passiveUIWrap - (hudMod / 9)))
			{
				draw_sprite_stretched(global.passiveItemSprites[global.passiveItems[i]],0,58+(10*i)+hudMod,5,8*passiveItemTextScale,8*passiveItemTextScale);
			}
			else
			{
				draw_sprite_stretched(global.passiveItemSprites[global.passiveItems[i]],0,58+(10*(i-(global.passiveUIWrap - (hudMod / 9))))+hudMod,14,8*passiveItemTextScale,8*passiveItemTextScale);
			}
		}
		
		// Draw dev item
		if(global.drawDevItem)
		{
			draw_sprite(global.itemSprites[global.devItem],0,4,30);	
			draw_text(5,33,"F1");
		}
	}
}

// Draw Dream Boy offscreen always
if(global.dreamBoyY != global.dreamBoyYTarget)
{
	global.dreamBoyY = lerp(global.dreamBoyY,global.dreamBoyYTarget,0.2);
}
draw_sprite(sDreamBoy,global.dreamBoyOn,48,global.dreamBoyY);

if(global.dreamBoy)
{
	if(global.dreamBoyY == global.dreamBoyYTarget && !global.dreamBoyOn && !global.dreamBoyTurnedOn)
	{
		global.dreamBoyOn = true;	
		global.dreamBoyTurnedOn = true;	
		global.UIBarYTarget = 7;
	}
	
	if(global.dreamBoyOn)
	{
		draw_sprite(sDreamBoyScreenAnimatedBigger,image_index / 3.75,86,36);	
		// Reset before checking later
		global.targetBlockScales = [1,1,1];
		global.labelYTarget = [0,0,0];
		global.itemWindowYTarget = 0;
		global.floppyYTarget = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0];
		global.floppyXTarget = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0];
		global.FoeWindowYTarget = 0;
		global.floppyFoeYTarget = [0,0,0,0,0,0,0,0,0,0,0];
		global.floppyFoeXTarget = [0,0,0,0,0,0,0,0,0,0,0];
		
		// Draw blocks
		for(i = 0; i < array_length(global.blockScales); i++)
		{
			// Determine block X offset
			if(i < global.currentApp) global.blockXTarget[i] = -1;
			if(i == global.currentApp) global.blockXTarget[i] = 0;
			if(i > global.currentApp) global.blockXTarget[i] = 1;
			
			// Set targets
			if(global.dreamBoyState == 0)
			{
				if(global.currentApp == i) 
				{
					global.targetBlockScales[i] = 1.25;
				}
			}
			else 
			{
				global.targetBlockScales[i] = 0;
			}
			
			// Lerp everything
			if(global.blockScales[i] != global.targetBlockScales[i]) global.blockScales[i] = lerp(global.blockScales[i],global.targetBlockScales[i],0.2);
			if(global.blockX[i] != global.blockXTarget[i]) global.blockX[i] = lerp(global.blockX[i],global.blockXTarget[i],0.2);	
			
			// Draw objects

			// Get the width and height of the sprite
			var spr_width = sprite_get_width(global.blockSprites[i]);
			var spr_height = sprite_get_height(global.blockSprites[i]);

			// Calculate the new scaled width and height
			var new_width = spr_width * global.blockScales[i];
			var new_height = spr_height * global.blockScales[i];

			// Draw the sprite stretched, but offset the position to center it
			draw_sprite_stretched(global.blockSprites[i], -1, (103 + (25 * i) + (global.blockX[i] * 8)) - new_width / 2, 70 - new_height / 2, new_width, new_height);
		}
		
		// Draw labels
		for(i = 0; i < array_length(global.labelSprites); i++)
		{
			// Set targets
			if(global.dreamBoyState == 0)
			{
				if(global.currentApp == i) 
				{
					global.labelYTarget[i] = 64;
				}
			}
			else 
			{
				global.labelYTarget[i] = 0;
			}
			
			if(global.labelY[i] != global.labelYTarget[i]) global.labelY[i] = lerp(global.labelY[i],global.labelYTarget[i],0.2);	
			
			draw_sprite(global.labelSprites[i],image_index / 5,(103 + (25 * i)),(158 - global.labelY[i]));
		}
		
		// Draw floppys
		for(i = 0; i < array_length(global.floppyYTarget); i++)
		{
			if(global.dreamBoyState == 1)
			{
				if(global.currentItem == i)
				{
					global.floppyYTarget[i] = 67;
				}
				else
				{
					global.floppyYTarget[i] = 64;
				}
				global.floppyXTarget[i] = (119 + (i * 20) - (global.currentItem * 20));
			}
			else
			{
				global.floppyYTarget[i] = 0;
			}
			
			// Lerp everything
			if(global.floppyY[i] != global.floppyYTarget[i]) global.floppyY[i] = lerp(global.floppyY[i],global.floppyYTarget[i],0.2);	
			if(global.floppyX[i] != global.floppyXTarget[i]) global.floppyX[i] = lerp(global.floppyX[i],global.floppyXTarget[i],0.2);	
			
			// Draw
			if(global.floppyY[i] > 24 && global.floppyX[i] > 64 && global.floppyX[i] < 172) 
			{
				draw_sprite(sFloppy,0,global.floppyX[i],-24 + global.floppyY[i]);
				if(global.itemsFound[i]) draw_sprite(global.dbItemSprites[i],0,global.floppyX[i] + 5,-10 + global.floppyY[i]);
				else draw_sprite(sQuestion,0,global.floppyX[i] + 5,-10 + global.floppyY[i]);
			}
		}
		
		// Draw foe floppys
		for(i = 0; i < array_length(global.floppyFoeYTarget); i++)
		{
			if(global.dreamBoyState == 2)
			{
				if(global.currentFoe == i)
				{
					global.floppyFoeYTarget[i] = 67;
				}
				else
				{
					global.floppyFoeYTarget[i] = 64;
				}
				global.floppyFoeXTarget[i] = (119 + (i * 20) - (global.currentFoe * 20));
			}
			else
			{
				global.floppyFoeYTarget[i] = 0;
			}
			
			// Lerp everything
			if(global.floppyFoeY[i] != global.floppyFoeYTarget[i]) global.floppyFoeY[i] = lerp(global.floppyFoeY[i],global.floppyFoeYTarget[i],0.2);	
			if(global.floppyFoeX[i] != global.floppyFoeXTarget[i]) global.floppyFoeX[i] = lerp(global.floppyFoeX[i],global.floppyFoeXTarget[i],0.2);	
			
			// Draw
			if(global.floppyFoeY[i] > 24 && global.floppyFoeX[i] > 64 && global.floppyFoeX[i] < 172) 
			{
				draw_sprite(sFloppy,0,global.floppyFoeX[i],-24 + global.floppyFoeY[i]);
				if(global.enemiesFound[i]) draw_sprite(global.dbFoeSprites[i],0,global.floppyFoeX[i] + 5,-10 + global.floppyFoeY[i]);
				else draw_sprite(sQuestion,0,global.floppyFoeX[i] + 5,-10 + global.floppyFoeY[i]);
			}
		}
		
		// Draw item window
		if(global.dreamBoyState == 1)
		{
			global.itemWindowYTarget = 64;
		}
		else
		{
			global.itemWindowYTarget = 0;
		}
		
		// Draw foe item window
		if(global.dreamBoyState == 2)
		{
			global.foeWindowYTarget = 64;
		}
		else
		{
			global.foeWindowYTarget = 0;
		}
		
		// Draw extra window
		if(global.dreamBoyState == 3)
		{
			global.extraSpriteYTarget = 80;
		}
		else
		{
			global.extraSpriteYTarget = 0;
		}
		
		if(global.itemWindowY != global.itemWindowYTarget) global.itemWindowY = lerp(global.itemWindowY,global.itemWindowYTarget,0.2);	
		if(global.foeWindowY != global.foeWindowYTarget) global.foeWindowY = lerp(global.foeWindowY,global.foeWindowYTarget,0.2);	
		if(global.extraSpriteY != global.extraSpriteYTarget) global.extraSpriteY = lerp(global.extraSpriteY,global.extraSpriteYTarget,0.2);
		
		// Draw
		draw_sprite(sItemWindow,0,87,132-global.itemWindowY);
		if(global.itemsFound[global.currentItem]) draw_sprite(global.dbItemSprites[global.currentItem],0,97,147-global.itemWindowY);
		else draw_sprite(sQuestion,0,97,147-global.itemWindowY);
		
		draw_sprite(sFoeWindow,0,87,132-global.foeWindowY);
		if(global.enemiesFound[global.currentFoe]) draw_sprite(global.dbFoeBigSprites[global.currentFoe],image_index/7.5,102,154-global.foeWindowY);
		else draw_sprite(sQuestion,image_index/7.5,98,150-global.foeWindowY);
		
		draw_sprite(global.extraSprites[0],0,88,125-global.extraSpriteY);
		
		// Draw item and foe info
		draw_set_font(fDreamBoy);
		draw_set_color(#5a5f92);
		
		draw_set_halign(fa_left);
		if(global.itemsFound[global.currentItem]) draw_text(91,132-global.itemWindowY,global.itemFileNames[global.currentItem]);
		else draw_text(91,132-global.itemWindowY,"FILE NOT FOUND");
		draw_set_halign(fa_center);
		if(global.itemsFound[global.currentItem]) draw_text_ext(139, 142-global.itemWindowY, global.itemFileDescriptions[global.currentItem], 5, 47);
		else draw_text_ext(139, 142-global.itemWindowY, "ASCEND HIGHER TO DISCOVER THIS ITEM", 5, 47);
		draw_set_halign(fa_left);
		
		draw_set_halign(fa_left);
		if(global.enemiesFound[global.currentFoe]) draw_text(91,132-global.foeWindowY,global.foeFileNames[global.currentFoe]);
		else draw_text(91,132-global.foeWindowY,"FILE NOT FOUND");
		draw_set_halign(fa_center);
		if(global.enemiesFound[global.currentFoe]) draw_text_ext(141, 142-global.foeWindowY, global.foeFileDescriptions[global.currentFoe], 5, 43);
		else draw_text_ext(141, 142-global.foeWindowY,"ASCEND HIGHER TO DISCOVER THIS FOE", 5, 43);
		draw_set_halign(fa_left);
		
		// Reset drawing
		draw_set_color($6D454D);
		draw_set_font(fUI);
		
		// Draw UI bars
		if(global.UIBarY != global.UIBarYTarget) global.UIBarY = lerp(global.UIBarY,global.UIBarYTarget,0.3);
		
		draw_sprite(sStampOSUITop,global.dreamBoyState,86,29 + global.UIBarY);
		draw_sprite(sStampOSUIBottom,0,86,114 - global.UIBarY);
		
	}
	
	// Draw additional dream boy outline to cover up the overscan
	draw_sprite(sDreamBoyOutline,global.dreamBoyOn,48,global.dreamBoyY);
}