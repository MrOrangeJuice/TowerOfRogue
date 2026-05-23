/// @description Draw message

draw_self();

if(richColliding)
{
	draw_sprite(sArrow,0,x+4,y-10);
}
else if(colliding)
{
	draw_sprite(sMessageBoxSmall,0,x-24,y-56+yOffset);
	draw_set_halign(fa_center);
	if(global.medalsFedToFrog >= 36)
		draw_text_ext(x+8,y-52+yOffset,"I'm full!",12,56);
	else
		draw_text_ext(x+8,y-52+yOffset,signMessage,12,56);
}