/// @description Update physics

event_inherited();

if(!global.paused && !global.hitStop)
{
	image_speed = 1;
	image_xscale = dir;

	// Horizontal Collision
	if (place_meeting(x+(hsp*dir),y,oWall))
	{
		dir *= -1;
	}

	x = x + (hsp * dir);
}
else
{
	image_speed = 0;	
}