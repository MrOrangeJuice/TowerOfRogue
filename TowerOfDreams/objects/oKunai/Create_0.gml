/// @description Init

audio_play_sound(snd_Kunai,5,false);
kunaiSpeed = 3;

if(global.essence == 4)
{
	alarm[0] = room_speed * 0.5;
}
else
{
	alarm[0] = room_speed * 0.4;
}
image_xscale = initialDir;