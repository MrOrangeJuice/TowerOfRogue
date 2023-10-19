/// @description Get Input

if(global.controller)
{
	sprite_index = sSellItemControllerFadeIn;	
}
else
{
	sprite_index = sSellItemFadeIn;	
}
if(!global.paused)
{
	if (spawned) image_speed = 1;
}
else
{
	if (spawned) image_speed = 0;
}