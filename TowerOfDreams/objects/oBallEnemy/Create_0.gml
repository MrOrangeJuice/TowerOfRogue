/// @description Init

event_inherited();

hp = 2;
hsp = 1;
grv = 0.1;
vsp = 0;
airborne = false;
landing = false;

// Sprites
regularSprite = sBallEnemy;
landingSprite = sBallEnemySquish;

// VFX Alarm
alarm[0] = room_speed * 0.1;

image_xscale = -dir;

// Spawn for hard mode
if(global.hardMode && !elite)
{
	hardEnemy = instance_create_layer(x,y,"Enemies",oBallEnemyElite);
	hardEnemy.dir = dir;
	instance_destroy();
}