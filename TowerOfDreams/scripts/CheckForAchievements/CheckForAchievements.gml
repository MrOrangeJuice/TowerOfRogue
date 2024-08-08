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
	if(global.floor3Completed)
	{
		if(!steam_get_achievement("BEATFLOOR3"))
		{
			steam_set_achievement("BEATFLOOR3");
		}
	}
}