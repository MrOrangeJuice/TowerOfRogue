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