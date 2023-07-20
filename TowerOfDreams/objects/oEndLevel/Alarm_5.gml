/// @description Turn on damage display

damageDisplay = true;
audio_play_sound(snd_LevelIntro2,5,false);
if(damageNum <= 0)
{
	perfectDamage = true;
	audio_play_sound(snd_Perfect,5,false);
}