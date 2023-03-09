/// @description Init

// If player is coming from side area, don't spawn them
if (global.pipeCount == 3) 
{
	instance_destroy();
}
audio_play_sound(snd_Portal,5,false);
alarm[0] = room_speed * 0.25;