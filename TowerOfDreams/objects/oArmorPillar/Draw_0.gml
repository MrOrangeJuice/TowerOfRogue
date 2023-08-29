// Draw item name


draw_set_color($B1D7F0);
draw_set_halign(fa_center);
if(!prevBought) draw_text(x+8,y-32,itemPrice); 

if(instance_exists(oPlayer))
{
	// Check if player is underneath
	if(oPlayer.x < x + 24 && oPlayer.x > x - 8)
	{
		if(!prevBought)
		{
			draw_text(x+8,y-48,armorName);
			draw_text(x+8,y-40,armorDesc);
			if(global.overallCoins >= itemPrice) draw_sprite(sArrow,0,x+4,y-52);
		}
		else
		{
			if(paletteNum == global.palette)
			{
				draw_text(x+8,y-48,"Dream Mail");
				draw_text(x+8,y-40,"A Classic");
				draw_sprite(sArrow,0,x+4,y-52);
			}
			else
			{
				draw_text(x+8,y-48,armorName);
				draw_text(x+8,y-40,armorDesc);
				draw_sprite(sArrow,0,x+4,y-52);	
			}
		}
	}
}

draw_set_color($6D454D);
draw_self();