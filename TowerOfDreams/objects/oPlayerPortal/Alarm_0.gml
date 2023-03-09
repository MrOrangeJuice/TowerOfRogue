/// @description End Level

if(global.inARun)
{
	// Reset side room
	global.sideRoom = rTitle;
	global.sideChestOpened = false;
	global.levelCount++;
	PickNextLevel();
}
else
{
	global.sideRoom = rTitle;
	global.sideChestOpened = false;
	if(room == rHub)
	{
		SlideTransition(TRANS_MODE.GOTO,rTutorial);	
	}
	else if(room == rTutorial)
	{
		SlideTransition(TRANS_MODE.NEXT);
	}
	else if(room == rTutorial2)
	{
		// Restore health
		global.health = global.maxHealth;
		SlideTransition(TRANS_MODE.NEXT);	
		if(!global.tutorialCompleted) global.tutorialCompleted = true;
		Save();
	}
}
instance_destroy();