/// @description Init

// Replace with sign if all items bought
if(global.item1Bought && global.item2Bought && global.item3Bought)
{
	oSign.visible = true;
	oShopBag.visible = false;
	instance_destroy();
}
else
{
	oSign.visible = false;	
}
bought = false;