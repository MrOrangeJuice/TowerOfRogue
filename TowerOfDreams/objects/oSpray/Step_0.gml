/// @description Fly Forward

kunaiSpeed = 3 * initialDir;
kunaiYSpeed = 3 * initialYDir;

if(!global.paused)
{
	x += kunaiSpeed;
	y += kunaiYSpeed;
}