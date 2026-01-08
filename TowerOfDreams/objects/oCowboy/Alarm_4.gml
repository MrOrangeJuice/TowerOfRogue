/// @description Fire

if(firing)
{
	if(IsOnScreen(y)) audio_play_sound(snd_Tank,5,false);
	bullet = instance_create_layer(x+(dir*27),y-1,"Enemies",oBullet);
	if(dir == 1) bullet.dir = dir;
}