/// @description Swap to on/off

image_speed = 0;

if(sprite_index == sBlockA)
{
	sprite_index = sBlockAOff;	
	global.bumpersSwitching = false;
}
else if(sprite_index == sBlockAOff)
{
	sprite_index = sBlockA;
	global.bumpersSwitching = false;
}