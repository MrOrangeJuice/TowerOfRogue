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
canSpawnGroundDust = true;
wallSliding = false;
wallJumpCoyote = false;
prevWallSliding = false;
invulnerable = false;
hit = false;
rage = false;
rageDamage = 0;
shockX = 0;
shockY = 0;
bootsX = 0;
bootsY = 0;
extraJump = true;
initialConveyerRunDir = 0;
conveyerBoost = false;
citrusBoost = false;
citrusBoosts = 0;
initialCitrusDir = 0;
upConveyer = false;
upConveyerBoost = false;
upConveyerCoyote = false;
chargeBounces = 0;
chargeSlash = false;
dashing = false;
airDash = false;
dashOver = false;
bombNum = 2;
blockX = x;
blockY = y;
blockTargetX = x;
blockTargetY = y;
blockOffset = 14;
blockCursorCooldown = 0;
if(global.essence == 4)
{
	bombNum = 3;
}
lavaBoost = false;

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
ChangePlayerSkin();
