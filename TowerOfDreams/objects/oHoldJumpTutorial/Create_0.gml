/// @description Init

event_inherited();

if(global.controller == 2)
{
	sprite_index = sHoldJumpControllerPS;	
}
else if(global.controller == 1)
{
	sprite_index = sHoldJumpController;	
}
else
{
	sprite_index = sHoldJump;	
}