/// @description Init

event_inherited();

if(global.controller == 2)
{
	sprite_index = sSellItemControllerPSFadeIn;	
}
else if(global.controller == 1)
{
	sprite_index = sSellItemControllerFadeIn;	
}
else
{
	sprite_index = sSellItemFadeIn;	
}

// Create regular tutorial early if player already has an active item
if(global.item != -1)
{
	instance_create_layer(x,y,"Walls",oSellItemTutorial);
	instance_destroy();
}