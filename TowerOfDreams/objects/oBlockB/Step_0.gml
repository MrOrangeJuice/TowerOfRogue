/// @description Update

if(!global.paused)
{
	if(global.bumpersSwitching) image_speed = 1;
}
else
{
	image_speed = 0;
}

if(!global.bumperSwitch)
{
	canHit = true;
	mask_index = sBlockB;
}
else
{
	canHit = false;
	mask_index = sEmpty;
}