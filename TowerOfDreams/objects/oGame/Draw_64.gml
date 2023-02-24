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
				draw_sprite(sHeartUISmall,0,1 + (xMod * 9),1);	
				xMod++;
			}
			// Otherwise, draw a half heart
			else
			{
				draw_sprite(sHeartUISmall,1,1 + (xMod * 9),1);	
			}
		}
		else
		{
			// Draw an empty heart every other time
			if(i % 2 == 1)
			{
				draw_sprite(sHeartUISmall,2,1 + (xMod * 9),1);	
				xMod++;
			}
		}
		healthToDraw--;
	}
	
	// Draw Coins
	draw_set_halign(fa_left);
	draw_sprite(sGem,0,1,9);
	draw_text(11,5,global.coins);
}