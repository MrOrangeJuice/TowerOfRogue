/// @description Draw message

draw_self();

if(colliding)
{
	draw_sprite(sMessageBoxSmall,0,x,y-48+yOffset);
	draw_set_halign(fa_center);
	draw_text(x+32,y-44+yOffset,signMessage);
}