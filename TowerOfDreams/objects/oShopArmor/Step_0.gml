/// @description Change color is player is already wearing

if(global.palette == paletteNum)
{
	sprite_index = sPlayerHelmet;	
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