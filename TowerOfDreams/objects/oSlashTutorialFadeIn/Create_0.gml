/// @description Init

event_inherited();

spawned = false;
image_speed = 0;

if(global.controller == 1)
{
	sprite_index = sSlashControllerFadeIn;	
}
else
{
	sprite_index = sSlashFadeIn;	
}
