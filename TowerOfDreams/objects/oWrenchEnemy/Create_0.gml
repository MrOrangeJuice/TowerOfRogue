/// @description Init

event_inherited();

alarm[0] = room_speed * (1 + delay);
image_xscale = dir * -1;
hp = 2;

// Spawn for hard mode
if(global.hardMode && object_index != oWrenchEnemyElite)
{
	instance_change(oWrenchEnemyElite,false);
	hp = 4;
	elite = true;
}