/// @description Draw message

draw_self();

if(colliding && playerHasNoItem)
{
	draw_sprite(sMessageBoxSmall,0,x-24,y-56+yOffset);
	draw_set_halign(fa_center);
	draw_text_ext(x+8,y-52+yOffset,signMessage,12,56);
}