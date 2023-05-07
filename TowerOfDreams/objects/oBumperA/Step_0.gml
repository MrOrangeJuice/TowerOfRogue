/// @description Update

event_inherited();

if(!global.paused)
{
	if(global.bumpersSwitching) image_speed = 1;
}
else
{
	image_speed = 0;
}

if(global.bumperSwitch)
{
	canHit = true;
}
else
{
	canHit = false;
}