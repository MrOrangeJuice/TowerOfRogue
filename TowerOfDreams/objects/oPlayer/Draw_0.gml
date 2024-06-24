/// @description Draw

/*
if(rage)
{
	image_blend = make_color_rgb(211,133,149);
	draw_self();
}
else
{
	image_blend = c_white;
	draw_self();
}
*/

if(invulnerable > 0)
{
	invulnerable--;
	image_alpha = 0.5;
	draw_self();
	shader_reset();	
}
else
{
	image_alpha = 1;	
	draw_self();
	shader_reset();	
}

// Draw block target
if(global.item == 30)
{
	// Set targets
	if(place_meeting(x,y+8,oWall))
	{
		// Right facing
		if(image_xscale >= 0)
		{
			blockTargetX = x + blockOffset + (hsp*2);
			blockTargetY = y;
		}
		// Left facing
		else if(image_xscale < 0)
		{
			blockTargetX = x - blockOffset + (hsp*2);
			blockTargetY = y;
		}
	}
	// Down
	else
	{
		blockTargetX = x + (hsp*2);
		blockTargetY = y + blockOffset + (vsp*2);
	}
	
	// lerp and draw target
	blockX = lerp(blockX,blockTargetX,0.3);
	blockY = lerp(blockY,blockTargetY,0.3);
	
	blockCursorCooldown--;
	if(blockCursorCooldown < 0)
	{
		// Draw cursor as a different color if enemy is blocking placement
		if(!place_meeting(blockTargetX,blockTargetY,oEnemy))
		{
			draw_sprite(sBlockTarget,0,blockX,blockY);
		}
		else
		{
			draw_sprite(sBlockTarget,1,blockX,blockY);
		}
	}
}