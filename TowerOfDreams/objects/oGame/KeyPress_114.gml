/// @description Go to test room
if(global.debug)
{
	if(room == rTitle)
	{
		SlideTransition(TRANS_MODE.GOTO,rMemoryZoo);
		audio_stop_sound(msc_TitleScreen);
		audio_play_sound(snd_SwordGet,5,false);
	}
}