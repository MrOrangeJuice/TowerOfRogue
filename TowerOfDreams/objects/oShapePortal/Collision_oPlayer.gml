if(instance_exists(oPlayer) && !global.playerShapePortalSpawned)
{
	audio_play_sound(snd_LevelPortal,5,false);
	oPlayer.x = otherId.x+4;
	oPlayer.y = otherId.y+4;
	oPlayer.vsp = -2;
	//oPlayer.portalVFXTimer = 3;
	for(var i = 0; i < 20; i++)
	{
		instance_create_layer(otherId.x+4,otherId.y+4,"VFX",vfx);
	}
	global.playerShapePortalSpawned = true;
	oPlayer.shapePortalTimer = 240;
	oPlayer.invulnerable = 75;
	sprite_index = smallSprite;
	otherId.sprite_index = bigSprite;
	alarm[0] = room_speed * (animSpeed + easeSpeed);
	imageSpeed = 3;
	otherId.alarm[3] = room_speed * (animSpeed + easeSpeed);
	otherId.imageSpeed = 3;
}