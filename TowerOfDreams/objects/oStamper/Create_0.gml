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

phrases = ["Remember,\n passive items stack!", "You can only hold\none active item!","Tired of the same items?\nTry a reroll!",string("Did you know you've\ndied {0} times",global.totalDeaths)];