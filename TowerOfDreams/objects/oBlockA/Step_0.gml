/// @description Update

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
	canTouch = true;
}
else
{
	canTouch = false;
}