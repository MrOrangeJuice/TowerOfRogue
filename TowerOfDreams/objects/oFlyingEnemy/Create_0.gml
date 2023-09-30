/// @description Init

event_inherited();

hp = 2;
hsp = 0.5;

image_xscale = dir;

// Spawn for hard mode
if(global.hardMode && object_index != oFlyingEnemyElite)
{
	instance_change(oFlyingEnemyElite,true);
}