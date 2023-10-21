/// @description Explode

instance_create_layer(x+4,y+4,"VFX",oBombExplosionVFX);
audio_play_sound(snd_EnemyDeath,5,false);
ScreenShake(2,10);
instance_destroy();