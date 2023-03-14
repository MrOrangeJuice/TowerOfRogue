/// @description Init

event_inherited();

spawned = false;
image_speed = 0;

if(global.controller)
{
	sprite_index = sUseItemControllerFadeIn;	
}
else
{
	sprite_index = sUseItemFadeIn;	
}