/// @description Draw items

for(i = 0; i < array_length(itemList); i++)
{
	draw_sprite(global.itemSprites[itemList[i]],0,124+(24*(i-currentItem)),72);	
}