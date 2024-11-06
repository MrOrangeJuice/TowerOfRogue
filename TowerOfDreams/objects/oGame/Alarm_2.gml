/// @description Turn off dream boy

global.dreamBoy = false;
global.paused = false;
audio_stop_sound(snd_DreamBoyTurnOn);
audio_play_sound(snd_DreamBoyClose,5,false);
if(global.dreamBoyOn) audio_play_sound(snd_DreamBoyShutDown,5,false);
global.dreamBoyOn = false;
global.dreamBoyTurnedOn = false;
global.dreamBoyYTarget = 192;
global.dreamBoyState = 0;
global.UIBarYTarget = 0;
global.UIBarY = 0;
global.blockScales = [0,0,0];
global.targetBlockScales = [0,0,0];
global.labelY = [0,0,0];
global.labelYTarget = [0,0,0];
global.itemWindowY = 0;
global.itemWindowYTarget = 0;
global.currentItem = 0;
global.floppyY = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0];
global.floppyYTarget = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0];
global.floppyX = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0];
global.floppyXTarget = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0];
global.foeWindowY = 0;
global.foeWindowYTarget = 0;
global.currentFoe = 0;
global.floppyFoeY = [0,0,0,0,0,0,0,0,0,0,0];
global.floppyFoeYTarget = [0,0,0,0,0,0,0,0,0,0,0];
global.floppyFoeX = [0,0,0,0,0,0,0,0,0,0,0];
global.floppyFoeXTarget = [0,0,0,0,0,0,0,0,0,0,0];

if(instance_exists(oPlayer))
{
	oPlayer.canJump = true;	
}