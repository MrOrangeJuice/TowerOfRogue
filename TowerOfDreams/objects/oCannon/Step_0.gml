/// @description Fire

event_inherited();

if(!global.paused)
{
	image_speed = 1;
}
else
{
	image_speed = 0;	
	alarm[0] = room_speed * 1;
}