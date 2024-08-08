// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function CheckForAchievements(){
	// Intermediate Climber
	if(global.floor1Completed)
	{
		if(!steam_get_achievement("BEATFLOOR1"))
		{
			steam_set_achievement("BEATFLOOR1");
		}
	}
	// Advanced Engineer
	if(global.floor2Completed)
	{
		if(!steam_get_achievement("BEATFLOOR2"))
		{
			steam_set_achievement("BEATFLOOR2");
		}
	}
	// Expert Botanist
	if(global.floor3Completed)
	{
		if(!steam_get_achievement("BEATFLOOR3"))
		{
			steam_set_achievement("BEATFLOOR3");
		}
	}
	// Achieve Your Dream
	if(global.runCompleted)
	{
		if(!steam_get_achievement("BEATTHEGAME"))
		{
			steam_set_achievement("BEATTHEGAME");
		}
	}
	// The Nightmare is Over
	if(global.runCompletedHard)
	{
		if(!steam_get_achievement("BEATTHEGAMEHARD"))
		{
			steam_set_achievement("BEATTHEGAMEHARD");
		}
	}
	// Organ Collector
	if(global.healthUpgrades >= 3)
	{
		if(!steam_get_achievement("BUYALLHEARTS"))
		{
			steam_set_achievement("BUYALLHEARTS");
		}
	}
	// Flea Squad
	if(global.itemUpgrades >= 8)
	{
		if(!steam_get_achievement("BUYALLFLEAS"))
		{
			steam_set_achievement("BUYALLFLEAS");
		}
	}
	// Palette Swapper
	if(global.redUnlocked && global.greenUnlocked && global.goldUnlocked && global.zombieUnlocked)
	{
		if(!steam_get_achievement("BUYALLARMOR"))
		{
			steam_set_achievement("BUYALLARMOR");
		}
	}
	// Richard's New Favorite Customer
	if(global.redUnlocked || global.greenUnlocked || global.goldUnlocked || global.zombieUnlocked || global.healthUpgrades >= 1 || global.itemUpgrades >= 1)
	{
		if(!steam_get_achievement("BUYONEITEM"))
		{
			steam_set_achievement("BUYONEITEM");
		}
	}
}