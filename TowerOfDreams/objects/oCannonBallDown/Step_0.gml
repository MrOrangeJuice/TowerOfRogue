/// @description Move

event_inherited();

if(!global.paused && !global.hitStop)
{
	y += (ballSpeed * dir);
}