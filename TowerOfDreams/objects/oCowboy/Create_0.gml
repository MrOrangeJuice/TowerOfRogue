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
fired = false;

// Sprites
idle = sCowboy;
run = sCowboyWalk;
back = sCowboyBack;
fire = sCowboyFire;

image_xscale = dir;

// Spawn for hard mode
if(global.hardMode && object_index != oCowboyElite)
{
	instance_change(oCowboyElite,false);
	hp = 6;// Sprites
	elite = true;
	idle = sCowboyElite;
	run = sCowboyEliteWalk;
	back = sCowboyEliteBack;
	fire = sCowboyEliteFire;
}