/// @description Switch music on or off
if(global.music)
{
	audio_stop_all();
	audio_play_sound(snd_Gulp,5,false);
	global.music = false;
}
else if(!global.music)
{
	audio_play_sound(snd_SwordGet,5,false);
	global.music = true;	
}