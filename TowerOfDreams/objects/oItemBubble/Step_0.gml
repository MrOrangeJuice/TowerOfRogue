/// @description Float

if(!global.paused)
{
	image_speed = 1;
	vsp += (acceleration * dir);
	if(vsp > 0.3 || vsp < -0.3)
	{
		dir *= -1;	
	}
	y += vsp;
}
else
{
	image_speed = 0;	
}