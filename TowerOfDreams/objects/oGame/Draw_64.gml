/// @description Draw GUI

draw_set_font(fUI);

// Draw Pause Menu
if(global.paused)
{
	draw_sprite(sPauseMenu,menuOption,80,40);
}

// Draw Main Menu
if(room == rTitle)
{
	if (!options)
	{
		draw_sprite(sMainMenu,menuOption,80,76);
	}
	else
	{
		if(!deleted)
		{
			draw_sprite(sOptionsMenu,menuOption,80,76);
		}
		else
		{
			draw_sprite(sOptionsMenuDeletedSave,menuOption,80,76);	
		}
	}
}

// Draw HUD
if(room != rTitle)
{
	// Draw HUD Background
	draw_sprite(sHUD,0,1,1);
	
	healthTextScale = max(healthTextScale * .95, 1);
	healthToDraw = global.health;
	xMod = 0;
	// Generate healthbar
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
	
	// Draw Coins
	coinTextScale = max(coinTextScale * .95, 1);
	draw_set_halign(fa_left);
	draw_sprite_stretched(sGem,0,7,15,8*coinTextScale,8*coinTextScale);
	draw_text_transformed(17,11,global.coins,coinTextScale,coinTextScale,0);
	
	// Draw item box
	itemTextScale = max(itemTextScale * .95, 1);
	draw_sprite_stretched(sItemBox,0,40,1,16*itemTextScale,16*itemTextScale);
	
	// Draw item in box
	if(global.item != -1) draw_sprite_stretched(global.itemSprites[global.item],0,44,5,8*itemTextScale,8*itemTextScale);
}