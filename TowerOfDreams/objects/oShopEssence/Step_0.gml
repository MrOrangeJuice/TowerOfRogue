/// @description Change color if player already has essence

if(global.essence == paletteNum)
{
	sprite_index = sPlayerEssence;
}
else
{
	sprite_index = regSprite;
}

if(!global.paused)
{
	image_speed = 1;
}
else
{
	image_speed = 0;
}