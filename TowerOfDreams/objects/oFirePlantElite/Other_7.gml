/// @description End fire animation

if(sprite_index == sFirePlantEliteFlame)
{
	sprite_index = sFirePlantElite;
	alarm[0] = room_speed * fireGap;
}