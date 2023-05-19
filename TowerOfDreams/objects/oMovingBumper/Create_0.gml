/// @description Init

event_inherited();
xDiff = 0;
yDiff = 0;
canMove = false;
if(delay > 0)
{
	alarm[0] = room_speed * delay;
}
else
{
	canMove = true;	
}