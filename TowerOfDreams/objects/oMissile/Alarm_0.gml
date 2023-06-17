/// @description Determine direction

// Determine direction and sprite
if(instance_exists(oPlayer))
{
	// Left and right
	if(oPlayer.y - 8 < y && y < oPlayer.y + 8)
	{
		if(oPlayer.x <= x)
		{
			dir = "left";
		}
		else if(oPlayer.x > x)
		{
			dir = "right";
		}
	}
	// Up
	else if(oPlayer.y < y)
	{
		if(oPlayer.x - 8 < x && x < oPlayer.x + 8)
		{
			dir = "up";		
		}
		else if(oPlayer.x < x)
		{
			dir = "upleft";
		}
		else if(oPlayer.x > x)
		{
			dir = "upright";
		}
	}
	// Down
	else if(oPlayer.y > y)
	{
		if(oPlayer.x - 8 < x && x < oPlayer.x + 8)
		{
			dir = "down";		
		}
		else if(oPlayer.x < x)
		{
			dir = "downleft";
		}
		else if(oPlayer.x > x)
		{
			dir = "downright";
		}
	}
}

alarm[0] = room_speed * 0.2;