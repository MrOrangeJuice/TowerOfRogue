/// @description Fire

if(firing)
{
	if(IsOnScreen(y)) audio_play_sound(snd_Tank,5,false);
	firing = false;
	missile = instance_create_layer(x+(dir*14),y,"Enemies",oMissile);
	if(dir == 1) missile.dir = "right";
	alarm[3] = room_speed * 2;
}