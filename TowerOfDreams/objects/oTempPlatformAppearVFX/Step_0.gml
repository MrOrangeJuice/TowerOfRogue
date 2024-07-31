/// @description Pause
if(!global.paused)
{
	if(place_meeting(x,y,oPlayer))
	{
		image_index = 0;
		image_speed = 0;
	}
	image_speed = 1;
}
else
{
	image_speed = 0;	
}