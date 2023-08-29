/// @description Insert description here
// You can write your code in this editor


if (sprite_index == landSprite)
{
	landing = false;
}

if (sprite_index == slashSprite)
{
	// Set slash cooldown
	canSlash = false;
	alarm[2] = room_speed * 0.2;
	slashing = false;
	hasSlashJumped = false;
}

if (sprite_index == doubleSlashSprite)
{
	// Set slash cooldown
	canSlash = false;
	alarm[2] = room_speed * 0.2;
	slashing = false;
	hasSlashJumped = false;
	chargeBounces = 0;
	instance_destroy(particles);
}