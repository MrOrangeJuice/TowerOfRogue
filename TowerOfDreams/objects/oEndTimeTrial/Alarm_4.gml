/// @description Draw rank letter

rankLetter = true;
audio_play_sound(snd_LevelIntro2,5,false);
if(yourRank == "S")
{
	perfectRank = true;
	audio_play_sound(snd_SRank,5,false);
}