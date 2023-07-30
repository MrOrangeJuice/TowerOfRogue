/// @description Move and collide

event_inherited();

if(!global.paused && !global.hitStop)
{
	image_speed = 1;
	image_xscale = -dir;
	vsp += grv;

	// Horizontal Collision
	if (place_meeting(x+(hsp*dir),y,oWall))
	{
		dir *= -1;
	}

	// Vertical Collision
	if (place_meeting(x,y+vsp,oWall))
	{
		while (!place_meeting(x,y+sign(vsp),oWall))
		{
			y = y + sign(vsp);
		}
		vsp = 0;
	}

	// Vertical Collision
	// If no ground below you reverse direction
	/*
	if (!place_meeting(x+(16*dir),y+1,oWall))
	{
		dir *= -1;
		vsp = 0;
	}
	*/


	x = x + (hsp * dir);
	y = y + vsp;
}
else
{
	image_speed = 0;	
}