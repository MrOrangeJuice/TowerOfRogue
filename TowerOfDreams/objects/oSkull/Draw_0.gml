/// @description Draw difficulty

// Draw item name
if(instance_exists(oPlayer))
{
	// Check if player is underneath
	if(oPlayer.x < x + 32 && oPlayer.x > x)
	{
		draw_set_halign(fa_center);
		if(global.hardMode) draw_text(x+16,y-16,"Difficulty: Nightmare");
		else draw_text(x+16,y-16,"Difficulty: Dream");
		draw_set_halign(fa_left);
	}
}

draw_self();