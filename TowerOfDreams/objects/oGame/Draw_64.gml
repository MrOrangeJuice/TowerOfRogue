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
	draw_sprite(sPauseMenu,menuOption,80,40+UIOffset);
}

// Draw Main Menu
if(room == rTitle)
{
	if (!options)
	{
		draw_sprite(sMainMenu,menuOption,80,76+UIOffset);
	}
	else
	{
		if(!deleted)
		{
			draw_sprite(sOptionsMenu,menuOption,80,76+UIOffset);
		}
		else
		{
			draw_sprite(sOptionsMenuDeletedSave,menuOption,80,76+UIOffset);	
		}
	}
}

// Draw HUD
if(room != rTitle)
{
	// Add spacing to HUD
	hudMod = 9 * (((global.maxHealth - 6) / 2) + global.armor);
	if(hudMod < 0) hudMod = 0;
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
	draw_sprite_stretched(sGem,0,7,15,8*coinTextScale,8*coinTextScale);
	draw_text_transformed(17,11,global.coins,coinTextScale,coinTextScale,0);
	
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