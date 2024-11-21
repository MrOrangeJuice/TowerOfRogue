/// @description Move box


if(!moveBack)
{
	// Move left
	if(xOffset < 72)
	{
		xOffset += 2;	
	}
	else
	{
		if(!hold)
		{
			hold = true;
			alarm[0] = room_speed * 2;
		}
	}
}
else
{
	if(xOffset > 0)
	{
		xOffset -= 2;	
	}
	else
	{
		instance_destroy();	
	}
}