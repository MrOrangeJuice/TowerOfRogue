/// @description Update

if(!global.paused)
{
	image_speed = 1;
	
	vsp += grv;
	// Vertical Collision
	if (place_meeting(x,y+vsp,oWall))
	{
		while (!place_meeting(x,y+sign(vsp),oWall))
		{
			y = y + sign(vsp);
		}
		vsp = 0;
	}
	
	y = y + vsp;
	
	if(hsp > 0)
	{
		hsp -= 0.01;	
	}
	else if(hsp < 0)
	{
		hsp += 0.01;
	}
	
	// Horizontal Collision
	if (place_meeting(x+hsp,y,oWall))
	{
		while (!place_meeting(x+sign(hsp),y,oWall))
		{
			x = x + sign(hsp);
		}
		hsp = 0;
	}
	x = x + hsp;
}
else
{
	image_speed = 0;
}