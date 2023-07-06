/// @description Take away sword for tutorial

if(global.res1610)
{
	window_set_size(1280,800);
	surface_resize(application_surface,1280,800);
	camera_set_view_size(view_camera[0],256,160);
	display_set_gui_size(256,160);
	oTransition.h = 160;
	oTransition.h_half = 80;
}
else if(!global.res1610)
{
	window_set_size(1280,720);
	surface_resize(application_surface,1280,720);
	camera_set_view_size(view_camera[0],256,144);
	display_set_gui_size(256,144);
	oTransition.h = 144;
	oTransition.h_half = 72;
}

if(room == rTutorial)
{
	global.sword = false;
}

if(room == rFloor1_3 || room == rFloor2_3)
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

audio_stop_sound(snd_BoomerangReturn);