/// @description Decrement dev item

if(global.debug)
{
	audio_play_sound(snd_GemShot2,5,false);
	if(global.drawDevItem)
	{
		global.devItem--;
		// Wrap around
		if(global.devItem < 0) global.devItem = array_length(global.itemObjects) - 1;
	}
	else
	{
		global.drawDevItem = true;	
	}
}