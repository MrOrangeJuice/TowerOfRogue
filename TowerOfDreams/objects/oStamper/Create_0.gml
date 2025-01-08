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

phrases = ["Passive items stack!", "See you next floor!","Bored? Try a reroll!","Don't touch my stuff!!","Apply for our rewards card!","Try a critical hit PB&J!","Some items have strong synergies","Sorry I don't take IOUs","Many never make it this far","Careful out there buddy","How's Richard these days?","I'm always on the left!","There's an item for everything!","Sorry I can't give credit",string("You've died {0} times!",global.totalDeaths)];
prevPhrase = "";