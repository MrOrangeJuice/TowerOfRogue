/// @description Fire Cannon ball

if(sprite_index == sCannonCloudUpFire)
{
	if(IsOnScreen(y))
	{
		audio_play_sound(snd_Cannon,5,false);
	}
	ball = instance_create_layer(x,y-8,"Enemies",oCannonBallUp);
	ball.dir = dir;
	sprite_index = sCannonCloudUpIdle;
	alarm[0] = room_speed * fireGap;
}