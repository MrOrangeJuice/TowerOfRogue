/// @description Draw message

draw_self();

if(colliding && global.item == -1)
{
	draw_sprite(sMessageBoxSmall,0,x-24,y-56+yOffset);
	draw_set_halign(fa_center);
	draw_text(x+8,y-52+yOffset,signMessage);
}