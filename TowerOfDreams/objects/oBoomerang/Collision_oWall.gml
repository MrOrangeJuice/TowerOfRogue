/// @description Destroy

instance_create_layer(x+4,y+4,"Enemies",oPlayerExplosion);
audio_play_sound(snd_Impact,5,false);
instance_destroy();