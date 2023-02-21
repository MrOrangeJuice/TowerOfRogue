/// @description Insert description here
// You can write your code in this editor


if (sprite_index == sPlayerLand)
{
	landing = false;
}

if (sprite_index == sPlayerSlash)
{
	// Set slash cooldown
	canSlash = false;
	alarm[2] = room_speed * 0.2;
	slashing = false;
	hasSlashJumped = false;
}