/// @description Restart Game

audio_play_sound(snd_Portal,5,false);
instance_destroy(oPlayer);
instance_create_layer(x+8,y+8,"Instances",oPlayerPortal);