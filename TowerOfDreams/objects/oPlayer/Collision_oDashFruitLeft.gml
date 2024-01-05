/// @description Eat Left Dash Fruit

// Push player to the right
while(place_meeting(x,y,other))
{
	x -= 1;	
}

audio_play_sound(snd_Gulp,5,false);
audio_play_sound(snd_FruitJump,5,false);
instance_create_layer(other.x+2,other.y+2,"CoinVFX",oHorizontalDashFruitVFX);
instance_create_layer(other.x+16,other.y+18,"CoinVFX",oFastJumpLeftVFX);
ScreenShake(1,5);
currentwalksp = -6;
vsp = -3;
extraJump = false;
instance_create_layer(other.x,other.y,"Enemies",oDashFruitRespawnLeft);
instance_destroy(other);