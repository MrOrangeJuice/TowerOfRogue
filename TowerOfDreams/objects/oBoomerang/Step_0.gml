/// @description Update

if(!global.paused && !global.hitStop)
{
	xSpeed -= 0.075;
	if(xSpeed < 0)
	{
		dmgMultiplier = 1;
	}
	x += (xSpeed * dir);
	if(dir == 1)
	{
		image_speed = 1;
	}
	else
	{
		image_speed = -1;	
	}
}
else
{
	image_speed = 0;	
	alarm[0]++;
}