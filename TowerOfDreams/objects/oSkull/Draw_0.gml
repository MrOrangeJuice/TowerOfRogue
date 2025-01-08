/// @description Draw difficulty

// Draw item name
if(instance_exists(oPlayer))
{
	// Check if player is underneath
	if(oPlayer.x < x + 32 && oPlayer.x > x)
	{
		draw_set_halign(fa_center);
		if(global.hardMode) 
        {
            draw_set_color($6D454D);
            draw_text(x+17,y-24,"Difficulty: Nightmare");
            draw_text(x+15,y-24,"Difficulty: Nightmare");
            draw_text(x+16,y-23,"Difficulty: Nightmare");
            draw_text(x+16,y-25,"Difficulty: Nightmare");
            draw_text(x+17,y-14,"A true challenge");
            draw_text(x+15,y-14,"A true challenge");
            draw_text(x+16,y-13,"A true challenge");
            draw_text(x+16,y-15,"A true challenge");
            
            draw_set_color($B1D7F0);
            draw_text(x+16,y-24,"Difficulty: Nightmare");
            draw_text(x+16,y-14,"A true challenge");
        }
		else 
        {
            draw_set_color($6D454D);
            draw_text(x+17,y-24,"Difficulty: Daydream");
            draw_text(x+15,y-24,"Difficulty: Daydream");
            draw_text(x+16,y-23,"Difficulty: Daydream");
            draw_text(x+16,y-25,"Difficulty: Daydream");
            draw_text(x+17,y-14,"The intended experience");
            draw_text(x+15,y-14,"The intended experience");
            draw_text(x+16,y-13,"The intended experience");
            draw_text(x+16,y-15,"The intended experience");
            
            draw_set_color($B1D7F0);
            draw_text(x+16,y-24,"Difficulty: Daydream");
            draw_text(x+16,y-14,"The intended experience");
        }
		draw_set_halign(fa_left);
	}
}

// Reset color
draw_set_color($6D454D);
draw_self();