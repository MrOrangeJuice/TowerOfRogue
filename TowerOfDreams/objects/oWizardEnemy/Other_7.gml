/// @description Reset

if(sprite_index == spawn)
{
	sprite_index = idle;
	alarm[0] = room_speed * 1;
	spawned = false;
}