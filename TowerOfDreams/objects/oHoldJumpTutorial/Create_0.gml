/// @description Init

event_inherited();

if(global.controller == 2 && !gamepad_is_connected(0))
{
	sprite_index = sHoldJumpControllerPS;	
}
else if(global.controller == 1 || global.controller == 2)
{
	sprite_index = sHoldJumpController;	
}
else
{
	sprite_index = sHoldJump;	
}