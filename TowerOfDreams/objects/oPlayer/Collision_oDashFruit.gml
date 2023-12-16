/// @description Eat Dash Fruit

audio_play_sound(snd_Gulp,5,false);
instance_create_layer(other.x+2,other.y+2,"CoinVFX",oDashFruitVFX);
instance_create_layer(other.x+8,other.y+16,"CoinVFX",oFruitJumpVFX);
ScreenShake(1,5);
vsp = -5;
extraJump = false;
instance_create_layer(other.x,other.y,"Enemies",oDashFruitRespawn);
instance_destroy(other);