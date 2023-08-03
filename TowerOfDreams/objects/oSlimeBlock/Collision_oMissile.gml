/// @description Destroy

instance_create_layer(x,y,"VFX",oSlimeBlockDestroyVFX);
audio_play_sound(snd_SlimeExplosion,5,false);
audio_play_sound(snd_SlimeScream,5,false);
instance_destroy();