/// @description Update

if(!global.paused)
{
	image_speed = 1;
}
else
{
	image_speed = 0;	
}

if(instance_exists(oPlayer))
{
	x = oPlayer.x;
	y = oPlayer.y - 4;
}