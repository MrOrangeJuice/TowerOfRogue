/// @description Draw

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
}