/// @description End Level

if(global.inARun)
{
	instance_create_layer(x,y,"Walls",oEndLevel);
}
else if(global.timeTrial)
{
	SlideTransition(TRANS_MODE.GOTO,rSpeedrunResults);
	global.timeLevel = room;
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
	global.localCoins = 0;
	global.localDamage = 0;
	global.shopItem1 = -1;
	global.shopItem2 = -1;
	global.shopItem3 = -1;
	global.item1Bought = false;
	global.item2Bought = false;
	global.item3Bought = false;
	if(room == rHub)
	{
		if(red)
		{
			global.inARun = true;
			global.item = -1;
			global.passiveItems = [];
			global.levelCount = 3;
			global.armor = 0;
			if(global.itemUpgrades <= 0)
			{
				PickNextLevel();
			}
			else
			{
				SlideTransition(TRANS_MODE.GOTO,rBonusItem);
				audio_stop_sound(msc_Hub);
			}
		}
		else if(yellow)
		{
			global.inARun = true;
			global.item = -1;
			global.passiveItems = [];
			global.levelCount = 6;
			global.armor = 0;
			if(global.itemUpgrades <= 0)
			{
				PickNextLevel();
			}
			else
			{
				SlideTransition(TRANS_MODE.GOTO,rBonusItem);
				audio_stop_sound(msc_Hub);
			}
		}
		else
		{
			SlideTransition(TRANS_MODE.GOTO,rTutorial);	
			global.item = -1;
			global.passiveItems = [];
			global.armor = 0;
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
		global.overallCoins += global.coins;
		global.coins = 0;
		SlideTransition(TRANS_MODE.NEXT);	
		if(!global.tutorialCompleted) global.tutorialCompleted = true;
		audio_stop_sound(msc_TutorialV3);
		audio_stop_sound(msc_TutorialIntro);
		global.tutorialMusic = false;
		Save();
	}
    else if(room == rMemoryZoo)
    {
        if(specificLevel != "")
        {
            global.timeTrial = true;
			global.timeIncrement = true;
			global.overallCoins += global.coins;
			global.coins = 0;
            SlideTransition(TRANS_MODE.GOTO,asset_get_index(specificLevel));
        }
    }
}
instance_destroy();