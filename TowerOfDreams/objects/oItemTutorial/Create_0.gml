/// @description Init

event_inherited();

if(global.controller == 2 && !gamepad_is_connected(0))
{
	sprite_index = sUseItemControllerPS;	
}
else if(global.controller == 1 || global.controller == 2)
{
	sprite_index = sUseItemController;	
}
else
{
	sprite_index = sUseItem;	
}