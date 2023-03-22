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
}
else
{
	image_speed = 0;
}