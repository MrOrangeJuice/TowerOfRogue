/// @description Destroy

if(!SpawnPepperExplosion(x+2,y+2)) instance_create_layer(x+2,x+2,"Enemies",oDirtExplosionVFX);
instance_create_layer(x,y,"Enemies",oDirtExplosionVFX);
audio_play_sound(snd_Impact,5,false);
instance_destroy();