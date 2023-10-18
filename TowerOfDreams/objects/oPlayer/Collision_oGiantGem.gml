/// @description Pickup giant gem

global.coins += other.value;
global.coinsThisRun += other.value;
audio_play_sound(snd_BigGem,5,false);
with (oGame) coinTextScale = 1.2;
instance_create_layer(other.x,other.y,"Collectables",oBigCoinVFX);
instance_destroy(other);