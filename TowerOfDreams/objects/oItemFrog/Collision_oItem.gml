/// @description Eat Item

if(tongue)
{
	global.overallCoins += global.itemPrices[other.itemId] / 2;
	instance_destroy(other);
}