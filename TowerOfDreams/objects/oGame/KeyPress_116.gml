/// @description Change resolution

if(global.debug)
{
	if(global.displayMode == 0)
	{
		window_set_size(1280,800);
		surface_resize(application_surface,1280,800);
		camera_set_view_size(view_camera[0],256,160);
		display_set_gui_size(256,160);
		oTransition.h = 160;
		oTransition.h_half = 80;
		global.displayMode = 1;
	}
	else if(global.displayMode == 1)
	{
		window_set_size(1280,960);
		surface_resize(application_surface,1280,960);
		camera_set_view_size(view_camera[0],256,192);
		display_set_gui_size(256,192);
		oTransition.h = 192;
		oTransition.h_half = 96;
		global.displayMode = 2;
	}
	else if(global.displayMode == 2)
	{
		window_set_size(1280,720);
		surface_resize(application_surface,1280,720);
		camera_set_view_size(view_camera[0],256,144);
		display_set_gui_size(256,144);
		oTransition.h = 144;
		oTransition.h_half = 72;
		global.displayMode = 0;
	}
}