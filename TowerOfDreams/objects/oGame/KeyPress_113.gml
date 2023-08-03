/// @description Dev cheat to get full save file

if(room == rTitle)
{
	audio_play_sound(snd_SwordGet,5,false);
	global.tutorialCompleted = true;
	global.runCompleted = true;
	global.best1_1 = "F";
	global.best1_2 = "F";
	global.best1_3 = "F";
	global.best1_4 = "F";
	global.best1_5 = "F";
	global.best2_1 = "F";
	global.best2_2 = "F";
	global.best2_3 = "F";
	Save();
}