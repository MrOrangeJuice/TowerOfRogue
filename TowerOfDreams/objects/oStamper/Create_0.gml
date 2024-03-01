/// @description Init

// Replace with sign if all items bought
if(global.item1Bought && global.item2Bought && global.item3Bought)
{
	if(instance_exists(oSign)) oSign.visible = true;
	if(instance_exists(oShopBag)) oShopBag.visible = false;
	if(instance_exists(oDiceBubble)) instance_destroy(oDiceBubble);
	instance_destroy();
}
else
{
	if(instance_exists(oSign)) oSign.visible = false;	
}
bought = false;

// Dialogue stuff
colliding = false;
yAccel = 0.02;
vsp = 0;
yOffset = 0;

phrases = ["Passive\nitems stack!", "See you\nnext floor!","Bored?\nTry a reroll!","Apply for our\nrewards card!","Try a critical\nhit PB&J!","Some items have\nstrong synergies",string("You've died\n{0} times!",global.totalDeaths)];