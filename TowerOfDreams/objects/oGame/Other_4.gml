/// @description Take away sword for tutorial

if(room == rTutorial)
{
	global.sword = false;
}

if(room == rFloor1_3)
{
	global.bumperSwitch = true;	
}

if(room == rTitle)
{
	audio_play_sound(msc_TitleScreen,5,true);	
	global.paused = false;
	menuOption = 0;
}

if(room == rTutorial2 || room == rTutorial)
{
	global.infiniteHealth = true;	
}
else
{
	global.infiniteHealth = false;	
}