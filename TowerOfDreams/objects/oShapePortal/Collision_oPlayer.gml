if(instance_exists(oPlayer) && !global.playerShapePortalSpawned)
{
	oPlayer.x = otherId.x+4;
	oPlayer.y = otherId.y+4;
	oPlayer.vsp = -2;
	oPlayer.portalVFXTimer = 3;
	global.playerShapePortalSpawned = true;
	sprite_index = smallSprite;
	otherId.sprite_index = bigSprite;
	alarm[0] = room_speed * (animSpeed + easeSpeed);
	imageSpeed = 3;
	otherId.alarm[3] = room_speed * (animSpeed + easeSpeed);
	otherId.imageSpeed = 3;
}