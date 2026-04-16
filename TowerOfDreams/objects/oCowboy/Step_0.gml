/// @description Update

event_inherited();

if(!global.paused && !global.hitStop)
{
	if(firing && image_index > 18 && !fired)
	{
		if(IsOnScreen(y)) audio_play_sound(snd_Tank,5,false);
		bullet = instance_create_layer(x+(dir*27),y-1,"Enemies",oBullet);
		if(dir == 1) bullet.dir = dir;
		fired = true;
	}
}
else
{
	alarm[4]++;
}