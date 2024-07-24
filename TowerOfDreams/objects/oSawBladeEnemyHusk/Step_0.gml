/// @description Move

event_inherited();

if(!global.paused && !global.hitStop)
{
	image_speed = 1;

	// If no ground in front of you change direction
	if (!place_meeting(x+(turnCheck*xDir),y,oWall) && xDir != 0)
	{
		xDir = 0;
		// Determine what y direction to go
		if(place_meeting(x,y+turnCheck,oWall)) yDir = 1;
		else if(place_meeting(x,y-turnCheck,oWall)) yDir = -1;
	}
	
	if (!place_meeting(x,y+(turnCheck*yDir),oWall) && yDir != 0)
	{
		yDir = 0;
		// Determine what x direction to go
		if(place_meeting(x+turnCheck,y,oWall)) xDir = 1;
		else if(place_meeting(x-turnCheck,y,oWall)) xDir = -1;
	}
	
	// Reverse direction if you hit a wall
	// Horizontal Collision
	// If wall you're on is below you
	if(place_meeting(x,y+14,oWall) && xDir != 0)
	{
		if (place_meeting(x,y-14,oWall) && xDir != 0)
		{
			xDir *= -1;
		}
	}
	// If wall you're on is above you
	else if(place_meeting(x,y-14,oWall) && xDir != 0)
	{
		if (place_meeting(x,y+14,oWall) && xDir != 0)
		{
			xDir *= -1;
		}
	}
	
	// Vertical Collision
	if(place_meeting(x+14,y,oWall) && yDir != 0)
	{
		if (place_meeting(x-14,y,oWall) && yDir != 0)
		{
			yDir *= -1;
		}
	}
	else if(place_meeting(x-14,y,oWall) && yDir != 0)
	{
		if (place_meeting(x+14,y,oWall) && yDir != 0)
		{
			yDir *= -1;
		}
	}


	x += (xDir * initialSpeed);
	y += (yDir * initialSpeed);
}
else
{
	image_speed = 0;	
}