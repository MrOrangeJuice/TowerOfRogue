/// @description Draw

if(rage)
{
	image_blend = make_color_rgb(211,133,149);
	draw_self();
}
else
{
	image_blend = c_white;
	draw_self();
}

if(invulnerable > 0)
{
	invulnerable--;
	image_alpha = 0.5;
	draw_self();
	shader_reset();	
}
else
{
	image_alpha = 1;	
	draw_self();
	shader_reset();	
}