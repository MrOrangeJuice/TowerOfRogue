/// @description Eat Dash Fruit

// Push player up
while(place_meeting(x,y,other))
{
	y -= 1;	
}
// Push player to center
//x = other.x+8;

audio_play_sound(snd_Gulp,5,false);
audio_play_sound(snd_FruitJump,5,false);
instance_create_layer(other.x+2,other.y+2,"CoinVFX",oDashFruitVFX);
instance_create_layer(other.x+8,other.y+18,"CoinVFX",oFruitJumpVFX);
ScreenShake(1,5);
vsp = -5;
extraJump = false;
instance_create_layer(other.x,other.y,"Enemies",oDashFruitRespawn);
instance_destroy(other);