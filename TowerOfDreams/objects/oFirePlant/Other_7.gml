/// @description End fire animation

if(sprite_index == sFirePlantFlame)
{
	sprite_index = sFirePlant;
	alarm[0] = room_speed * fireGap;
}