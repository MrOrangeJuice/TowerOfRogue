/// @description Init

event_inherited();

hp = 3;
hsp = 0.5;
grv = 0.15;
vsp = 0;
state = "patrol";
moving = true;
randInt = 0;
canTurn = true;
canStartMovingAgain = true;
canStopMoving = true;
firing = false;
forward = true;

// Sprites
idle = sTankEnemyIdle;
run = sTankEnemy;
back = sTankEnemyBack;
fire = sTankEnemyFire;

image_xscale = dir;

// Spawn for hard mode
if(global.hardMode && !elite)
{
	hardEnemy = instance_create_layer(x,y,"Enemies",oTankEnemyElite);
	hardEnemy.dir = dir;
	instance_destroy();
}