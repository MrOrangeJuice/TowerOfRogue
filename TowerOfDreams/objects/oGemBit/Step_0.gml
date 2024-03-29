/// @description Update

if(!global.paused)
{
	vsp += grv;
	y += vsp;
	speed = 1;
	image_speed = 1;
}
else
{
	image_speed = 0;
	speed = 0;
	alarm[0]++;
}	