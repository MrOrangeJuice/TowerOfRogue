/// @description Draw text

draw_self();
draw_set_halign(fa_center);

if(colliding)
{
	
	draw_sprite(sMessageBoxSmall,0,x-8,y-44+yOffset);
	draw_text(x+24,y-40+yOffset,signMessage);
}

draw_set_halign(fa_left);