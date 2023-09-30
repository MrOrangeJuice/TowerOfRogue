/// @description Init

event_inherited();

hp = 2;
hsp = 0.5;

image_xscale = dir;

// Spawn for hard mode
if(global.hardMode && !elite)
{
	hardEnemy = instance_create_layer(x,y,"Enemies",oFlyingEnemyElite);
	hardEnemy.dir = dir;
	instance_destroy();
}