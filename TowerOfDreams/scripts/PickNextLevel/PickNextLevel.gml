// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function PickNextLevel(){

	// Determine next room
	// If player has beaten six levels, send them back to the hub
	if(global.levelCount >= 6)
	{
		SlideTransition(TRANS_MODE.GOTO,rHub);
		// Reset run
		global.usedArray = [false,false,false,false,false];
		global.usedArray2 = [false,false,false,false,false];
		global.inARun = false;
		global.runCompleted = true;
		global.health = global.maxHealth;
		global.coins = 0;
		global.item = -1;
		global.passiveItems = [];
		global.levelCount = 0;
		global.gobletCombo = 0;
		// Reset instance lists
		global.coinArray = ds_list_create();
		global.enemyArray = ds_list_create();
		audio_stop_sound(msc_Floor1);
		audio_stop_sound(msc_Floor2);
		audio_stop_sound(snd_BoomerangReturn);
		global.floor1Music = false;
		Save();
	}
	// Otherwise, pick a new level that the player hasn't played yet
	else
	{
		levelChoice = 0;
		randomize();
		// Floor 2
		if(global.levelCount >= 3)
		{
			// Transition music
			if(global.levelCount == 3)
			{
				audio_stop_sound(msc_Floor1);
				global.floor1Music = false;
			}
			levelChoice = irandom_range(0,array_length(global.levelArray2)-1);
			// Make sure it picks level that hasn't been used yet
			while(global.usedArray2[levelChoice])
			{
				randomize();
				levelChoice = irandom_range(0,array_length(global.levelArray2)-1);
			}
			// Set level picked to true so it won't be used again
			global.usedArray2[levelChoice] = true;
		
			// Go to level we picked
			SlideTransition(TRANS_MODE.GOTO,global.levelArray2[levelChoice]);
		}
		// Floor 1
		else
		{
			levelChoice = irandom_range(0,array_length(global.levelArray)-1);
			// Make sure it picks level that hasn't been used yet
			while(global.usedArray[levelChoice])
			{
				randomize();
				levelChoice = irandom_range(0,array_length(global.levelArray)-1);
			}
			// Set level picked to true so it won't be used again
			global.usedArray[levelChoice] = true;
		
			// Go to level we picked
			SlideTransition(TRANS_MODE.GOTO,global.levelArray[levelChoice]);
		}
		
		// Reset instance lists
		global.coinArray = ds_list_create();
		global.enemyArray = ds_list_create();
	}
}