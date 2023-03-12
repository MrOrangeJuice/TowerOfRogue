/// @description Move box


if(!moveBack)
{
	// Move up
	if(yOffset < 48)
	{
		yOffset += 2;	
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
	if(yOffset > 0)
	{
		yOffset -= 2;	
	}
	else
	{
		instance_destroy();	
	}
}