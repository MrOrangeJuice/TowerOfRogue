/// @description Fly Forward

image_xscale = initialDir;
if(!global.paused)
{
	x += (kunaiSpeed*initialDir);
}
else
{
	alarm[0]++;
}