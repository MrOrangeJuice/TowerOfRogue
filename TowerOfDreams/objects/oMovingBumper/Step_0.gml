/// @description Move

event_inherited();

if(!global.paused && canMove)
{
	x += dir * moveSpeed;
	xDiff += dir * moveSpeed;
	y += yDir * moveSpeed;
	yDiff += yDir * moveSpeed;

	if(xDiff > range)
	{
		dir *= -1;	
	}

	if(xDiff < 0)
	{
		dir *= -1;	
	}
	
	if(yDiff > yRange)
	{
		yDir *= -1;	
	}

	if(yDiff < 0)
	{
		yDir *= -1;	
	}
}
else
{
	
}