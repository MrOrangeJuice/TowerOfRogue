/// @description Draw pop up

draw_set_font(fUI);
draw_set_halign(fa_center);
// Draw box
draw_sprite(sItemUI,0,64,144-yOffset);
// Draw item sprite
draw_sprite(global.itemSprites[global.item],0,124,150-yOffset);
// Draw item name
draw_text(128,156-yOffset,name);
// Draw item description
draw_text(128,168-yOffset,desc);