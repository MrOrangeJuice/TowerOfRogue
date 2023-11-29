/// @description Move

event_inherited();

if(!global.paused && !global.hitStop)
{
	x += (ballSpeed * dir);
	image_xscale = dir;
	image_speed = 1;
}
else
{
	image_speed = 0;	
}