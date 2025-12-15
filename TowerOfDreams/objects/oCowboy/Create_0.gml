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
idle = sCowboy;
run = sCowboyWalk;
back = sCowboyBack;
fire = sCowboyFire;

image_xscale = dir;

// Spawn for hard mode
if(global.hardMode && object_index != oTankEnemyElite)
{
	instance_change(oTankEnemyElite,false);
	hp = 6;// Sprites
	elite = true;
	idle = sTankEnemyIdleElite;
	run = sTankEnemyElite;
	back = sTankEnemyBackElite;
	fire = sTankEnemyFireElite;
}