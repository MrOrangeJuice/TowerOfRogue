/// @description Destroy

instance_create_layer(x,y,"Enemies",oPlayerExplosion);
audio_play_sound(snd_Impact,5,false);
instance_destroy();