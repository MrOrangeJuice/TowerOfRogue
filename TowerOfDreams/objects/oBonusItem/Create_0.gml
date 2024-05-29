/// @description Init

analogLeftPrev = false;
analogRightPrev = false;

itemList = [];
newItem = irandom_range(0,array_length(global.itemObjects));

// Populate item list
for(i = 0; i < 2 + global.itemUpgrades; i++)
{
	// Regen item if it's already in the list
	while(array_contains(itemList,newItem))
	{
		newItem = irandom_range(0,array_length(global.itemObjects));
	}
	array_push(itemList,newItem);
}