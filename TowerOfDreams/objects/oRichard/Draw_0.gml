/// @description Draw text

draw_self();
draw_set_halign(fa_center);

if(colliding)
{
	
	draw_sprite(sMessageBoxSmall,0,x-8,y-44+yOffset);
	draw_text_ext(x+24,y-44+yOffset,signMessage,12,56);
}

draw_set_halign(fa_left);