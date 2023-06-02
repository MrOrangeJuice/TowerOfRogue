event_inherited();

if(!global.paused && !global.hitStop)
{
	image_speed = 1;
}
else
{
	image_speed = 0;
	// Extend alarm
	alarm[0]++;
	alarm[1]++;
}