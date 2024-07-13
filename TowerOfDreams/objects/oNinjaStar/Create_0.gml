/// @description Init

audio_play_sound(snd_Ninja,5,false);
kunaiSpeed = 1.5;

if(global.essence == 4)
{
	alarm[0] = room_speed * 5;
}
else
{
	alarm[0] = room_speed * 4;
}
image_xscale = initialDir;