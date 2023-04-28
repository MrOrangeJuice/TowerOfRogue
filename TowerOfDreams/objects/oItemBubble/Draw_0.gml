/// @description Draw Item

draw_sprite(global.itemSprites[item],0,x+4,y+4);
draw_set_halign(fa_center);
draw_text(x+9,y-14,global.itemPrices[item]); 
draw_self();