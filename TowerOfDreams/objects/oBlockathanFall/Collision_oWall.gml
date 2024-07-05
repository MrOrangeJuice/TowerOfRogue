/// @description Explode

instance_create_layer(x,y,"VFX",oBombExplosionVFX);
audio_play_sound(snd_Bomb,5,false);
ScreenShake(2,10);
instance_destroy();