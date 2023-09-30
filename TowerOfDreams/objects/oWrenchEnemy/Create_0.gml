/// @description Init

event_inherited();

alarm[0] = room_speed * (1 + delay);
image_xscale = dir * -1;
hp = 2;

// Spawn for hard mode
if(global.hardMode && object_index != Object179)
{
	instance_change(oWrenchEnemyElite,true);
}