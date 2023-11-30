/// @description Init

event_inherited();

spawned = false;
image_speed = 0;

if(global.controller == 2)
{
	sprite_index = sUseItemControllerPSFadeIn;	
}
else if(global.controller == 1)
{
	sprite_index = sUseItemControllerFadeIn;	
}
else
{
	sprite_index = sUseItemFadeIn;	
}