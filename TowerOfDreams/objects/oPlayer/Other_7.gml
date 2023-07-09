/// @description Insert description here
// You can write your code in this editor


if (sprite_index == sPlayerLand)
{
	landing = false;
}

if (sprite_index == sPlayerSlashSmall)
{
	// Set slash cooldown
	canSlash = false;
	alarm[2] = room_speed * 0.2;
	slashing = false;
	hasSlashJumped = false;
}

if (sprite_index == sPlayerSlashDouble)
{
	// Set slash cooldown
	canSlash = false;
	alarm[2] = room_speed * 0.2;
	slashing = false;
	hasSlashJumped = false;
	chargeBounces = 0;
	instance_destroy(particles);
}