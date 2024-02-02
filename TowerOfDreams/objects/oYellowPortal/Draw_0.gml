/// @description Draw lock if needed

draw_self();

if(!global.floor2Completed) 
{
	draw_sprite(sLock,0,x+4,y+4);
	
	// Draw unlock criteria
	if(instance_exists(oPlayer))
	{
		// Check if player is underneath
		if(oPlayer.x < x + 16 && oPlayer.x > x)
		{
			draw_set_halign(fa_center);
			draw_text(x+8,y-56,"Reach Floor 3 To Unlock");
			draw_set_halign(fa_left);
		}
	}
}