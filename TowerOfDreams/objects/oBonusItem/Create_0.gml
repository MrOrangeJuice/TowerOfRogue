/// @description Init

analogLeftPrev = false;
analogRightPrev = false;

global.canPause = false;
audio_play_sound(msc_BonusItem,5,true);

itemList = [];
randomize();
newItem = irandom_range(0,array_length(global.itemObjects)-3);

selected = false;
selectedOffset = 0;

itemEaten = false;

itemOffsetX = 0;
itemOffsetY = 0;
itemOffsetYSpeed = 0.3;

// Determine starting selection
currentItem = round((2 + global.itemUpgrades) / 2);

// Populate item list
for(i = 0; i < 2 + global.itemUpgrades; i++)
{
	// Regen item if it's already in the list
	while(array_contains(itemList,newItem))
	{
		newItem = irandom_range(0,array_length(global.itemObjects)-3);
	}
	array_push(itemList,newItem);
}