/// @description Fire

if(firing)
{
	if(IsOnScreen(y)) audio_play_sound(snd_Tank,5,false);
	firing = false;
	bullet = instance_create_layer(x+(dir*14),y,"Enemies",oBullet);
	if(dir == 1) bullet.dir = dir;
	alarm[3] = room_speed * 2;
}