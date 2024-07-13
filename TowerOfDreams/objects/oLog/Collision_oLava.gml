/// @description Destroy

instance_create_layer(x+2,y+2,"Enemies",oBallVFX);
audio_play_sound(snd_Impact,5,false);
instance_destroy();