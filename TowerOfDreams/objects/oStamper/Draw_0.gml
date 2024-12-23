/// @description Draw message

draw_self();

if(colliding)
{
	draw_sprite(sMessageBoxWide,0,x-8,y-40+yOffset);
	draw_set_halign(fa_center);
	draw_text_ext(x+32,y-40+yOffset,signMessage,12,72);
}