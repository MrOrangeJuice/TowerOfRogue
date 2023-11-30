// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function Load(){
	ini_open("savedata.ini");
	global.tutorialCompleted = ini_read_real("savegame", "tutorialCompleted", 0);
	global.floor1Completed = ini_read_real("savegame", "floor1Completed", 0);
	global.runCompleted = ini_read_real("savegame", "runCompleted", 0);
	global.best1_1 = ini_read_string("savegame", "best1_1", "F");
	global.best1_2 = ini_read_string("savegame", "best1_2", "F");
	global.best1_3 = ini_read_string("savegame", "best1_3", "F");
	global.best1_4 = ini_read_string("savegame", "best1_4", "F");
	global.best1_5 = ini_read_string("savegame", "best1_5", "F");
	global.best1_6 = ini_read_string("savegame", "best1_6", "F");
	global.best2_1 = ini_read_string("savegame", "best2_1", "F");
	global.best2_2 = ini_read_string("savegame", "best2_2", "F");
	global.best2_3 = ini_read_string("savegame", "best2_3", "F");
	global.best2_4 = ini_read_string("savegame", "best2_4", "F");
	global.bestOverall = ini_read_string("savegame", "bestOverall", "F");
	global.overallCoins = ini_read_real("savegame", "overallCoins", 0);
	global.healthUpgrades = ini_read_real("savegame", "healthUpgrades", 0);
	global.redUnlocked = ini_read_real("savegame", "redUnlocked", 0);
	global.greenUnlocked = ini_read_real("savegame", "greenUnlocked", 0);
	global.zombieUnlocked = ini_read_real("savegame", "zombieUnlocked", 0);
	global.goldUnlocked = ini_read_real("savegame", "goldUnlocked", 0);
	global.palette = ini_read_real("savegame", "palette", 0);
	global.volume = ini_read_real("savegame", "volume", 6);
	ini_close();
}