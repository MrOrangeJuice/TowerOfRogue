/// @description Init

event_inherited();

if(global.controller == 2)
{
	sprite_index = sJumpControllerPS;	
}
if(global.controller == 1)
{
	sprite_index = sJumpController;	
}
else
{
	sprite_index = sJump;	
}