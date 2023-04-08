/// @description Swap to on/off

event_inherited();

if(sprite_index == sBumperB)
{
	sprite_index = sBumperBOff;	
}
else if(sprite_index == sBumperBOff)
{
	sprite_index = sBumperB;	
}