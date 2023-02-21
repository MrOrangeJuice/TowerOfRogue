/// @description Get Gem

instance_create_layer(other.x,other.y,"CoinVFX",oCoinVFX);
global.coins++;
audio_play_sound(snd_Gem,5,false);
instance_destroy(other);