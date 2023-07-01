/// @description Fire Cannon ball

if(sprite_index == sCannonFire)
{
	if(IsOnScreen(y))
	{
		audio_play_sound(snd_Cannon,5,false);
	}
	ball = instance_create_layer(x+(dir*8),y+1,"Enemies",oCannonBall);
	ball.dir = dir;
	sprite_index = sCannon;
	alarm[0] = room_speed * fireGap;
}