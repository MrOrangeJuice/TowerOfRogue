/// @description Swap to on/off

event_inherited();

if(sprite_index == sBumperA)
{
	sprite_index = sBumperAOff;	
}
else if(sprite_index == sBumperAOff)
{
	sprite_index = sBumperA;	
}