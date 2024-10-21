/// @description Turn off dream boy

global.dreamBoy = false;
global.paused = false;
audio_stop_sound(snd_DreamBoyTurnOn);
audio_play_sound(snd_DreamBoyClose,5,false);
if(global.dreamBoyOn) audio_play_sound(snd_DreamBoyShutDown,5,false);
global.dreamBoyOn = false;
global.dreamBoyTurnedOn = false;
global.dreamBoyYTarget = 192;
if(instance_exists(oPlayer))
{
	oPlayer.canJump = true;	
}