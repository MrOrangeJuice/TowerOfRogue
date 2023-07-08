/// @description Draw Item

// Check for shop items
card = 0;
for(i = 0; i < array_length(global.passiveItems); i++)
{
	if(global.passiveItems[i] == 4)
	{
		card++;
	}
}

draw_sprite(global.itemSprites[item],0,x+4,y+4);
draw_set_halign(fa_center);
itemPrice = global.itemPrices[item] * (1 - (card * 0.2));
draw_text(x+9,y-14,itemPrice); 

// Draw item name
if(instance_exists(oPlayer))
{
	// Check if player is underneath
	if(oPlayer.x < x + 24 && oPlayer.x > x - 8)
	{
		draw_text(x+8,1476,global.itemNames[item]);
		draw_text(x+8,1484,global.itemTypes[item]);
	}
}

draw_self();