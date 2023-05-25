/// @description Move up

if(!global.paused)
{
	y = y - 0.1;
	if(dir == -1 && hsp = -0.2)
	{
		dir = 1;
	}
	if(dir == 1 && hsp = 0.2)
	{
		dir = -1;	
	}

	hsp += 0.02 * dir;
	x += hsp;

	// Pop immediately if out of lava
	if(!place_meeting(x,y-10,oLava) && image_index != 1)
	{		
		image_index = 1;
		alarm[1] = room_speed * 0.25;
	}
}
else
{
	alarm[0]++;
	alarm[1]++;
}