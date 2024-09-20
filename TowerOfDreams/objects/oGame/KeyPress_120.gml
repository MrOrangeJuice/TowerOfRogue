/// @description Turn on debug mode

global.debugCounter++;
if(global.debugCounter == 5)
{
	audio_play_sound(snd_SwordGet,5,false);
	if(!global.debug)
	{
		global.debug = true;	
	}
	else
	{
		global.debug = false;
	}
	global.debugDisplay = true;
	global.debugCounter = 0;
	alarm[1] = room_speed * 1;
}