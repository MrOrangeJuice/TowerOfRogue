/// @description Init

analogLeftPrev = false;
analogRightPrev = false;

itemList = [];
randomize();
newItem = irandom_range(0,array_length(global.itemObjects)-1);

itemOffsetX = 0;
// Determine starting selection
currentItem = round((2 + global.itemUpgrades) / 2);

// Populate item list
for(i = 0; i < 2 + global.itemUpgrades; i++)
{
	// Regen item if it's already in the list
	while(array_contains(itemList,newItem))
	{
		newItem = irandom_range(0,array_length(global.itemObjects)-1);
	}
	array_push(itemList,newItem);
}