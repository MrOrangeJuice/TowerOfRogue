/// @description Go to test room

if(room == rTitle)
{
	SlideTransition(TRANS_MODE.GOTO,rFloor2_2);
	audio_stop_sound(msc_TitleScreen);
	audio_play_sound(snd_SwordGet,5,false);
}