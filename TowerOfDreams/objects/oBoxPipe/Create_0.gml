/// @description Init

alarm[0] = room_speed * 3;
delayed = false;
if (delay > 0) 
{
	alarm[1] = room_speed * delay;
	delayed = true;
}