/// @description Follow Player

event_inherited();

if(instance_exists(oPlayer))
{
	x = oPlayer.x;
	y = oPlayer.y - 8;
}