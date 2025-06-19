/// @description Draw text

draw_self();

if(colliding)
{
	draw_set_font(fUI);
	draw_sprite(sMessageBox,0,x-56,y-68+yOffset);
	draw_set_halign(fa_center);
	draw_text(x+8,y-64+yOffset,signMessage);
}