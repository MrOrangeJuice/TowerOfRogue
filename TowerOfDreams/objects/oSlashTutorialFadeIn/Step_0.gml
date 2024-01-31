/// @description Get Input

if(global.controller == 2 && !gamepad_is_connected(0))
{
	sprite_index = sSlashControllerPSFadeIn;	
}
else if(global.controller == 1 || global.controller == 2)
{
	sprite_index = sSlashControllerFadeIn;	
}
else
{
	sprite_index = sSlashFadeIn;	
}


if(!global.paused)
{
	if (spawned) image_speed = 1;
}
else
{
	if (spawned) image_speed = 0;
}