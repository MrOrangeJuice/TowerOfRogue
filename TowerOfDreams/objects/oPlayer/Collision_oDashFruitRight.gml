/// @description Eat Right Dash Fruit

// Push player to the right
while(place_meeting(x,y,other))
{
	x += 1;	
}

audio_play_sound(snd_Gulp,5,false);
audio_play_sound(snd_FruitJump,5,false);
instance_create_layer(other.x+2,other.y+2,"CoinVFX",oHorizontalDashFruitVFX);
instance_create_layer(other.x,other.y+18,"CoinVFX",oFastJumpVFX);
ScreenShake(1,5);
vsp = -3;
currentwalksp = 6;
extraJump = false;
instance_create_layer(other.x,other.y,"Enemies",oDashFruitRespawnRight);
instance_destroy(other);