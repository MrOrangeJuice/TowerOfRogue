// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function Load(){
	ini_open("savedata.ini");
	global.tutorialCompleted = ini_read_real("savegame", "tutorialCompleted", 0);
	global.runCompleted = ini_read_real("savegame", "runCompleted", 0);
	global.best1_1 = ini_read_string("savegame", "best1_1", 0);
	global.best1_2 = ini_read_string("savegame", "best1_2", 0);
	global.best1_3 = ini_read_string("savegame", "best1_3", 0);
	global.best1_4 = ini_read_string("savegame", "best1_4", 0);
	global.best1_5 = ini_read_string("savegame", "best1_5", 0);
	global.best2_1 = ini_read_string("savegame", "best2_1", 0);
	global.best2_2 = ini_read_string("savegame", "best2_2", 0);
	global.best2_3 = ini_read_string("savegame", "best2_3", 0);
	global.bestOverall = ini_read_string("savegame", "bestOverall", 0);
	global.overallCoins = ini_read_real("savegame", "overallCoins", 0);
	global.healthUpgrades = ini_read_real("savegame", "healthUpgrades", 0);
	ini_close();
}