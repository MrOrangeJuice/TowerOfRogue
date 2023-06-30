/// @description Update

if(!global.paused && !global.hitStop)
{
	vsp += grv;
	x += (xSpeed * dir);
	y += vsp;
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