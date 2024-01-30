/// @description Mount player to bird

audio_play_sound(snd_Bumper,5,false);
instance_create_layer(x,y,"Instances",oBird);
instance_destroy(oPlayer);
instance_destroy();