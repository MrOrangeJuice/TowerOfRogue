/// @description Init

event_inherited();

alarm[0] = room_speed * (1 + delay);
image_xscale = dir * -1;
hp = 2;

// Spawn for hard mode
if(global.hardMode && !elite)
{
	hardEnemy = instance_create_layer(x,y,"Enemies",oGroundEnemyElite);
	hardEnemy.dir = dir;
	hardEnemy.delay = delay;
	instance_destroy();
}