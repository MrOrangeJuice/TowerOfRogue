/// @description Init

event_inherited();

spawned = false;
image_speed = 0;

if(global.controller == 2 && !gamepad_is_connected(0))
{
	sprite_index = sUseItemControllerPSFadeIn;	
}
else if(global.controller == 1 || global.controller == 2)
{
	sprite_index = sUseItemControllerFadeIn;	
}
else
{
	sprite_index = sUseItemFadeIn;	
}