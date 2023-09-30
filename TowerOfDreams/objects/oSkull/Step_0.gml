/// @description Update
if(!global.paused)
{
	image_speed = 1;
	if(global.hardMode) sprite_index = sSkullNightmare;
	else sprite_index = sSkull;
}
else
{
	image_speed = 0;
}