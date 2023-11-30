/// @description Init

event_inherited();

spawned = false;
image_speed = 0;

if(global.controller == 2)
{
	sprite_index = sSlashControllerPSFadeIn;	
}
else if(global.controller == 1)
{
	sprite_index = sSlashControllerFadeIn;	
}
else
{
	sprite_index = sSlash;	
}
