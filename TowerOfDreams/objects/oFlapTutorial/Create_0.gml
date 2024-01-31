/// @description Init

event_inherited();

if(global.controller == 2 && !gamepad_is_connected(0))
{
	sprite_index = sFlapControllerPS;	
}
else if(global.controller == 1 || global.controller == 2)
{
	sprite_index = sFlapController;	
}
else
{
	sprite_index = sFlap;	
}