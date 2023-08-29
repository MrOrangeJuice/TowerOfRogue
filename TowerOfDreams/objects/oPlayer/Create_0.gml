/// @description Init

hsp = 0;
vsp = 0;
grv = 0.15;
walksp = 1;
currentwalksp = 0;
acceleration = 0.25;
running = false;
initialRunDir = 0;
canJump = true;
jumpBuffer = 0;
airborne = false;
prevAirborne = false;
landing = false;
slashing = false;
canSlash = true;
hasSlashed = false;
hasSlashJumped = false;
canWallSlide = true;
canSpawnWallDust = true;
wallSliding = false;
wallJumpCoyote = false;
prevWallSliding = false;
invulnerable = false;
hit = false;
rage = false;
rageDamage = 0;
shockX = 0;
shockY = 0;
extraJump = true;
initialConveyerRunDir = 0;
conveyerBoost = false;
upConveyer = false;
upConveyerBoost = false;
upConveyerCoyote = false;
chargeBounces = 0;
chargeSlash = false;
dashing = false;
airDash = false;
dashOver = false;

// Sprites
idleSprite = sPlayerIdle;
runSprite = sPlayerRun;
jumpSprite = sPlayerJump;
fallSprite = sPlayerFall;
slashSprite = sPlayerSlashSmall;
doubleSlashSprite = sPlayerSlashDouble;
hitSprite = sPlayerHit;
wallSprite = sPlayerWallSlide;
landSprite = sPlayerLand;


// Skin
switch(global.palette)
{
	case 0:
		idleSprite = sPlayerIdle;
		runSprite = sPlayerRun;
		jumpSprite = sPlayerJump;
		fallSprite = sPlayerFall;
		slashSprite = sPlayerSlashSmall;
		doubleSlashSprite = sPlayerSlashDouble;
		hitSprite = sPlayerHit;
		wallSprite = sPlayerWallSlide;
		landSprite = sPlayerLand;
		break;
	case 1:
		idleSprite = sPlayerIdleRed;
		runSprite = sPlayerRunRed;
		jumpSprite = sPlayerJumpRed;
		fallSprite = sPlayerFallRed;
		slashSprite = sPlayerSlashSmallRed;
		doubleSlashSprite = sPlayerSlashDoubleRed;
		hitSprite = sPlayerHitRed;
		wallSprite = sPlayerWallSlideRed;
		landSprite = sPlayerLandRed;
		break;
	case 2:
		idleSprite = sPlayerIdleGreen;
		runSprite = sPlayerRunGreen;
		jumpSprite = sPlayerJumpGreenSkin;
		fallSprite = sPlayerFallGreen;
		slashSprite = sPlayerSlashSmallGreen;
		doubleSlashSprite = sPlayerSlashDoubleGreen;
		hitSprite = sPlayerHitGreen;
		wallSprite = sPlayerWallSlideGreen;
		landSprite = sPlayerLandGreen;
		break;
}