/// @description Increment dev item

audio_play_sound(snd_GemShot,5,false);
if(global.drawDevItem)
{
	global.devItem++;
	// Wrap around
	if(global.devItem > array_length(global.itemObjects) - 1) global.devItem = 0;
}
else
{
	global.drawDevItem = true;
}