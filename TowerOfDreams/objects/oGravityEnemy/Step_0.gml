/// @description Move

event_inherited();

if(!global.paused && !global.hitStop)
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
		if(!hitWall)
		{
			alarm[0] = room_speed * 1;	
			hitWall = true;
		}
	}
	y = y + vsp;
}
else
{
	image_speed = 0;
	// Extend alarm
	alarm[0]++;
}