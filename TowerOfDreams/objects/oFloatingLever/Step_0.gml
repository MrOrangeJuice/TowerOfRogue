/// @description Update

if(green)
{
	sprite_index = sFloatingLeverGreen;
}
else
{
	sprite_index = sFloatingLeverPurple;
}

if(!global.paused)
{
	image_speed = 1;	
}
else
{
	image_speed = 0;	
}