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
	mask_index = sBlockA;
}
else
{
	canTouch = false;
	mask_index = sEmpty;
}