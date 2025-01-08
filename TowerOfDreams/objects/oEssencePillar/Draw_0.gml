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
            draw_set_color($6D454D);
            draw_text(x+9,y-52,armorName);
            draw_text(x+7,y-52,armorName);
            draw_text(x+8,y-51,armorName);
            draw_text(x+8,y-53,armorName);
            draw_text(x+9,y-44,armorDesc);
            draw_text(x+7,y-44,armorDesc);
            draw_text(x+8,y-43,armorDesc);
            draw_text(x+8,y-45,armorDesc);
            draw_text(x+9,y-32,itemUnlock);
            draw_text(x+7,y-32,itemUnlock);
            draw_text(x+8,y-31,itemUnlock);
            draw_text(x+8,y-33,itemUnlock);
            
            draw_set_color($B1D7F0);
			draw_text(x+8,y-52,armorName);
			draw_text(x+8,y-44,armorDesc);
			draw_text(x+8,y-32,itemUnlock);
		}
		else
		{
			if(paletteNum == global.essence)
			{
                draw_set_color($6D454D);
                draw_text(x+9,y-52,"Dream Essence"); 
                draw_text(x+7,y-52,"Dream Essence"); 
                draw_text(x+8,y-51,"Dream Essence"); 
                draw_text(x+8,y-53,"Dream Essence"); 
                draw_text(x+9,y-44,"The vanilla experience");
                draw_text(x+7,y-44,"The vanilla experience");
                draw_text(x+8,y-43,"The vanilla experience");
                draw_text(x+8,y-45,"The vanilla experience");
                
                draw_set_color($B1D7F0);
				draw_text(x+8,y-52,"Dream Essence");
				draw_text(x+8,y-44,"The vanilla experience");
				draw_sprite(sArrow,0,x+4,y-56);
			}
			else
			{
                draw_set_color($6D454D);
                draw_text(x+9,y-52,armorName); 
                draw_text(x+7,y-52,armorName); 
                draw_text(x+8,y-51,armorName); 
                draw_text(x+8,y-53,armorName); 
                draw_text(x+9,y-44,armorDesc);
                draw_text(x+7,y-44,armorDesc);
                draw_text(x+8,y-43,armorDesc);
                draw_text(x+8,y-45,armorDesc);
                
                draw_set_color($B1D7F0);
				draw_text(x+8,y-52,armorName);
				draw_text(x+8,y-44,armorDesc);
				draw_sprite(sArrow,0,x+4,y-56);	
			}
		}
	}
}

draw_set_color($6D454D);
draw_self();