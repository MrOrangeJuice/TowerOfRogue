/// @description Destroy

SpawnPepperExplosion(x,y);
instance_create_layer(x,y,"Enemies",oAxplosion);
audio_play_sound(snd_Impact,5,false);
instance_destroy();