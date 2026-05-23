/// @description Pause
if(!global.paused)
{
	image_speed = 1;
	particleSpeed -= 0.1;
	speed = particleSpeed;
}
else
{
	speed = 0;
	image_speed = 0;	
}