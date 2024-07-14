/// @description Fly Forward

image_xscale = initialDir;
if(!global.paused)
{
	x += (kunaiSpeed*initialDir);
	image_speed = 1;
}
else
{
	image_speed = 0;
	alarm[0]++;
}