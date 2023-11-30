/// @description Init

event_inherited();

if(global.controller == 2)
{
	sprite_index = sSellItemControllerPS;	
}
else if(global.controller == 1)
{
	sprite_index = sSellItemController;	
}
else
{
	sprite_index = sSellItem;	
}