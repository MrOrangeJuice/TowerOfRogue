/// @description Init

event_inherited();

hp = 2;
hsp = 0.5;
grv = 0.15;
vsp = 0;

image_xscale = dir;

// Spawn for hard mode
if(global.hardMode && !elite)
{
	hardEnemy = instance_create_layer(x,y,"Enemies",oGroundEnemyElite);
	hardEnemy.dir = dir;
	instance_destroy();
}