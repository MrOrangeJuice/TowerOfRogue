/// @description End Level

if(global.inARun)
{
	// Reset side room
	global.sideRoom = rTitle;
	global.sideChestOpened = false;
	global.pipeSpawned = false;
	global.pipeY = 0;
	global.levelCount++;
	PickNextLevel();
}
else
{
	global.pipeSpawned = false;
	global.pipeY = 0;
	global.sideRoom = rTitle;
	global.sideChestOpened = false;
	if(room == rHub)
	{
		SlideTransition(TRANS_MODE.GOTO,rTutorial);	
		global.health = global.maxHealth;
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