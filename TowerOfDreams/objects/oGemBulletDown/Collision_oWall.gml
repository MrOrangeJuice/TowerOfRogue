/// @description Destroy on wall hit

SpawnPepperExplosion(x,y);

instance_create_layer(x,y,"Enemies",oGemExplosionVFX);
audio_play_sound(snd_Impact,5,false);

// Spawn bits
instance_create_layer(x,y,"Pipes",oGemBit);
instance_create_layer(x,y,"Pipes",oGemBit);
instance_create_layer(x,y,"Pipes",oGemBit);
instance_create_layer(x,y,"Pipes",oGemBit);

instance_destroy();