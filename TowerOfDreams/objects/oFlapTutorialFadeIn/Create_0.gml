/// @description Init

event_inherited();

spawned = false;
image_speed = 0;

if(global.controller == 2 && !gamepad_is_connected(0))
{
	sprite_index = sFlapControllerPSFadeIn;	
}
else if(global.controller == 1 || global.controller == 2)
{
	sprite_index = sFlapControllerFadeIn;	
}
else
{
	sprite_index = sFlapFadeIn;	
}
