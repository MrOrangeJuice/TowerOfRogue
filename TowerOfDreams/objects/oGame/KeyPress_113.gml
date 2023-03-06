/// @description Dev cheat to get full save file

if(room == rTitle)
{
	audio_play_sound(snd_SwordGet,5,false);
	global.tutorialCompleted = true;
	Save();
}