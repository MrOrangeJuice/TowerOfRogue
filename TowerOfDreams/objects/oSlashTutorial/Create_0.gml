/// @description Init

event_inherited();

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