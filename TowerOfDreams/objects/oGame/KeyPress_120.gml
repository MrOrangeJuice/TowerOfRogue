/// @description Toggle Controller Debug


if(global.controllerDebug)
{
	audio_play_sound(snd_Gulp,5,false);
	global.controllerDebug = false;
}
else if(!global.controllerDebug)
{
	audio_play_sound(snd_SwordGet,5,false);
	global.controllerDebug = true;	
}
