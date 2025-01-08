/// @description Draw items

if(!itemEaten)
{
	for(i = 0; i < array_length(itemList); i++)
	{
		draw_set_halign(fa_center);
		if(i == currentItem)
		{
			draw_sprite(global.itemSprites[itemList[i]],0,124+((24 + selectedOffset)*(i-currentItem)),72+itemOffsetY);
			
			draw_set_color($6d454d);
			draw_text(128,81+selectedOffset,global.itemNames[itemList[i]]);
			draw_text(128,89+selectedOffset,global.itemTypes[itemList[i]]);
			draw_text(128,105+selectedOffsetDouble,global.itemDescriptions[itemList[i]]);
			draw_text(128,79+selectedOffset,global.itemNames[itemList[i]]);
			draw_text(128,87+selectedOffset,global.itemTypes[itemList[i]]);
			draw_text(128,103+selectedOffsetDouble,global.itemDescriptions[itemList[i]]);
			draw_text(129,80+selectedOffset,global.itemNames[itemList[i]]);
			draw_text(129,88+selectedOffset,global.itemTypes[itemList[i]]);
			draw_text(129,104+selectedOffsetDouble,global.itemDescriptions[itemList[i]]);
			draw_text(127,80+selectedOffset,global.itemNames[itemList[i]]);
			draw_text(127,88+selectedOffset,global.itemTypes[itemList[i]]);
			draw_text(127,104+selectedOffsetDouble,global.itemDescriptions[itemList[i]]);
			
			draw_set_color($b1d7f0);
			draw_text(128,80+selectedOffset,global.itemNames[itemList[i]]);
			draw_text(128,88+selectedOffset,global.itemTypes[itemList[i]]);
			draw_text(128,104+selectedOffsetDouble,global.itemDescriptions[itemList[i]]);
		}
		else
		{
			draw_sprite(global.itemSprites[itemList[i]],0,124+((24 + selectedOffset)*(i-currentItem)),72);	
		}
	}
}