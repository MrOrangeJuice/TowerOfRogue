/// @description Go to test room

if(room == rTitle)
{
	SlideTransition(TRANS_MODE.GOTO,rFloor1_1);
	audio_play_sound(snd_SwordGet,5,false);
}