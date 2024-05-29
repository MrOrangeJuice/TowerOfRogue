o// Draw item name


draw_set_color($B1D7F0);
draw_set_halign(fa_center);
if(!soldOut) draw_text(x+8,y-32,itemPrice); 

if(instance_exists(oPlayer))
{
	// Check if player is underneath
	if(oPlayer.x < x + 24 && oPlayer.x > x - 8)
	{
		if(!soldOut)
		{
			draw_text(x+8,y-56,"Pipe Flea");
			draw_text(x+8,y-48,"Choose between " + string(3 + global.itemUpgrades) + " items");
			draw_text(x+8,y-40,"at the start of a run");
			if(global.overallCoins >= itemPrice) draw_sprite(sArrow,0,x+4,y-60);
		}
		else
		{
			draw_text(x+8,y-32,"SOLD OUT"); 
		}
	}
}

draw_set_color($6D454D);
draw_self();