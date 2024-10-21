/// @description Turn off dream boy

global.dreamBoy = false;
global.paused = false;
audio_stop_sound(snd_DreamBoyTurnOn);
audio_play_sound(snd_DreamBoyClose,5,false);
if(global.dreamBoyOn) audio_play_sound(snd_DreamBoyShutDown,5,false);
global.dreamBoyOn = false;
global.dreamBoyTurnedOn = false;
global.dreamBoyYTarget = 192;
global.UIBarYTarget = 0;
global.UIBarY = 0;
global.labelY = [0,0,0];
global.labelYTarget = [0,0,0];
if(instance_exists(oPlayer))
{
	oPlayer.canJump = true;	
}