/// @description Init

event_inherited();

if(global.controller == 1 || global.controller == 2)
{
	sprite_index = sJumpController;	
}
else
{
	sprite_index = sJump;	
}