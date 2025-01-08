// Draw item name


draw_set_color($B1D7F0);
draw_set_halign(fa_center);
if(!soldOut) 
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
		if(!soldOut)
		{
            draw_set_color($6D454D);
            draw_text(x+9,y-60,"Pipe Flea");
            draw_text(x+7,y-60,"Pipe Flea");
            draw_text(x+8,y-59,"Pipe Flea");
            draw_text(x+8,y-61,"Pipe Flea");
            draw_text(x+9,y-52,"Choose between " + string(3 + global.itemUpgrades) + " items");
            draw_text(x+7,y-52,"Choose between " + string(3 + global.itemUpgrades) + " items");
            draw_text(x+8,y-51,"Choose between " + string(3 + global.itemUpgrades) + " items");
            draw_text(x+8,y-53,"Choose between " + string(3 + global.itemUpgrades) + " items");
            draw_text(x+9,y-44,"at the start of a run");
            draw_text(x+7,y-44,"at the start of a run");
            draw_text(x+8,y-43,"at the start of a run");
            draw_text(x+8,y-45,"at the start of a run");
            
            draw_set_color($B1D7F0);
			draw_text(x+8,y-60,"Pipe Flea");
			draw_text(x+8,y-52,"Choose between " + string(3 + global.itemUpgrades) + " items");
			draw_text(x+8,y-44,"at the start of a run");
			if(global.overallCoins >= itemPrice) draw_sprite(sArrow,0,x+4,y-64);
		}
		else
		{
            draw_set_color($6D454D);
            draw_text(x+9,y-36,"SOLD OUT"); 
            draw_text(x+7,y-36,"SOLD OUT"); 
            draw_text(x+8,y-35,"SOLD OUT"); 
            draw_text(x+8,y-37,"SOLD OUT"); 
            
            draw_set_color($B1D7F0);
			draw_text(x+8,y-36,"SOLD OUT"); 
		}
	}
}

draw_set_color($6D454D);
draw_self();