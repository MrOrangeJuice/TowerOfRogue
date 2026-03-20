/// @description Reset

if(sprite_index == sWizardSpawn)
{
	sprite_index = sWizard;
	alarm[0] = room_speed * 1;
	spawned = false;
}