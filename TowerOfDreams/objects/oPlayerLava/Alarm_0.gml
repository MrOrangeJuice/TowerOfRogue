/// @description Respawn player

audio_play_sound(snd_Reappear,5,false);
if(global.lavaId.checkPointDir == "left")
{
	instance_create_layer(global.lavaId.x-(8+global.lavaId.cpXOffset),global.lavaId.y-(4+global.lavaId.cpYOffset),"Instances",oPlayer);
}
if(global.lavaId.checkPointDir == "right")
{
	player = instance_create_layer(global.lavaId.x + (8 * global.lavaId.image_xscale) + (8+global.lavaId.cpXOffset),global.lavaId.y-(4+global.lavaId.cpYOffset),"Instances",oPlayer);
	player.image_xscale = -1;
}
TakeDamage(1,0,0,false);
instance_destroy();