/// @description Swap to on/off

event_inherited();

if(sprite_index == sBumperB)
{
	sprite_index = sBumperBOff;	
	global.bumpersSwitching = false;
}
else if(sprite_index == sBumperBOff)
{
	sprite_index = sBumperB;	
	global.bumpersSwitching = false;
}