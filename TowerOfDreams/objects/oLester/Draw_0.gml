/// @description Draw text

draw_self();
draw_set_halign(fa_center);

if(colliding)
{
    
    draw_sprite(sMessageBox,0,x-48,y-72+yOffset);
    draw_text_ext(x+16,y-72+yOffset,signMessage,12,120);
}

draw_set_halign(fa_left);
