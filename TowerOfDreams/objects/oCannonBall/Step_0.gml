/// @description Move

event_inherited();

if(!global.paused && !global.hitStop)
{
	x += (ballSpeed * dir);
}