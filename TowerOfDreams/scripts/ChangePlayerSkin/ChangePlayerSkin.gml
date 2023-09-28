// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function ChangePlayerSkin()
{
	if(instance_exists(oPlayer))
	{
		switch(global.palette)
		{
			case 0:
				oPlayer.idleSprite = sPlayerIdle;
				oPlayer.runSprite = sPlayerRun;
				oPlayer.jumpSprite = sPlayerJump;
				oPlayer.fallSprite = sPlayerFall;
				oPlayer.slashSprite = sPlayerSlashSmall;
				oPlayer.doubleSlashSprite = sPlayerSlashDouble;
				oPlayer.hitSprite = sPlayerHit;
				oPlayer.wallSprite = sPlayerWallSlide;
				oPlayer.landSprite = sPlayerLand;
				break;
			case 1:
				oPlayer.idleSprite = sPlayerIdleRed;
				oPlayer.runSprite = sPlayerRunRed;
				oPlayer.jumpSprite = sPlayerJumpRed;
				oPlayer.fallSprite = sPlayerFallRed;
				oPlayer.slashSprite = sPlayerSlashSmallRed;
				oPlayer.doubleSlashSprite = sPlayerSlashDoubleRed;
				oPlayer.hitSprite = sPlayerHitRed;
				oPlayer.wallSprite = sPlayerWallSlideRed;
				oPlayer.landSprite = sPlayerLandRed;
				break;
			case 2:
				oPlayer.idleSprite = sPlayerIdleGreen;
				oPlayer.runSprite = sPlayerRunGreen;
				oPlayer.jumpSprite = sPlayerJumpGreenSkin;
				oPlayer.fallSprite = sPlayerFallGreen;
				oPlayer.slashSprite = sPlayerSlashSmallGreen;
				oPlayer.doubleSlashSprite = sPlayerSlashDoubleGreen;
				oPlayer.hitSprite = sPlayerHitGreen;
				oPlayer.wallSprite = sPlayerWallSlideGreen;
				oPlayer.landSprite = sPlayerLandGreen;
				break;
			case 3:
				oPlayer.idleSprite = sPlayerIdleZombie;
				oPlayer.runSprite = sPlayerRunZombie;
				oPlayer.jumpSprite = sPlayerJumpZombie;
				oPlayer.fallSprite = sPlayerFallZombie;
				oPlayer.slashSprite = sPlayerSlashSmallZombie;
				oPlayer.doubleSlashSprite = sPlayerSlashDoubleZombie;
				oPlayer.hitSprite = sPlayerHitZombie;
				oPlayer.wallSprite = sPlayerWallSlideZombie;
				oPlayer.landSprite = sPlayerLandZombie;
				break;
		}
	}
}