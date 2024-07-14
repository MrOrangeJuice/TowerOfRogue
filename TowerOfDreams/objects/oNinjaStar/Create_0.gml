/// @description Init

audio_play_sound(snd_Ninja,5,false);
kunaiSpeed = 0;

if(global.essence == 4)
{
	alarm[0] = room_speed * 5;
	kunaiSpeed = 2;
}
else
{
	alarm[0] = room_speed * 4;
	kunaiSpeed = 1.5;
}
image_xscale = initialDir;