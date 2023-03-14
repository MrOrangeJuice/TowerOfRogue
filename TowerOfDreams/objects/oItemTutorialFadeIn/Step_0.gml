/// @description Get Input

if(global.controller)
{
	sprite_index = sUseItemControllerFadeIn;	
}
else
{
	sprite_index = sUseItemFadeIn;	
}
if(!global.paused)
{
	if (spawned) image_speed = 1;
}
else
{
	if (spawned) image_speed = 0;
}