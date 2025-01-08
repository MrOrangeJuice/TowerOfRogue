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

itemPrice = (global.itemPrices[item] + (DetermineFloorTax() * 50)) * (1 - (card * 0.2));

draw_set_color($6d454d);
draw_text(x+9,y-13,itemPrice);
draw_text(x+9,y-15,itemPrice);
draw_text(x+8,y-14,itemPrice);
draw_text(x+10,y-14,itemPrice);

draw_set_color($b1d7f0);
draw_text(x+9,y-14,itemPrice); 

// Draw item name
if(instance_exists(oPlayer))
{
	// Check if player is underneath
	if(oPlayer.x < x + 24 && oPlayer.x > x - 8)
	{
		draw_set_color($6d454d);
		draw_text(x+8,1475,global.itemNames[item]);
		draw_text(x+8,1483,global.itemTypes[item]);
		draw_text(x+8,1477,global.itemNames[item]);
		draw_text(x+8,1485,global.itemTypes[item]);
		draw_text(x+9,1476,global.itemNames[item]);
		draw_text(x+9,1484,global.itemTypes[item]);
		draw_text(x+7,1476,global.itemNames[item]);
		draw_text(x+7,1484,global.itemTypes[item]);
		
		draw_set_color($b1d7f0);
		draw_text(x+8,1476,global.itemNames[item]);
		draw_text(x+8,1484,global.itemTypes[item]);
	}
}

draw_set_color($6d454d);
draw_self();