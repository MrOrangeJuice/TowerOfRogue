/// @description Swap to on/off

image_speed = 0;

if(sprite_index == sBlockB)
{
	sprite_index = sBlockBOff;	
	global.bumpersSwitching = false;
}
else if(sprite_index == sBlockBOff)
{
	sprite_index = sBlockB;	
	global.bumpersSwitching = false;
}