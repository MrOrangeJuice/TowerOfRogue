/// @description Move

event_inherited();

if(!global.paused)
{
	x += dir;
	xDiff += dir;

	if(xDiff > range)
	{
		dir *= -1;	
	}

	if(xDiff < 0)
	{
		dir *= -1;	
	}
}
else
{
	
}