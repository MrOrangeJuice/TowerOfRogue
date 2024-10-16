/// @description Draw Item

// Check for shop items
card = 0;
dice = 0;
for(i = 0; i < array_length(global.passiveItems); i++)
{
	if(global.passiveItems[i] == 4)
	{
		card++;
	}
	if(global.passiveItems[i] == 13)
	{
		dice++;
	}
}

rerollDiscount = dice * 10;
price = itemPrice+global.rerollTax-rerollDiscount;
if(price < 0) price = 0;

draw_set_halign(fa_center);

draw_set_color($6d454d);
draw_text(x+9,y-13,price * (1 - (card * 0.2))); 
draw_text(x+9,y-15,price * (1 - (card * 0.2))); 
draw_text(x+8,y-14,price * (1 - (card * 0.2))); 
draw_text(x+10,y-14,price * (1 - (card * 0.2))); 

draw_set_color($b1d7f0);
draw_text(x+9,y-14,price * (1 - (card * 0.2))); 

// Draw item name
if(instance_exists(oPlayer))
{
	// Check if player is underneath
	if(oPlayer.x < x + 24 && oPlayer.x > x - 8)
	{
		draw_set_color($6d454d);
		draw_text(x+8,1477,"Reroll");
		draw_text(x+8,1475,"Reroll");
		draw_text(x+9,1476,"Reroll");
		draw_text(x+7,1476,"Reroll");
		
		draw_set_color($b1d7f0);
		draw_text(x+8,1476,"Reroll");
	}
}

draw_set_color($6d454d);
draw_self();