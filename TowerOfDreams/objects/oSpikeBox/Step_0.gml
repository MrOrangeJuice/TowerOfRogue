/// @description Move
if(!global.paused)
{
	vsp = vsp + grv;

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
	
	// Conveyer belt
	if(place_meeting(x,y+1,oLeftConveyer))
	{
		x += 0.5;
	}
	if(place_meeting(x,y+1,oRightConveyer))
	{
		x -= 0.5;
	}
}