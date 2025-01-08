/// @description Draw lock if needed

draw_self();

if(!global.floor1Completed) 
{
	draw_sprite(sLock,0,x+4,y+4);
	
	// Draw unlock criteria
	if(instance_exists(oPlayer))
	{
		// Check if player is underneath
		if(oPlayer.x < x + 16 && oPlayer.x > x)
		{
			draw_set_halign(fa_center);
            draw_set_color($6D454D);
            draw_text(x+9,y-56,"Reach Floor 2 To Unlock");
            draw_text(x+7,y-56,"Reach Floor 2 To Unlock");
            draw_text(x+8,y-55,"Reach Floor 2 To Unlock");
            draw_text(x+8,y-57,"Reach Floor 2 To Unlock");
            
            draw_set_color($B1D7F0);
			draw_text(x+8,y-56,"Reach Floor 2 To Unlock");
			draw_set_halign(fa_left);
		}
	}
}

// Reset color
draw_set_color($6D454D);