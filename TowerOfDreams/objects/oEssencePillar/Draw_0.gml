// Draw item name


draw_set_color($B1D7F0);
draw_set_halign(fa_center);

if(instance_exists(oPlayer))
{
	// Check if player is underneath
	if((oPlayer.x < x + 24 && oPlayer.x > x - 8) && (oPlayer.y < y + 24 && oPlayer.y > y - 56))
	{
		if(!prevBought)
		{
			draw_text(x+8,y-48,armorName);
			draw_text(x+8,y-40,armorDesc);
			draw_text(x+8,y-32,itemUnlock);
		}
		else
		{
			if(paletteNum == global.essence)
			{
				draw_text(x+8,y-48,"Dream Essence");
				draw_text(x+8,y-40,"The vanilla experience");
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