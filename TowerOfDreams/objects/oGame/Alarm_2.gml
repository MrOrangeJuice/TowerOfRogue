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
global.floppyX = [119,139,159,179,199,219,239,259,279,299,319,339,359,379,399,419,439,459,479,499,519,539,559,579,599,619,639,659,679,699,719,739,759,779,799,819];
global.floppyXTarget = [119,139,159,179,199,219,239,259,279,299,319,339,359,379,399,419,439,459,479,499,519,539,559,579,599,619,639,659,679,699,719,739,759,779,799,819];
global.foeWindowY = 0;
global.foeWindowYTarget = 0;
global.currentFoe = 0;
global.floppyFoeY = [0,0,0,0,0,0,0,0,0,0,0];
global.floppyFoeYTarget = [0,0,0,0,0,0,0,0,0,0,0];
global.floppyFoeX = [119,139,159,179,199,219,239,259,279,299,319];
global.floppyFoeXTarget = [119,139,159,179,199,219,239,259,279,299,319];
global.extraSpriteY = [0,0,0,0,0,0,0,0,0];
global.extraSpriteYTarget = [0,0,0,0,0,0,0,0,0];
global.extraSpriteX = [91,175,259,343,427,511,595,679,763];
global.extraSpriteXTarget =  [91,175,259,343,427,511,595,679,763];
global.currentExtra = 0;

audio_resume_all();

if(instance_exists(oPlayer))
{
	oPlayer.canJump = true;	
}