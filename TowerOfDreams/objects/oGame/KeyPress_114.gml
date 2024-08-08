/// @description Delete Steam Achievements

/*
if(room == rTitle)
{
	SlideTransition(TRANS_MODE.GOTO,rFloor3_4);
	audio_stop_sound(msc_TitleScreen);
	audio_play_sound(snd_SwordGet,5,false);
}
*/

if(room == rTitle)
{
	steam_clear_achievement("BEATTHEGAME");
	steam_clear_achievement("BEATTHEGAMEHARD");
	steam_clear_achievement("BEATTHEGAMESRANK");
	steam_clear_achievement("BEATTHEGAMESRANKHARD");
	steam_clear_achievement("BUYONEITEM");
	steam_clear_achievement("BUYALLHEARTS");
	steam_clear_achievement("BUYALLFLEAS");
	steam_clear_achievement("BUYALLARMOR");
	steam_clear_achievement("BEATFLOOR1");
	steam_clear_achievement("BEATFLOOR2");
	steam_clear_achievement("BEATFLOOR3");
	steam_clear_achievement("SRANKONCE");
	steam_clear_achievement("NOTOUCHGROUND");
	steam_clear_achievement("BUYALLSTAMPERITEMS");
	audio_play_sound(snd_SwordGet,5,false);
}