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

// Draw Pause Menu
if(global.paused)
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
if(room != rTitle && room != rRunComplete)
{
	// Add spacing to HUD
	hudMod = 9 * (((global.maxHealth - 6) / 2) + global.armor);
	if(hudMod < 0) hudMod = 0;
	// Account for coins
	if(room == rHub)
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
	//draw_sprite(sHUD,0,1,1);
	draw_sprite(sHUDStart,0,1,1);
	draw_sprite_stretched(sHUDMiddle,0,9,1,22+hudMod,27);
	draw_sprite(sHUDEnd,0,31+hudMod,1);
	
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
		draw_sprite_stretched(sArmor,0,7 + (xMod * 9),6,8*armorTextScale,8*armorTextScale);
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
	if(global.item != -1) draw_sprite_stretched(global.itemSprites[global.item],0,44+hudMod,5,8*itemTextScale,8*itemTextScale);
	
	// Draw passive items
	passiveItemTextScale = max(passiveItemTextScale * .95, 1);
	for(i = 0; i < array_length(global.passiveItems); i++)
	{
		draw_sprite_stretched(global.passiveItemSprites[global.passiveItems[i]],0,58+(10*i)+hudMod,5,8*passiveItemTextScale,8*passiveItemTextScale);
	}
}