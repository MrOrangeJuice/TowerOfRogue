// Draw item name

draw_set_color($B1D7F0);
draw_set_halign(fa_center);

if(!prevBought) 
{
    draw_set_color($6D454D);
    draw_text(x+9,y-32,itemPrice);
    draw_text(x+7,y-32,itemPrice);
    draw_text(x+8,y-31,itemPrice);
    draw_text(x+8,y-33,itemPrice);
    
    draw_set_color($B1D7F0);
    draw_text(x+8,y-32,itemPrice);
} 

if(instance_exists(oPlayer))
{
	// Check if player is underneath
	if(oPlayer.x < x + 24 && oPlayer.x > x - 8)
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
            
            draw_set_color($B1D7F0);
			draw_text(x+8,y-52,armorName);
			draw_text(x+8,y-44,armorDesc);
			if(global.overallCoins >= itemPrice) draw_sprite(sArrow,0,x+4,y-56);
		}
		else
		{
			if(paletteNum == global.palette)
			{
                draw_set_color($6D454D);
                draw_text(x+9,y-52,"Dream Mail"); 
                draw_text(x+7,y-52,"Dream Mail"); 
                draw_text(x+8,y-51,"Dream Mail"); 
                draw_text(x+8,y-53,"Dream Mail"); 
                draw_text(x+9,y-44,"A Classic");
                draw_text(x+7,y-44,"A Classic");
                draw_text(x+8,y-43,"A Classic");
                draw_text(x+8,y-45,"A Classic");
                
                draw_set_color($B1D7F0);
				draw_text(x+8,y-52,"Dream Mail");
				draw_text(x+8,y-44,"A Classic");
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