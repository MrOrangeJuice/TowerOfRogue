/// @description Get Input

if(global.controller == 1)
{
	sprite_index = sFlapControllerFadeIn;	
}
else
{
	sprite_index = sFlapFadeIn;	
}


if(!global.paused)
{
	if (spawned) image_speed = 1;
}
else
{
	if (spawned) image_speed = 0;
}