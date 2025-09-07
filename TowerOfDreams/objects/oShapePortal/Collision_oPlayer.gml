if(instance_exists(oPlayer) && !global.playerShapePortalSpawned)
{
	oPlayer.x = otherId.x+4;
	oPlayer.y = otherId.y+4;
	oPlayer.vsp = -2;
	global.playerShapePortalSpawned = true;
}