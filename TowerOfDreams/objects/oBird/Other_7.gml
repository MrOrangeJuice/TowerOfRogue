/// @description End flapping

if(sprite_index == flap && flapping)
{
	flapping = false;
	sprite_index = idle;
}