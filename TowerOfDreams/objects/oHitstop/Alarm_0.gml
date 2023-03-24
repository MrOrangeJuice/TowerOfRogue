/// @description Destroy

global.hitStop = false;
// Kill player if necessary
if(death)
{
	// Spawn grave
	instance_create_layer(oPlayer.x-4,oPlayer.y-4,"Instances",oGrave);
	// Spawn bits
	instance_create_layer(oPlayer.x-4,oPlayer.y-4,"Pipes",oPlayerBit);
	instance_create_layer(oPlayer.x-4,oPlayer.y-4,"Pipes",oPlayerBit);
	instance_create_layer(oPlayer.x-4,oPlayer.y-4,"Pipes",oPlayerBit);
	instance_create_layer(oPlayer.x-4,oPlayer.y-4,"Pipes",oPlayerBit);
	instance_create_layer(oPlayer.x-4,oPlayer.y-4,"Pipes",oPlayerBit);
	instance_create_layer(oPlayer.x-4,oPlayer.y-4,"Pipes",oPlayerBit);
	instance_create_layer(oPlayer.x-4,oPlayer.y-4,"Pipes",oPlayerBit);
	instance_create_layer(oPlayer.x-4,oPlayer.y-4,"Pipes",oPlayerBit);
	// Spawn explosion
	instance_create_layer(oPlayer.x-4,oPlayer.y-4,"Collectables",oPlayerExplosion);
	// Kill player
	instance_destroy(oPlayer);
	// Play sound
	audio_play_sound(snd_PlayerDeath,5,false);
}
instance_destroy();