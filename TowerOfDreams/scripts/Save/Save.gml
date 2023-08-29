// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function Save(){
	ini_open("savedata.ini");
	ini_write_real("savegame", "tutorialCompleted", global.tutorialCompleted);
	ini_write_real("savegame", "runCompleted", global.runCompleted);
	ini_write_string("savegame", "best1_1", global.best1_1);
	ini_write_string("savegame", "best1_2", global.best1_2);
	ini_write_string("savegame", "best1_3", global.best1_3);
	ini_write_string("savegame", "best1_4", global.best1_4);
	ini_write_string("savegame", "best1_5", global.best1_5);
	ini_write_string("savegame", "best2_1", global.best2_1);
	ini_write_string("savegame", "best2_2", global.best2_2);
	ini_write_string("savegame", "best2_3", global.best2_3);
	ini_write_string("savegame", "bestOverall", global.bestOverall);
	ini_write_real("savegame", "overallCoins", global.overallCoins);
	ini_write_real("savegame", "healthUpgrades", global.healthUpgrades);
	ini_write_real("savegame", "redUnlocked", global.redUnlocked);
	ini_write_real("savegame", "greenUnlocked", global.greenUnlocked);
	ini_write_real("savegame", "palette", global.palette);
	ini_close();
}