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
	
	if(place_meeting(x,y,oLava) && !alarmStarted)
	{
		alarmStarted = true;
		grv = 0.005;
		vsp = 0;
		alarm[0] = room_speed * 3;
		for(i = 0; i < 20; i++)
		{
			instance_create_layer(x+irandom_range(0,16),y+8,"UI",oLavaBit);	
		}
	}
	else if(place_meeting(x,y,oLava))
	{
		if(irandom_range(1,4) == 2) instance_create_layer(x+irandom_range(0,16),y+8,"UI",oLavaBit);	
	}
}