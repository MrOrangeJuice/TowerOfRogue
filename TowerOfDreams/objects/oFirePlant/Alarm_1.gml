/// @description Fire fireball

if(sprite_index == sFirePlantFlame)
{
	if(IsOnScreen(y))
	{
		audio_play_sound(snd_Cannon,5,false);
	}
	ball = instance_create_layer(x+(dir*8),y+1,"Enemies",oFireBall);
	ball.dir = dir;
	
	// Reset alarm if still firing
	alarm[1] = room_speed * 0.25;
}