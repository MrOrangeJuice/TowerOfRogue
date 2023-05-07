/// @description Swap to on/off

event_inherited();

if(sprite_index == sBumperA)
{
	sprite_index = sBumperAOff;	
	global.bumpersSwitching = false;
}
else if(sprite_index == sBumperAOff)
{
	sprite_index = sBumperA;
	global.bumpersSwitching = false;
}