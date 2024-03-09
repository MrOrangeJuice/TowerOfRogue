/// @description Destroy on wall hit

SpawnPepperExplosion(x,y);

instance_create_layer(x,y,"Enemies",oKunaiExplosionVFX);
audio_play_sound(snd_Impact,5,false);
instance_destroy();