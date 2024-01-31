/// @description Init

event_inherited();

if(global.controller == 2 && !gamepad_is_connected(0))
{
	sprite_index = sEggControllerPS;	
}
else if(global.controller == 1 || global.controller == 2)
{
	sprite_index = sEggController;	
}
else
{
	sprite_index = sEggT;	
}