/// @description Update

event_inherited();

if(!global.paused && !global.hitStop)
{
	vsp += grv;
	x += (xSpeed * dir);
	y += vsp;
	image_speed = 1;
}
else
{
	image_speed = 0;	
}