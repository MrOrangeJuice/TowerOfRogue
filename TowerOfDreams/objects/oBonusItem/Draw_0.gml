/// @description Draw items

for(i = 0; i < array_length(itemList); i++)
{
	draw_set_halign(fa_center);
	if(i == currentItem)
	{
		draw_sprite(global.itemSprites[itemList[i]],0,124+((24 + selectedOffset)*(i-currentItem)),72+itemOffsetY);
		draw_text(128,80,global.itemNames[itemList[i]]);
		draw_text(128,88,global.itemTypes[itemList[i]]);
	}
	else
	{
		draw_sprite(global.itemSprites[itemList[i]],0,124+((24 + selectedOffset)*(i-currentItem)),72);	
	}
}