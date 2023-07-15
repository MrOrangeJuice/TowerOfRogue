/// @description End Level

if(global.inARun)
{
	instance_create_layer(x,y,"Walls",oEndLevel);
}
else
{
	global.pipeSpawned = false;
	global.shopSpawned = false;
	global.pipeY = 0;
	global.shopY = 0;
	global.sideRoom = rTitle;
	global.shopRoom = rTitle;
	global.sideChestOpened = false;
	if(room == rHub)
	{
		if(red)
		{
			global.inARun = true;
			global.item = -1;
			global.passiveItems = [];
			global.levelCount = 3;
			PickNextLevel();
		}
		else
		{
			SlideTransition(TRANS_MODE.GOTO,rTutorial);	
			global.health = global.maxHealth;
		}
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
		audio_stop_sound(msc_Tutorial);
		global.tutorialMusic = false;
		Save();
	}
}
instance_destroy();