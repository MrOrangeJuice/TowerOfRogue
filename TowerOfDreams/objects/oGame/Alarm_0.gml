/// @description Switch arrows on and off

if(volumeArrows)
{
	volumeArrows = false;
}
else
{
	volumeArrows = true;
}
if(menuOption == 2 && options) 
{
	alarm[0] = room_speed * 0.33;
}
else
{
	alarm[0] = -1;
	volumeArrows = true;
}