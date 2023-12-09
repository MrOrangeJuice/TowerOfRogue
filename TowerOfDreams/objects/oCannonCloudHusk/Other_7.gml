/// @description Fire Cannon ball

if(sprite_index == sCannonCloudHuskFire)
{
	if(IsOnScreen(y))
	{
		audio_play_sound(snd_Cannon,5,false);
	}
	ball = instance_create_layer(x,y+12,"Enemies",oCannonBallDown);
	ball.dir = dir;
	sprite_index = sCannonCloudHusk;
	alarm[0] = room_speed * fireGap;
}