/// @description Check for collision

if(place_meeting(x,y,oPlayer))
{
	colliding = true;
}
else
{
	colliding = false;	
}

if(!global.paused)
{
	if(vsp > 0.2 || vsp < -0.2)
	{
		yAccel *= -1;	
	}
	vsp += yAccel;
	yOffset = yOffset + vsp;	
}
else
{
	
}