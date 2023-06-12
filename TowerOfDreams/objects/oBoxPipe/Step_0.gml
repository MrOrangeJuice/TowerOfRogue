/// @description Pause

if(!global.paused)
{
	if(!delayed)
	{
		image_speed = 1;
	}	
	else
	{
		image_speed = 0;	
	}
}
else
{
	image_speed = 0;
	alarm[0]++;
	alarm[1]++;
}