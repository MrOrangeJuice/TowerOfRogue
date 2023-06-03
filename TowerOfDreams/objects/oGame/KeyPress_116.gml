/// @description Change resolution

if(!global.res1610)
{
	window_set_size(1280,800);
	surface_resize(application_surface,256,160);
	global.res1610 = true;
}
else if(global.res1610)
{
	window_set_size(1280,720);
	surface_resize(application_surface,256,144);
	global.res1610 = false;
}