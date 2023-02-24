/// @description Draw GUI

draw_set_font(fUI);

// Draw Pause Menu
if(global.paused)
{
	draw_sprite(sPauseMenu,pauseOption,80,40);
}

// Draw HUD
if(room != rTitle)
{
	// Draw HUD Background
	draw_sprite(sHUD,0,1,1);
	
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
				draw_sprite(sHeartUISmall,0,7 + (xMod * 9),7);	
				xMod++;
			}
			// Otherwise, draw a half heart
			else
			{
				draw_sprite(sHeartUISmall,1,7 + (xMod * 9),7);	
			}
		}
		else
		{
			// Draw an empty heart every other time
			if(i % 2 == 1)
			{
				draw_sprite(sHeartUISmall,2,7 + (xMod * 9),7);	
				xMod++;
			}
		}
		healthToDraw--;
	}
	
	// Draw Coins
	draw_set_halign(fa_left);
	draw_sprite(sGem,0,7,15);
	draw_text(17,11,global.coins);
}