/// @description Change resolution

if(!global.res1610)
{
	window_set_size(1280,800);
	surface_resize(application_surface,1280,800);
	camera_set_view_size(view_camera[0],256,160);
	display_set_gui_size(256,160);
	oTransition.h = 160;
	oTransition.h_half = 80;
	global.res1610 = true;
}
else if(global.res1610)
{
	window_set_size(1280,720);
	surface_resize(application_surface,1280,720);
	camera_set_view_size(view_camera[0],256,144);
	display_set_gui_size(256,144);
	oTransition.h = 144;
	oTransition.h_half = 72;
	global.res1610 = false;
}