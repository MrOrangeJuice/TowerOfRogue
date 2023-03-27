/// @description Draw pop up

draw_set_font(fUI);
draw_set_halign(fa_center);
// Draw box
draw_sprite(sItemUI,0,64,-48+yOffset);
// Draw item sprite
if(!passive)
{
	draw_sprite(global.itemSprites[global.item],0,124,-42+yOffset);
}
else
{
	draw_sprite(global.passiveItemSprites[passiveID],0,124,-42+yOffset);
}
// Draw item name
draw_text(128,-36+yOffset,name);
// Draw item description
draw_text(128,-24+yOffset,desc);