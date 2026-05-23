/// @description Init

event_inherited();

hp = 2;
hsp = 0.75;
grv = 0.05;
vsp = 0;
airborne = false;
landing = false;
jumpPwr = -2;

// Sprites
regularSprite = sBounceEnemy;
landingSprite = sBounceEnemySquish;

// VFX Alarm
alarm[0] = room_speed * 0.1;

image_xscale = dir;