/// @description Respawn player

audio_play_sound(snd_Reappear,5,false);
if(global.lavaId.checkPointDir == "left")
{
	instance_create_layer(global.lavaId.x-8,global.lavaId.y-4,"Instances",oPlayer);
}
if(global.lavaId.checkPointDir == "right")
{
	instance_create_layer(global.lavaId.x + (8 * global.lavaId.image_xscale) + 8,global.lavaId.y-4,"Instances",oPlayer);
}
TakeDamage(1,0,0,false);
instance_destroy();