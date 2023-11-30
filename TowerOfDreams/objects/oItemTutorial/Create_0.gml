/// @description Init

event_inherited();

if(global.controller == 2)
{
	sprite_index = sUseItemControllerPS;	
}
else if(global.controller == 1)
{
	sprite_index = sUseItemController;	
}
else
{
	sprite_index = sUseItem;	
}