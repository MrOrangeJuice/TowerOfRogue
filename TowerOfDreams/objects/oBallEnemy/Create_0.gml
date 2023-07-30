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